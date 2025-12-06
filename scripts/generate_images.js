const fs = require('fs');
const path = require('path');
const https = require('https');

const API_KEY = 'AIzaSyD0Sfs9pFrXPhZ9FBt46Flldz3NMGKmr50';
const MODEL = 'gemini-2.5-flash-image-preview';
const API_URL = `https://generativelanguage.googleapis.com/v1beta/models/${MODEL}:generateContent?key=${API_KEY}`;

const prompts = JSON.parse(fs.readFileSync('/home/user/myapp/scripts/image_prompts.json', 'utf-8'));

// Track progress
let completed = 0;
let failed = 0;
let skipped = 0;

// Check for existing progress file
const progressFile = '/home/user/myapp/scripts/generation_progress.json';
let processedPaths = new Set();
if (fs.existsSync(progressFile)) {
  const progress = JSON.parse(fs.readFileSync(progressFile, 'utf-8'));
  processedPaths = new Set(progress.completed);
  console.log(`Resuming from previous progress: ${processedPaths.size} already completed`);
}

function saveProgress() {
  fs.writeFileSync(progressFile, JSON.stringify({
    completed: Array.from(processedPaths),
    timestamp: new Date().toISOString()
  }));
}

function generateImage(prompt, outputPath) {
  return new Promise((resolve, reject) => {
    const fullPath = '/home/user/myapp/' + outputPath;

    // Skip if already exists
    if (fs.existsSync(fullPath)) {
      skipped++;
      console.log(`[SKIP] Already exists: ${outputPath}`);
      resolve();
      return;
    }

    // Skip if already processed
    if (processedPaths.has(outputPath)) {
      skipped++;
      resolve();
      return;
    }

    const enhancedPrompt = `Generate an image: ${prompt}, cute cartoon style, bright colors, simple clean design, suitable for educational app, no text`;

    const data = JSON.stringify({
      contents: [{
        parts: [{
          text: enhancedPrompt
        }]
      }],
      generationConfig: {
        responseModalities: ['image', 'text']
      }
    });

    const options = {
      hostname: 'generativelanguage.googleapis.com',
      port: 443,
      path: `/v1beta/models/${MODEL}:generateContent?key=${API_KEY}`,
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'Content-Length': data.length
      }
    };

    const req = https.request(options, (res) => {
      let body = '';
      res.on('data', chunk => body += chunk);
      res.on('end', () => {
        try {
          const response = JSON.parse(body);

          if (response.candidates && response.candidates[0] && response.candidates[0].content) {
            const parts = response.candidates[0].content.parts;
            for (const part of parts) {
              if (part.inlineData && part.inlineData.data) {
                const buffer = Buffer.from(part.inlineData.data, 'base64');
                fs.writeFileSync(fullPath, buffer);
                completed++;
                processedPaths.add(outputPath);
                console.log(`[OK ${completed}/${prompts.length}] ${outputPath}`);
                resolve();
                return;
              }
            }
          }

          // No image in response
          failed++;
          console.log(`[FAIL] No image data: ${outputPath}`);
          if (response.error) {
            console.log(`  Error: ${response.error.message}`);
          }
          resolve();
        } catch (e) {
          failed++;
          console.log(`[FAIL] Parse error for ${outputPath}: ${e.message}`);
          resolve();
        }
      });
    });

    req.on('error', (e) => {
      failed++;
      console.log(`[FAIL] Request error for ${outputPath}: ${e.message}`);
      resolve();
    });

    req.write(data);
    req.end();
  });
}

async function processAll() {
  console.log(`Starting image generation for ${prompts.length} prompts...`);
  console.log('This will take a while. Press Ctrl+C to stop (progress is saved).\n');

  // Process sequentially to avoid rate limits
  const batchSize = 1;
  const delayBetweenBatches = 5000; // 5 seconds between each request

  for (let i = 0; i < prompts.length; i += batchSize) {
    const batch = prompts.slice(i, i + batchSize);
    const promises = batch.map(p => generateImage(p.prompt, p.path));
    await Promise.all(promises);

    // Save progress after each batch
    saveProgress();

    // Delay between batches
    if (i + batchSize < prompts.length) {
      await new Promise(r => setTimeout(r, delayBetweenBatches));
    }
  }

  console.log(`\n--- Generation Complete ---`);
  console.log(`Completed: ${completed}`);
  console.log(`Failed: ${failed}`);
  console.log(`Skipped: ${skipped}`);
}

processAll().catch(console.error);

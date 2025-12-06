const fs = require('fs');
const https = require('https');

const API_KEY = 'AIzaSyD0Sfs9pFrXPhZ9FBt46Flldz3NMGKmr50';
const MODEL = 'gemini-2.5-flash-image-preview';

const prompts = JSON.parse(fs.readFileSync('/home/user/myapp/scripts/image_prompts.json', 'utf-8'));

// Find only missing images
const missing = prompts.filter(p => {
  const fullPath = '/home/user/myapp/' + p.path;
  return !fs.existsSync(fullPath);
});

console.log(`Found ${missing.length} missing images to generate`);

let completed = 0;
let failed = 0;

function generateImage(prompt, outputPath) {
  return new Promise((resolve) => {
    const fullPath = '/home/user/myapp/' + outputPath;
    const enhancedPrompt = `Generate an image: ${prompt}, cute cartoon style, bright colors, simple clean design, suitable for educational app, no text`;

    const data = JSON.stringify({
      contents: [{ parts: [{ text: enhancedPrompt }] }],
      generationConfig: { responseModalities: ['image', 'text'] }
    });

    const options = {
      hostname: 'generativelanguage.googleapis.com',
      port: 443,
      path: `/v1beta/models/${MODEL}:generateContent?key=${API_KEY}`,
      method: 'POST',
      headers: { 'Content-Type': 'application/json', 'Content-Length': data.length }
    };

    const req = https.request(options, (res) => {
      let body = '';
      res.on('data', chunk => body += chunk);
      res.on('end', () => {
        try {
          const response = JSON.parse(body);
          if (response.candidates?.[0]?.content?.parts) {
            for (const part of response.candidates[0].content.parts) {
              if (part.inlineData?.data) {
                fs.writeFileSync(fullPath, Buffer.from(part.inlineData.data, 'base64'));
                completed++;
                console.log(`[OK ${completed}/${missing.length}] ${outputPath}`);
                resolve();
                return;
              }
            }
          }
          failed++;
          console.log(`[FAIL] No image: ${outputPath}`);
          if (response.error) console.log(`  Error: ${response.error.message}`);
          resolve();
        } catch (e) {
          failed++;
          console.log(`[FAIL] Parse error: ${outputPath}`);
          resolve();
        }
      });
    });

    req.on('error', () => { failed++; console.log(`[FAIL] Request error: ${outputPath}`); resolve(); });
    req.write(data);
    req.end();
  });
}

async function run() {
  for (let i = 0; i < missing.length; i++) {
    const p = missing[i];
    await generateImage(p.prompt, p.path);
    if (i < missing.length - 1) await new Promise(r => setTimeout(r, 5000));
  }
  console.log(`\n--- Done ---\nCompleted: ${completed}\nFailed: ${failed}`);
}

run();

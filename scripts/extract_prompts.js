const fs = require('fs');
const path = require('path');

const lessonsDir = '/home/user/myapp/lib/data/lessons';
const files = fs.readdirSync(lessonsDir).filter(f => f.endsWith('.dart'));

const results = [];

files.forEach(file => {
  const content = fs.readFileSync(path.join(lessonsDir, file), 'utf-8');

  // Match imagePath and imagePrompt pairs (multiline prompt)
  const regex1 = /imagePath:\s*'([^']+)',\s*\n\s*imagePrompt:\s*\n\s*'([^']+)'/g;
  // Match imagePath and imagePrompt pairs (single line prompt)
  const regex2 = /imagePath:\s*'([^']+)',\s*\n\s*imagePrompt:\s*'([^']+)'/g;

  let match;
  while ((match = regex1.exec(content)) !== null) {
    results.push({ path: match[1], prompt: match[2], file: file });
  }
  while ((match = regex2.exec(content)) !== null) {
    // Check if already added
    if (!results.find(r => r.path === match[1])) {
      results.push({ path: match[1], prompt: match[2], file: file });
    }
  }
});

// Save to JSON
fs.writeFileSync('/home/user/myapp/scripts/image_prompts.json', JSON.stringify(results, null, 2));
console.log('Total prompts extracted:', results.length);
console.log('Saved to /home/user/myapp/scripts/image_prompts.json');

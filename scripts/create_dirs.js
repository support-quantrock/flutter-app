const fs = require('fs');
const path = require('path');

const prompts = JSON.parse(fs.readFileSync('/home/user/myapp/scripts/image_prompts.json', 'utf-8'));

const dirs = new Set();
prompts.forEach(p => {
  const dir = path.dirname('/home/user/myapp/' + p.path);
  dirs.add(dir);
});

dirs.forEach(dir => {
  fs.mkdirSync(dir, { recursive: true });
  console.log('Created:', dir);
});

console.log('\nTotal directories created:', dirs.size);

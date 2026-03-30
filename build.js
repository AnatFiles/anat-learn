const fs = require('fs');
const path = require('path');

const imgDir = path.join(__dirname, 'img');
const outputFile = path.join(__dirname, 'images.json');

if (!fs.existsSync(imgDir)) {
  console.error('Error: img directory not found');
  process.exit(1);
}

const files = fs.readdirSync(imgDir);
const images = files
  .filter(file => /\.(png|jpg|jpeg|gif|webp|svg)$/i.test(file))
  .map(file => {
    const stats = fs.statSync(path.join(imgDir, file));
    return {
      name: file,
      size: (stats.size / 1024 / 1024).toFixed(2) + ' MB',
      lastModified: stats.mtime
    };
  });

fs.writeFileSync(outputFile, JSON.stringify(images, null, 2));
console.log(`Successfully generated ${outputFile} with ${images.length} images.`);

const fs = require('fs');
const path = require('path');

const copyFiles = (srcDir, destDir) => {
    fs.readdirSync(srcDir, { withFileTypes: true }).forEach(dirent => {
        const srcPath = path.join(srcDir, dirent.name);
        const destPath = path.join(destDir, dirent.name);

        if (dirent.isDirectory()) {
            fs.mkdirSync(destPath, { recursive: true });
            copyFiles(srcPath, destPath);
        } else if (dirent.isFile() && path.extname(dirent.name) === '.css') {
            fs.copyFileSync(srcPath, destPath);
        } else if (dirent.isFile() && path.extname(dirent.name) === '.mdx') {
            fs.copyFileSync(srcPath, destPath);

        }
    });
};

const src = path.join(__dirname, '../src');
const dest = path.join(__dirname, '../dist');

copyFiles(src, dest);
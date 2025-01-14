import { exec } from 'child_process';
import { promisify } from 'util';
import path from 'path';
import { fileURLToPath } from 'url';
import fs from 'fs';

const execAsync = promisify(exec);
const __dirname = path.dirname(fileURLToPath(import.meta.url));

async function checkLinks() {
  const buildPath = path.resolve(__dirname, '..', 'build');
  
  if (!fs.existsSync(buildPath)) {
    console.error('Build directory does not exist:', buildPath);
    process.exit(1);
  }

  const skipPattern = '(^https://|http://localhost:8080/|http://127\\.0\\.0\\.1:3000/|http://localhost:3000/)';
  
  const command = `npx linkinator "${buildPath}" --recurse --skip "${skipPattern}" --verbosity error`;
  
  try {
    const { stdout, stderr } = await execAsync(command);
    console.log(stdout);
    if (stderr) console.error(stderr);
    process.exit(0);
  } catch (error) {
    if (error.stdout) console.log(error.stdout);
    if (error.stderr) console.error(error.stderr);
    process.exit(1);
  }
}

checkLinks();
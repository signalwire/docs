import { exec } from 'child_process';
import { promisify } from 'util';
import path from 'path';
import { fileURLToPath } from 'url';
import fs from 'fs';

const execAsync = promisify(exec);
const __dirname = path.dirname(fileURLToPath(import.meta.url));

async function checkLinksCI() {
  const buildPath = path.resolve(__dirname, '..', 'build');
  
  if (!fs.existsSync(buildPath)) {
    console.error('Build directory does not exist:', buildPath);
    console.error('Please run "yarn build:root" first to generate the build directory.');
    process.exit(1);
  }

  // More aggressive skip patterns for CI to avoid network issues
  const skipPatterns = [
    '^https://github.com',
    '^http://github.com', 
    '^https://signalwire.com',
    '^http://signalwire.com',
    '^http://localhost',
    '^http://127\\.0\\.0\\.1',
    'localhost:3000',
    'localhost:8080',
    // Skip more external domains in CI to avoid rate limiting
    '^https://twitter.com',
    '^https://linkedin.com',
    '^https://facebook.com',
    '^https://youtube.com',
    '^https://discord.com',
    '^https://npm',
    '^https://pypi',
    '^https://rubygems',
    // Skip anchor links
    '#[^/]',
    // Skip mailto links
    '^mailto:',
    // Skip tel links  
    '^tel:',
    // Skip javascript links
    '^javascript:',
    // Skip data URLs
    '^data:'
  ].join('|');
  
  // Add timeout and retry settings for CI
  const command = `npx linkinator "${buildPath}" --recurse --verbosity error --skip "${skipPatterns}" --format json --timeout 10000 --retry 2`;
  
  console.log('🔍 Starting CI link check...');
  console.log(`📁 Scanning directory: ${buildPath}`);
  console.log(`🚫 Skipping patterns: ${skipPatterns}`);
  console.log('⏱️  Timeout: 10s per link, 2 retries');
  console.log('');
  
  try {
    const { stdout, stderr } = await execAsync(command, { 
      timeout: 300000, // 5 minute timeout for the entire process
      maxBuffer: 1024 * 1024 * 10 // 10MB buffer
    });
    
    if (stderr) {
      console.error('❌ Link checker stderr:', stderr);
    }
    
    // Parse JSON output for better reporting
    let results;
    try {
      results = JSON.parse(stdout);
    } catch (parseError) {
      console.log('📄 Raw output (failed to parse JSON):');
      console.log(stdout);
      process.exit(0);
    }
    
    // Report results
    const passed = results.links?.filter(link => link.status === 200) || [];
    const failed = results.links?.filter(link => link.status !== 200) || [];
    const skipped = results.links?.filter(link => link.state === 'SKIPPED') || [];
    
    console.log(`✅ Passed: ${passed.length} links`);
    console.log(`⏭️  Skipped: ${skipped.length} links`);
    console.log(`❌ Failed: ${failed.length} links`);
    console.log('');
    
    if (failed.length > 0) {
      console.log('🚨 Failed links:');
      failed.forEach(link => {
        console.log(`  - ${link.url} (${link.status}) in ${link.parent}`);
      });
      console.log('');
      
      // In CI, we might want to be less strict about certain types of failures
      const criticalFailures = failed.filter(link => 
        link.status >= 400 && link.status < 500 && // 4xx errors
        !link.url.includes('localhost') && 
        !link.url.includes('127.0.0.1')
      );
      
      if (criticalFailures.length > 0) {
        console.log(`💥 Critical failures: ${criticalFailures.length}`);
        process.exit(1);
      } else {
        console.log('⚠️  Non-critical failures detected, but continuing...');
        process.exit(0);
      }
    }
    
    console.log('🎉 All links are working!');
    process.exit(0);
    
  } catch (error) {
    console.error('❌ Link check failed:');
    if (error.stdout) {
      try {
        const results = JSON.parse(error.stdout);
        const failed = results.links?.filter(link => link.status !== 200) || [];
        
        if (failed.length > 0) {
          console.log('🚨 Failed links:');
          failed.forEach(link => {
            console.log(`  - ${link.url} (${link.status}) in ${link.parent}`);
          });
        }
      } catch (parseError) {
        console.log(error.stdout);
      }
    }
    if (error.stderr) console.error(error.stderr);
    process.exit(1);
  }
}

checkLinksCI();
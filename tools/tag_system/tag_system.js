#!/usr/bin/env node

const fs = require('fs');
const path = require('path');
const matter = require('gray-matter');

// Load configuration
let config;
try {
  // Try to load TypeScript config using ts-node if available
  try {
    require('ts-node/register');
    config = require('./config.ts').config;
  } catch (e) {
    // Fallback to a basic JavaScript config if TypeScript not available
    console.warn('TypeScript not available, using default configuration');
    config = {
      startingDirs: ['../../website/docs/main'],
      allowedExtensions: ['.md', '.mdx'],
      pathTags: {
        '/home/swml': ['swml', 'signalml'],
        '/home/swml/agents-sdk': ['agents-sdk', 'python', 'ai'],
      }
    };
  }
} catch (error) {
  console.error('Error loading configuration:', error.message);
  process.exit(1);
}

// Resolve the starting directories
const STARTING_DIRS = config.startingDirs.map(dir => path.resolve(__dirname, dir));

// ========================================
// Helper Functions
// ========================================

// Check if directories exist
for (const dir of STARTING_DIRS) {
  if (!fs.existsSync(dir)) {
    console.error(`Error: Starting directory does not exist: ${dir}`);
    process.exit(1);
  }
}

// Function to check if a file/folder should be skipped
function shouldSkipPath(name) {
  // Skip files/folders starting with underscore or hidden files
  return name.startsWith('_') || name.startsWith('.');
}

// Function to find all allowed files recursively
function findAllowedFiles(dir, files = []) {
  try {
    const entries = fs.readdirSync(dir, { withFileTypes: true });
    
    for (const entry of entries) {
      // Skip files/folders that start with underscore or are hidden
      if (shouldSkipPath(entry.name)) {
        continue;
      }
      
      const fullPath = path.join(dir, entry.name);
      
      if (entry.isDirectory()) {
        findAllowedFiles(fullPath, files);
      } else if (entry.isFile()) {
        // Check if file has allowed extension
        const hasAllowedExt = config.allowedExtensions.some(ext => 
          entry.name.endsWith(ext)
        );
        
        if (hasAllowedExt) {
          files.push(fullPath);
        }
      }
    }
  } catch (error) {
    console.warn(`Warning: Could not read directory ${dir}: ${error.message}`);
  }
  
  return files;
}

// Function to find the best matching path for a file with recursive inheritance
function findMatchingPath(filePath) {
  // Find which starting directory this file belongs to
  let relativePath = '';
  let startingDir = '';
  
  for (const dir of STARTING_DIRS) {
    if (filePath.startsWith(dir)) {
      relativePath = path.relative(dir, path.dirname(filePath));
      startingDir = dir;
      break;
    }
  }
  
  if (!startingDir) {
    return null; // File doesn't belong to any starting directory
  }
  
  const normalizedPath = '/' + relativePath.replace(/\\/g, '/');
  
  // Find all matching paths (paths that the current path starts with)
  const matchingPaths = Object.keys(config.pathTags).filter(configPath => {
    return normalizedPath.startsWith(configPath);
  });
  
  if (matchingPaths.length === 0) {
    return null;
  }
  
  // Sort by specificity (length) - most specific first
  matchingPaths.sort((a, b) => b.length - a.length);
  
  // Return the most specific matching path (closest parent with config)
  // This implements recursive inheritance: deeper configs override parent configs,
  // but if no deeper config exists, parent config is used
  return matchingPaths[0];
}

// Function to merge and sort tags
function mergeAndSortTags(existingTags, newTags) {
  const merged = [...(existingTags || [])];
  
  // Add new tags that don't already exist
  for (const tag of newTags) {
    if (!merged.includes(tag)) {
      merged.push(tag);
    }
  }
  
  // Sort tags in ascending order
  return merged.sort();
}

// Function to update front matter in a file
function updateFileFrontMatter(filePath) {
  try {
    // Find matching path and get tags
    const matchingPath = findMatchingPath(filePath);
    if (!matchingPath) {
      return { updated: false, reason: 'No matching path configuration found' };
    }
    
    const tagsToAdd = config.pathTags[matchingPath];
    if (!tagsToAdd || tagsToAdd.length === 0) {
      return { updated: false, reason: 'No tags configured for this path' };
    }
    
    // Read file content
    const content = fs.readFileSync(filePath, 'utf8');
    
    // Parse front matter
    const parsed = matter(content);
    
    // Get existing tags and merge with new ones
    const existingTags = parsed.data.tags || [];
    const updatedTags = mergeAndSortTags(existingTags, tagsToAdd);
    
    // Check if anything changed
    if (JSON.stringify(existingTags.sort()) === JSON.stringify(updatedTags)) {
      return { updated: false, reason: 'No new tags to add' };
    }
    
    // Update tags
    parsed.data.tags = updatedTags;
    
    // Convert back to string
    const updatedContent = matter.stringify(parsed.content, parsed.data);
    
    // Write back to file
    fs.writeFileSync(filePath, updatedContent, 'utf8');
    
    return { 
      updated: true, 
      addedTags: updatedTags.length - existingTags.length,
      matchingPath: matchingPath,
      finalTags: updatedTags
    };
  } catch (error) {
    return { updated: false, reason: error.message };
  }
}

// ========================================
// Main Function
// ========================================

function main() {
  console.log('=== Tag System Tool ===\n');
  console.log('Starting directories:', STARTING_DIRS.length);
  STARTING_DIRS.forEach((dir, i) => console.log(`  ${i + 1}. ${dir}`));
  console.log('Allowed extensions:', config.allowedExtensions.join(', '));
  console.log('Configured paths:', Object.keys(config.pathTags).length);
  console.log('\nSearching for files...\n');
  
  // Find all files from all starting directories
  let allFiles = [];
  STARTING_DIRS.forEach(dir => {
    const files = findAllowedFiles(dir);
    allFiles = allFiles.concat(files);
  });
  
  console.log(`Found ${allFiles.length} files to process\n`);
  
  let updatedCount = 0;
  let alreadyUpToDateCount = 0;
  let noConfigCount = 0;
  let errorCount = 0;
  
  // Process each file
  allFiles.forEach((filePath, index) => {
    // Find the most appropriate starting directory for relative path display
    let relativePath = filePath;
    for (const dir of STARTING_DIRS) {
      if (filePath.startsWith(dir)) {
        relativePath = path.relative(dir, filePath);
        break;
      }
    }
    process.stdout.write(`[${index + 1}/${allFiles.length}] Processing ${relativePath}... `);
    
    const result = updateFileFrontMatter(filePath);
    
    if (result.updated) {
      console.log(` Updated (+${result.addedTags} tags) [${result.matchingPath}]`);
      updatedCount++;
    } else if (result.reason === 'No new tags to add') {
      console.log('- Skipped (already has all required tags)');
      alreadyUpToDateCount++;
    } else if (result.reason === 'No matching path configuration found' || result.reason === 'No tags configured for this path') {
      console.log(`- Skipped (${result.reason})`);
      noConfigCount++;
    } else {
      console.log(`- Error (${result.reason})`);
      errorCount++;
    }
  });
  
  // Summary
  console.log('\n=== Summary ===');
  console.log(`Total files found: ${allFiles.length}`);
  console.log(`Files updated with new tags: ${updatedCount}`);
  console.log(`Files already up-to-date: ${alreadyUpToDateCount}`);
  console.log(`Files with no matching config: ${noConfigCount}`);
  console.log(`Files with errors: ${errorCount}`);
  console.log(`\nProcessed: ${updatedCount + alreadyUpToDateCount} of ${allFiles.length} files with valid configs`);
  console.log('\nDone!');
}

// Check if gray-matter is installed
try {
  require.resolve('gray-matter');
} catch (e) {
  console.error('Error: gray-matter package is not installed.');
  console.error('Please run: npm install gray-matter');
  process.exit(1);
}

// Run the script
if (require.main === module) {
  main();
}

module.exports = { main, findMatchingPath, mergeAndSortTags };
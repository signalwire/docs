#!/usr/bin/env node

const fs = require('fs');
const path = require('path');
const matter = require('gray-matter');

// ========================================
// CONFIGURATION - Modify these values
// ========================================
const SEO_CONFIG = {
  // Keywords that will be added to all files
  keywords: [
    'signalwire',
    'agents',
    'sdk',
    'ai',
    'python',
  ],
  
  // Tags that will be added to all files
  tags: [
    'agents-sdk',
    'python'
  ]
};

// Target directory
const TARGET_DIR = path.join(__dirname, '../../website/docs/main/swml/agents-sdk');

// Directories to skip
const SKIP_DIRS = ['_generated', '_temp', '_source'];

// ========================================
// Script Implementation
// ========================================

// Check if directory exists
if (!fs.existsSync(TARGET_DIR)) {
  console.error(`Error: Target directory does not exist: ${TARGET_DIR}`);
  process.exit(1);
}

// Function to check if a path should be skipped
function shouldSkipPath(filePath) {
  return SKIP_DIRS.some(skipDir => filePath.includes(path.sep + skipDir + path.sep));
}

// Function to find all .md and .mdx files recursively
function findMarkdownFiles(dir, files = []) {
  const entries = fs.readdirSync(dir, { withFileTypes: true });
  
  for (const entry of entries) {
    const fullPath = path.join(dir, entry.name);
    
    if (entry.isDirectory()) {
      // Skip certain directories
      if (!SKIP_DIRS.includes(entry.name)) {
        findMarkdownFiles(fullPath, files);
      }
    } else if (entry.isFile() && (entry.name.endsWith('.md') || entry.name.endsWith('.mdx'))) {
      if (!shouldSkipPath(fullPath)) {
        files.push(fullPath);
      }
    }
  }
  
  return files;
}

// Function to merge arrays without duplicates
function mergeArrays(existing, toAdd) {
  const merged = [...(existing || [])];
  for (const item of toAdd) {
    if (!merged.includes(item)) {
      merged.push(item);
    }
  }
  return merged;
}

// Function to update front matter in a file
function updateFileFrontMatter(filePath) {
  try {
    // Read file content
    const content = fs.readFileSync(filePath, 'utf8');
    
    // Parse front matter
    const parsed = matter(content);
    
    // Update or add keywords
    const existingKeywords = parsed.data.keywords || [];
    const newKeywords = mergeArrays(existingKeywords, SEO_CONFIG.keywords);
    
    // Update or add tags
    const existingTags = parsed.data.tags || [];
    const newTags = mergeArrays(existingTags, SEO_CONFIG.tags);
    
    // Check if anything changed
    const keywordsChanged = JSON.stringify(existingKeywords) !== JSON.stringify(newKeywords);
    const tagsChanged = JSON.stringify(existingTags) !== JSON.stringify(newTags);
    
    if (!keywordsChanged && !tagsChanged) {
      return { updated: false, reason: 'No changes needed' };
    }
    
    // Update data
    parsed.data.keywords = newKeywords;
    parsed.data.tags = newTags;
    
    // Convert back to string
    const updatedContent = matter.stringify(parsed.content, parsed.data);
    
    // Write back to file
    fs.writeFileSync(filePath, updatedContent, 'utf8');
    
    return { 
      updated: true, 
      addedKeywords: newKeywords.length - existingKeywords.length,
      addedTags: newTags.length - existingTags.length
    };
  } catch (error) {
    return { updated: false, reason: error.message };
  }
}

// Main function
function main() {
  console.log('=== SEO Metadata Update Script ===\n');
  console.log('Target directory:', TARGET_DIR);
  console.log('Keywords to add:', SEO_CONFIG.keywords.join(', '));
  console.log('Tags to add:', SEO_CONFIG.tags.join(', '));
  console.log('\nSearching for markdown files...\n');
  
  // Find all markdown files
  const files = findMarkdownFiles(TARGET_DIR);
  console.log(`Found ${files.length} markdown files\n`);
  
  let updatedCount = 0;
  let skippedCount = 0;
  let errorCount = 0;
  
  // Process each file
  files.forEach((filePath, index) => {
    const relativePath = path.relative(TARGET_DIR, filePath);
    process.stdout.write(`[${index + 1}/${files.length}] Processing ${relativePath}... `);
    
    const result = updateFileFrontMatter(filePath);
    
    if (result.updated) {
      console.log(`✓ Updated (+${result.addedKeywords} keywords, +${result.addedTags} tags)`);
      updatedCount++;
    } else if (result.reason === 'No changes needed') {
      console.log('- Skipped (already has all keywords/tags)');
      skippedCount++;
    } else {
      console.log(`✗ Error: ${result.reason}`);
      errorCount++;
    }
  });
  
  // Summary
  console.log('\n=== Summary ===');
  console.log(`Total files processed: ${files.length}`);
  console.log(`Files updated: ${updatedCount}`);
  console.log(`Files skipped: ${skippedCount}`);
  console.log(`Errors: ${errorCount}`);
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
main();
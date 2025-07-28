#!/usr/bin/env node

const fs = require("fs");
const path = require("path");
const mustache = require("mustache");

// ========================================
// CONFIGURATION
// ========================================

// Default starting directory (relative to script location)
const DEFAULT_STARTING_DIR = "../../website/docs/main";

// Default depth limit (5 levels deep, -1 for unlimited)
const DEFAULT_DEPTH = 5;

// ========================================
// Helper Functions
// ========================================

// Function to check if a file/folder should be skipped
function shouldSkipPath(name) {
  // Skip files/folders starting with underscore or hidden files
  return name.startsWith("_") || name.startsWith(".");
}

// Function to find all directories recursively with depth control
function findDirectories(
  dir,
  currentDepth = 0,
  maxDepth = DEFAULT_DEPTH,
  relativeTo = dir,
) {
  const directories = [];

  // Check depth limit (-1 means unlimited)
  if (maxDepth !== -1 && currentDepth > maxDepth) {
    return directories;
  }

  try {
    const entries = fs.readdirSync(dir, { withFileTypes: true });

    for (const entry of entries) {
      // Skip files/folders that start with underscore or are hidden
      if (shouldSkipPath(entry.name)) {
        continue;
      }

      const fullPath = path.join(dir, entry.name);

      if (entry.isDirectory()) {
        // Add this directory to the list
        const relativePath =
          "/" + path.relative(relativeTo, fullPath).replace(/\\/g, "/");
        directories.push(relativePath);

        // Recursively find subdirectories
        const subdirs = findDirectories(fullPath, currentDepth + 1, maxDepth, relativeTo);
        directories.push(...subdirs);
      }
    }
  } catch (error) {
    console.warn(`Warning: Could not read directory ${dir}: ${error.message}`);
  }

  return directories;
}

// Function to get next available config template filename
function getNextConfigFilename(baseDir) {
  let counter = 1;
  let filename;

  do {
    filename = path.join(baseDir, `config_template.${counter}.ts`);
    counter++;
  } while (fs.existsSync(filename));

  return filename;
}

// Function to generate TypeScript config template using mustache
function generateConfigTemplate(directories, startingDir) {
  const templatePath = path.join(__dirname, 'config_template.ts');
  const templateContent = fs.readFileSync(templatePath, 'utf8');
  
  const data = {
    startingDir: startingDir,
    directories: directories.map(dir => ({ path: dir }))
  };
  
  return mustache.render(templateContent, data);
}

// ========================================
// Main Function
// ========================================

function main() {
  // Parse command line arguments
  const args = process.argv.slice(2);
  let startingDirArg = DEFAULT_STARTING_DIR;
  let depth = DEFAULT_DEPTH;

  // Parse arguments
  for (let i = 0; i < args.length; i++) {
    const arg = args[i];

    if (arg === "--depth" || arg === "-d") {
      const depthValue = args[i + 1];
      if (depthValue === undefined) {
        console.error("Error: --depth requires a value");
        process.exit(1);
      }
      depth = parseInt(depthValue);
      if (isNaN(depth)) {
        console.error("Error: --depth must be a number");
        process.exit(1);
      }
      i++; // Skip next argument
    } else if (arg === "--help" || arg === "-h") {
      console.log(`
Usage: node create_config_template.js [options]

Options:
  --depth, -d <number>    Maximum depth to scan (default: 5, -1 for unlimited)
  --help, -h             Show this help message

Examples:
  node create_config_template.js
  node create_config_template.js --depth 3
  node create_config_template.js --depth -1
`);
      process.exit(0);
    } else if (!arg.startsWith("--")) {
      // Assume it's a directory path
      startingDirArg = arg;
    }
  }

  // Resolve the starting directory
  const startingDir = path.resolve(__dirname, startingDirArg);

  console.log("=== Config Template Generator ===\\n");
  console.log("Starting directory:", startingDir);
  console.log("Max depth:", depth === -1 ? "unlimited" : depth);

  // Check if directory exists
  if (!fs.existsSync(startingDir)) {
    console.error(`Error: Starting directory does not exist: ${startingDir}`);
    process.exit(1);
  }

  console.log("\\nScanning directories...\\n");

  // Find all directories
  const directories = findDirectories(startingDir, 0, depth);

  // Sort directories alphabetically
  directories.sort();

  console.log(`Found ${directories.length} directories:`);
  directories.forEach((dir) => console.log(`  ${dir}`));

  // Generate config template
  console.log("\\nGenerating config template...");
  const template = generateConfigTemplate(directories, startingDirArg);

  // Get next available filename
  const outputFile = getNextConfigFilename(__dirname);

  // Write template to file
  fs.writeFileSync(outputFile, template, "utf8");

  console.log(`\\n✓ Config template created: ${path.basename(outputFile)}`);
  console.log(`\\nNext steps:`);
  console.log(`1. Edit ${path.basename(outputFile)} to add tags for each path`);
  console.log(`2. Rename it to config.ts when ready`);
  console.log(`3. Run the tag system tool: node tag_system.js`);
}

// Run the script
if (require.main === module) {
  main();
}

module.exports = { findDirectories, generateConfigTemplate, getNextConfigFilename };

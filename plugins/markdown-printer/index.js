const fs = require('fs').promises;
const path = require('path');
const glob = require('glob');
const yaml = require('js-yaml');
const { parseMarkdownFile, DEFAULT_PARSE_FRONT_MATTER } = require('@docusaurus/utils');
const minimatch = require("node:minimatch");

const DEFAULT_OPTIONS = {
  include: "**/*.{md,mdx}",
  ignore: ["**/node_modules/**"],
  path: "docs",
  outputPath: "./",
  outputFilename: "markdownExport.md",
};

function markdownPrinterPlugin(context, options) {
  const finalOptions = { ...DEFAULT_OPTIONS, ...options };

  return {
    name: 'markdown-printer',

    async loadContent() {
      const basePath = path.resolve(context.siteDir, finalOptions.path);
      try {
        let combinedContent = await processDirectory(basePath, basePath, context.siteDir, finalOptions);

        const outputDir = path.resolve(context.siteDir, finalOptions.outputPath);
        await fs.mkdir(outputDir, { recursive: true });
        const outputFile = path.join(outputDir, finalOptions.outputFilename);

        // Check if the output file already exists and read its content
        let existingContent = '';
        try {
          existingContent = await fs.readFile(outputFile, 'utf8');
        } catch (error) {
          if (error.code !== 'ENOENT') {
            throw error;
          }
        }

        // Compare existing content with the new content
        if (existingContent === combinedContent) {
          console.log('No changes detected. The output file will not be overwritten.');
        } else {
          await fs.writeFile(outputFile, combinedContent, { encoding: 'utf8', flag: 'w' });
          console.log(`Combined MDX and MD files written to ${outputFile}`);
        }
      } catch (error) {
        console.error("Error processing content:", error);
      }
    },
  };
}

async function processDirectory(currentDir, baseDir, siteDir, pluginOptions) {
  let combinedContent = '';
  try {
    const includePattern = path.join(currentDir, pluginOptions.include);
    const allFiles = glob.sync(includePattern, {
      ignore: pluginOptions.ignore,
      nodir: true
    }).map(filePath => path.resolve(filePath));

    const normalizedCurrentDir = path.resolve(currentDir);

    const prioritizedFiles = ['introduction.mdx', 'index.mdx']
      .map(fileName => path.join(normalizedCurrentDir, fileName))
      .filter(filePath => allFiles.includes(filePath));

    for (const filePath of prioritizedFiles) {
      console.log(`Processing prioritized file: ${filePath}`);
      combinedContent += await processFile(filePath, siteDir);
    }

    const remainingFiles = allFiles.filter(filePath => !prioritizedFiles.includes(filePath));

    for (const filePath of remainingFiles) {
      if (path.dirname(filePath) === normalizedCurrentDir) {
        console.log(`Processing file: ${filePath}`);
        combinedContent += await processFile(filePath, siteDir);
      }
    }

    const subDirectories = await getSubDirectories(normalizedCurrentDir, pluginOptions);
    for (const directory of subDirectories) {
      combinedContent += await processDirectory(path.join(normalizedCurrentDir, directory), baseDir, siteDir, pluginOptions);
    }
  } catch (error) {
    console.error("Error processing directory:", error);
  }

  return combinedContent;
}

async function processFile(filePath, siteDir) {
  try {
    const fileContent = await fs.readFile(filePath, 'utf8');
    const importsMap = await extractAndLoadImports(fileContent, path.dirname(filePath));

    const { content } = await parseMarkdownFile({
      fileContent,
      filePath,
      parseFrontMatter: DEFAULT_PARSE_FRONT_MATTER,
    });

    const processedContent = processContent(content, importsMap);
    return `<!-- START OF ${path.relative(siteDir, filePath)} -->\n${processedContent}\n<!-- END OF ${path.relative(siteDir, filePath)} -->\n`;
  } catch (error) {
    console.error(`Error processing file ${filePath}:`, error);
    return '';
  }
}

async function getSubDirectories(currentDir, pluginOptions) {
  try {
    const entries = await fs.readdir(currentDir, { withFileTypes: true });
    let directories = entries
      .filter(entry => entry.isDirectory())
      .map(entry => entry.name)
      .filter(name => !pluginOptions.ignore.some(pattern => minimatch(name, pattern)));

    directories = await sortDirectoriesByPosition(currentDir, directories, pluginOptions);

    return directories;
  } catch (error) {
    console.error(`Error reading subdirectories in ${currentDir}:`, error);
    return [];
  }
}

async function sortDirectoriesByPosition(parentDir, directories, pluginOptions) {
  try {
    let positions = await Promise.all(directories.map(async (directory) => {
      const categoryFilePath = path.join(parentDir, directory, '_category_.yaml');
      try {
        const data = yaml.load(await fs.readFile(categoryFilePath, 'utf8'));
        return { name: directory, position: data.position || Infinity };
      } catch (error) {
        return { name: directory, position: Infinity };
      }
    }));

    positions.sort((a, b) => a.position - b.position);
    return positions.map(({ name }) => name);
  } catch (error) {
    console.error(`Error sorting directories by position in ${parentDir}:`, error);
    return directories;
  }
}

async function extractAndLoadImports(content, baseDir) {
  const importRegex = /^import\s+(\w+)\s+from\s+"([^"]+\.mdx?)";$/gm;
  let match;
  const importsMap = {};

  while ((match = importRegex.exec(content)) !== null) {
    const [_, importName, relativePath] = match;
    const fullPath = path.resolve(baseDir, relativePath);
    try {
      importsMap[importName] = await fs.readFile(fullPath, 'utf8');
    } catch (error) {
      console.error(`Error loading import ${relativePath} from ${baseDir}:`, error);
    }
  }

  return importsMap;
}

function processContent(text, importsMap = {}) {
  for (const [importName, importContent] of Object.entries(importsMap)) {
    const componentTagRegex = new RegExp(`<${importName} \\/>`, 'g');
    text = text.replace(componentTagRegex, importContent);
  }

  text = text.replace(/<\s*(?!br\s*)[^>]*\s*\/\s*>/g, "");
  text = text.replace(/^import\s+\w+\s+from\s+"[^"]+";$/gm, "");
  text = text.replace(/<Tabs\b[^>]*>[\s\S]*?<\/Tabs>/g, "");
  text = text.replace(/<TabItem\b[^>]*>[\s\S]*?<\/TabItem>/g, "");
  return text;
}

module.exports = markdownPrinterPlugin;

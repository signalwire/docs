const fs = require("fs");
const path = require("path");
const https = require("https");
const http = require("http");
const { TypeExtractor } = require("./type-extractor");
const { TypeResolver } = require("./type-resolver");
const { MarkdownGenerator } = require("./markdown-generator");
const { config } = require("./config");

async function downloadFile(url) {
  return new Promise((resolve, reject) => {
    const client = url.startsWith("https:") ? https : http;

    client
      .get(url, (response) => {
        if (response.statusCode !== 200) {
          reject(new Error(`Failed to download file: HTTP ${response.statusCode}`));
          return;
        }

        let data = "";
        response.on("data", (chunk) => {
          data += chunk;
        });

        response.on("end", () => {
          try {
            const jsonData = JSON.parse(data);
            resolve(jsonData);
          } catch (error) {
            reject(new Error(`Invalid JSON in downloaded file: ${error.message}`));
          }
        });
      })
      .on("error", (error) => {
        reject(new Error(`Download failed: ${error.message}`));
      });
  });
}

async function loadDocumentation(source) {
  if (source.startsWith("http://") || source.startsWith("https://")) {
    console.log(`Downloading documentation from: ${source}`);
    return await downloadFile(source);
  } else {
    if (!fs.existsSync(source)) {
      throw new Error(`Documentation file not found: ${source}`);
    }
    console.log(`Loading documentation from: ${source}`);
    return JSON.parse(fs.readFileSync(source, "utf8"));
  }
}

async function generateTypesDocumentation() {
  try {
    const source = process.argv[2] || "./documentation.json";
    const outputPath = "./types.md";

    const docData = await loadDocumentation(source);

    console.log("Extracting types...");
    const extractor = new TypeExtractor();
    const rawTypes = extractor.extractAllTypes(docData);

    console.log(`Found ${rawTypes.length} types. Resolving references...`);
    const resolver = new TypeResolver(rawTypes);
    const resolvedTypes = resolver.resolveAllTypes();

    console.log("Generating markdown documentation...");
    const generator = new MarkdownGenerator(resolvedTypes, resolver);
    const markdown = generator.generateMarkdown();

    fs.writeFileSync(outputPath, markdown);
    console.log(`Types documentation generated successfully at: ${outputPath}`);

    const stats = resolver.getStats();
    console.log(`Statistics:`);
    console.log(`  - Total types: ${stats.totalTypes}`);
    console.log(`  - Resolved references: ${stats.resolvedReferences}`);
    console.log(`  - Unresolved references: ${stats.unresolvedReferences}`);
  } catch (error) {
    console.error("Error generating types documentation:", error.message);
    console.error(error.stack);
    process.exit(1);
  }
}

if (require.main === module) {
  generateTypesDocumentation();
}

module.exports = { generateTypesDocumentation };

#!/usr/bin/env node

import { Command } from "commander";
import { generateTypesMarkdown } from "./src/generator.js";
import { loadTypeDocData } from "./src/loader.js";

const program = new Command();

program
  .name("type-doc-gen")
  .description("Generate markdown documentation from TypeDoc JSON files")
  .argument("[input]", "TypeDoc JSON file path or URL", "./documentation.json")
  .option("-o, --output <file>", "Output markdown file", "./types.md")
  .action(async (input, options) => {
    try {
      console.log(`Loading TypeDoc data from: ${input}`);
      const projectData = await loadTypeDocData(input);

      console.log(`Writing to: ${options.output}`);
      await generateTypesMarkdown(projectData, options.output);

      console.log("✅ Documentation generated successfully!");
    } catch (error) {
      console.error("❌ Error generating documentation:", error.message);
      process.exit(1);
    }
  });

program.parse();

#!/usr/bin/env node

import { Command } from "commander";
import { TypeDocLoader } from "./src/core/loader.js";
import { MdxGenerator } from "./src/core/generator.js";
import { Logger } from "./src/utils/logger.js";

const program = new Command();
const logger = new Logger();

program
  .name("types-to-mdx")
  .description(
    "Generate perfect MDX documentation from TypeDoc JSON with proper escaping and cross-linking",
  )
  .argument("[input]", "TypeDoc JSON file path or URL", "./documentation.json")
  .option("-o, --output <file>", "Output MDX file", "./types.mdx")
  .option("-v, --verbose", "Enable verbose logging", false)
  .option("--validate", "Validate MDX output", true)
  .action(async (input, options) => {
    try {
      logger.setVerbose(options.verbose);

      logger.info(`🚀 Starting TypeDoc to MDX conversion`);
      logger.info(`📥 Input: ${input}`);
      logger.info(`📤 Output: ${options.output}`);

      const loader = new TypeDocLoader(logger);
      const generator = new MdxGenerator(logger);

      logger.info(`📖 Loading TypeDoc data...`);
      const projectData = await loader.load(input);
      logger.success(`✅ Loaded project: ${projectData.name || "Unnamed"}`);

      logger.info(`🔧 Generating MDX documentation...`);
      const result = await generator.generate(projectData, {
        outputPath: options.output,
        validate: options.validate,
      });

      if (result.validation && !result.validation.isValid) {
        logger.warn(
          `⚠️  MDX validation found ${result.validation.issues.length} issues:`,
        );
        result.validation.issues.forEach((issue) => logger.warn(`   ${issue}`));
      }

      logger.success(`🎉 Documentation generated successfully!`);
      logger.info(
        `📊 Generated ${result.stats.types} types, ${result.stats.enums} enums, ${result.stats.typeAliases} type aliases`,
      );
    } catch (error) {
      logger.error("❌ Error generating documentation:", error.message);
      if (options.verbose) {
        console.error(error.stack);
      }
      process.exit(1);
    }
  });

program.parse();

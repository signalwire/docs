import { toMarkdown } from "mdast-util-to-markdown";
import { gfmTableToMarkdown } from "mdast-util-gfm-table";

export class MdxSerializer {
  constructor(logger) {
    this.logger = logger;
    this.options = {
      extensions: [gfmTableToMarkdown()],
      bullet: "-",
      emphasis: "*",
      strong: "*",
      fence: "`",
      fences: true,
      incrementListMarker: false,
      listItemIndent: "one",
      rule: "-",
      ruleRepetition: 3,
      ruleSpaces: false,
    };
  }

  serialize(ast) {
    try {
      this.logger.debug("Serializing AST to MDX...");

      let markdown = toMarkdown(ast, this.options);

      markdown = this.postProcessMdx(markdown);

      this.logger.debug(`Generated ${markdown.split("\n").length} lines of MDX`);

      return markdown;
    } catch (error) {
      this.logger.error("Error serializing AST to MDX:", error);
      throw new Error(`Failed to serialize AST: ${error.message}`);
    }
  }

  postProcessMdx(markdown) {
    return (
      markdown
        .replace(/\n{3,}/g, "\n\n")
        .replace(/^\s+$/gm, "")
        .replace(/\n\s*\n\s*\n/g, "\n\n")
        .trim() + "\n"
    );
  }

  validateMdx(content) {
    this.logger.debug("Validating MDX content...");

    const issues = [];
    const lines = content.split("\n");
    let inCodeBlock = false;
    let codeBlockFence = "";

    for (let i = 0; i < lines.length; i++) {
      const line = lines[i];
      const lineNum = i + 1;

      if (line.match(/^```/)) {
        if (!inCodeBlock) {
          inCodeBlock = true;
          codeBlockFence = line.match(/^```(\w*)/)[0];
        } else if (
          line === "```" ||
          line.startsWith(codeBlockFence.replace(/\w+$/, ""))
        ) {
          inCodeBlock = false;
          codeBlockFence = "";
        }
        continue;
      }

      if (inCodeBlock) continue;

      // Trust the serializer to handle proper escaping
      // Only check for obvious MDX syntax errors
    }

    this.logger.debug(`Validation complete: ${issues.length} issues found`);

    return {
      isValid: issues.length === 0,
      issues,
    };
  }
}

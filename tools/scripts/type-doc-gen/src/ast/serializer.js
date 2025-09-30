import { toMarkdown } from "mdast-util-to-markdown";
import { gfmTable } from "mdast-util-gfm-table";
import { gfm } from "mdast-util-gfm";

export class MdxSerializer {
  constructor() {
    this.options = {
      extensions: [gfm(), gfmTable()],
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
      let markdown = toMarkdown(ast, this.options);

      markdown = this.postProcessMdx(markdown);

      return markdown;
    } catch (error) {
      console.error("Error serializing AST to MDX:", error);
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

      if (line.includes("{") && !line.includes("```") && !line.match(/\{#[\w-]+\}/)) {
        const unescapedBraces = line.match(/(?<!\\)\{(?!#[\w-]+\})/g);
        if (unescapedBraces) {
          issues.push(`Line ${lineNum}: Unescaped opening brace: ${line.trim()}`);
        }
      }

      if (line.includes("}") && !line.includes("```") && !line.match(/\{#[\w-]+\}/)) {
        const unescapedBraces = line.match(/(?<!\\)\}(?<!#[\w-]+\})/g);
        if (unescapedBraces) {
          issues.push(`Line ${lineNum}: Unescaped closing brace: ${line.trim()}`);
        }
      }

      if (line.includes("<") && !line.includes("```") && !line.includes("&lt;")) {
        issues.push(`Line ${lineNum}: Unescaped < character: ${line.trim()}`);
      }

      if (line.includes(">") && !line.includes("```") && !line.includes("&gt;")) {
        issues.push(`Line ${lineNum}: Unescaped > character: ${line.trim()}`);
      }
    }

    return {
      isValid: issues.length === 0,
      issues,
    };
  }
}

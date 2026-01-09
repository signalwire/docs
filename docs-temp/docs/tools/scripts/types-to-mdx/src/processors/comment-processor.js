import { fromMarkdown } from "mdast-util-from-markdown";

export class CommentProcessor {
  constructor(logger) {
    this.logger = logger;
  }

  processComment(comment) {
    if (!comment) return null;

    try {
      let text = "";

      if (comment.summary) {
        text += this.processSummary(comment.summary);
      }

      if (comment.blockTags) {
        const additionalText = this.processBlockTags(comment.blockTags);
        if (additionalText) {
          text += text ? "\n\n" + additionalText : additionalText;
        }
      }

      const cleanText = this.cleanupText(text);

      if (!cleanText) return null;

      // Parse the markdown content into AST nodes
      try {
        const ast = fromMarkdown(cleanText);
        // Return the children of the root node (skip the root wrapper)
        return ast.children && ast.children.length > 0 ? ast.children : null;
      } catch (parseError) {
        this.logger.warn(
          `Failed to parse markdown comment, using as text: ${parseError.message}`,
        );
        // Fallback to plain text if markdown parsing fails
        return [{ type: "paragraph", children: [{ type: "text", value: cleanText }] }];
      }
    } catch (error) {
      this.logger.warn(`Error processing comment: ${error.message}`);
      return null;
    }
  }

  // Get plain text version for table cells
  processCommentAsText(comment) {
    if (!comment) return "";

    try {
      let text = "";

      if (comment.summary) {
        text += this.processSummary(comment.summary);
      }

      if (comment.blockTags) {
        const additionalText = this.processBlockTags(comment.blockTags);
        if (additionalText) {
          text += text ? " " + additionalText : additionalText;
        }
      }

      return this.cleanupText(text);
    } catch (error) {
      this.logger.warn(`Error processing comment as text: ${error.message}`);
      return "";
    }
  }

  processSummary(summary) {
    if (!Array.isArray(summary)) return "";

    return summary
      .map((part) => this.processCommentPart(part))
      .join("")
      .trim();
  }

  processBlockTags(blockTags) {
    const relevantTags = blockTags.filter(
      (tag) =>
        tag.tag === "@description" || tag.tag === "@example" || tag.tag === "@remarks",
    );

    return relevantTags
      .map((tag) => this.processBlockTag(tag))
      .filter((text) => text)
      .join("\n\n");
  }

  processBlockTag(tag) {
    if (!tag.content || !Array.isArray(tag.content)) return "";

    const content = tag.content
      .map((part) => this.processCommentPart(part))
      .join("")
      .trim();

    if (tag.tag === "@example" && content) {
      return `**Example:**\n\n${content}`;
    }

    return content;
  }

  processCommentPart(part) {
    if (!part || typeof part !== "object") return "";

    if (part.kind === "text") {
      return part.text || "";
    }

    if (part.kind === "code") {
      return `\`${part.text || ""}\``;
    }

    if (part.kind === "inline-tag") {
      return this.processInlineTag(part);
    }

    return part.text || "";
  }

  processInlineTag(tag) {
    if (!tag) return "";

    if (tag.tag === "@link" || tag.tag === "@linkcode") {
      return this.processLinkTag(tag);
    }

    if (tag.tag === "@param" || tag.tag === "@returns") {
      return "";
    }

    return tag.text || "";
  }

  processLinkTag(tag) {
    if (!tag.text) return "";

    const linkMatch = tag.text.match(/^([^|]+)(?:\|(.+))?$/);
    if (linkMatch) {
      const target = linkMatch[1].trim();
      const displayText = linkMatch[2] ? linkMatch[2].trim() : target;

      const anchor = target.toLowerCase().replace(/[^a-z0-9]/g, "-");
      return `[${displayText}](#${anchor})`;
    }

    return tag.text;
  }

  cleanupText(text) {
    return text
      .replace(/\n\s*\n\s*\n/g, "\n\n")
      .replace(/^\s+|\s+$/g, "")
      .trim();
  }
}

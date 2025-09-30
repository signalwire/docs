import { u } from "unist-builder";

export class MdxAstBuilder {
  constructor() {
    this.root = u("root", []);
  }

  heading(level, text, id = null) {
    const headingNode = u("heading", { depth: level }, [
      u("text", this.escapeText(text)),
    ]);

    if (id) {
      headingNode.data = {
        hProperties: { id },
      };
    }

    return headingNode;
  }

  paragraph(children) {
    return u("paragraph", Array.isArray(children) ? children : [children]);
  }

  text(value) {
    return u("text", this.escapeText(value));
  }

  code(value, lang = null) {
    return u("code", { lang }, this.escapeCode(value));
  }

  inlineCode(value) {
    return u("inlineCode", this.escapeCode(value));
  }

  link(url, text) {
    return u("link", { url }, [u("text", this.escapeText(text))]);
  }

  table(headers, rows) {
    const headerRow = u(
      "tableRow",
      headers.map((header) => u("tableCell", [this.parseInlineContent(header)])),
    );

    const bodyRows = rows.map((row) =>
      u(
        "tableRow",
        row.map((cell) => u("tableCell", [this.parseInlineContent(cell)])),
      ),
    );

    return u("table", { align: [] }, [headerRow, ...bodyRows]);
  }

  list(items, ordered = false) {
    const listItems = items.map((item) =>
      u("listItem", [
        typeof item === "string" ? this.paragraph([this.text(item)]) : item,
      ]),
    );

    return u("list", { ordered, spread: false }, listItems);
  }

  parseInlineContent(content) {
    if (!content) return this.text("");

    if (typeof content !== "string") return content;

    if (this.isComplexType(content)) {
      return this.inlineCode(content);
    }

    const linkMatches = content.match(/\[([^\]]+)\]\(([^)]+)\)/g);
    if (linkMatches) {
      const parts = [];
      let lastIndex = 0;

      linkMatches.forEach((match) => {
        const index = content.indexOf(match, lastIndex);

        if (index > lastIndex) {
          parts.push(this.text(content.slice(lastIndex, index)));
        }

        const linkMatch = match.match(/\[([^\]]+)\]\(([^)]+)\)/);
        if (linkMatch) {
          parts.push(this.link(linkMatch[2], linkMatch[1]));
        }

        lastIndex = index + match.length;
      });

      if (lastIndex < content.length) {
        parts.push(this.text(content.slice(lastIndex)));
      }

      return parts.length === 1 ? parts[0] : u("paragraph", parts);
    }

    if (content.startsWith("`") && content.endsWith("`")) {
      return this.inlineCode(content.slice(1, -1));
    }

    return this.text(content);
  }

  isComplexType(text) {
    return (
      text.includes("<") ||
      text.includes(">") ||
      text.includes("{") ||
      text.includes("}") ||
      text.includes("Record<") ||
      text.includes("Omit<") ||
      text.includes("Pick<") ||
      text.includes("Partial<") ||
      text.includes(" & ") ||
      (text.includes(" | ") && text.length > 30)
    );
  }

  escapeText(text) {
    if (!text) return "";

    return String(text)
      .replace(/\\/g, "\\\\")
      .replace(/\*/g, "\\*")
      .replace(/_/g, "\\_")
      .replace(/\[/g, "\\[")
      .replace(/\]/g, "\\]")
      .replace(/\(/g, "\\(")
      .replace(/\)/g, "\\)")
      .replace(/!/g, "\\!")
      .replace(/&/g, "&amp;")
      .replace(/</g, "&lt;")
      .replace(/>/g, "&gt;");
  }

  escapeCode(text) {
    if (!text) return "";
    return String(text);
  }

  build() {
    return this.root;
  }

  addChild(node) {
    this.root.children.push(node);
    return this;
  }

  addChildren(nodes) {
    this.root.children.push(...nodes);
    return this;
  }
}

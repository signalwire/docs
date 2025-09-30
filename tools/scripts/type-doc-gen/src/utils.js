export function escapeMarkdown(text) {
  if (!text) return "";

  // Only escape the most problematic characters for markdown, preserve backticks for code
  return text.replace(/\*/g, "\\*").replace(/_/g, "\\_").replace(/#/g, "\\#");
}

export function formatTypeString(type, allTypeNames = new Set()) {
  if (!type) return "unknown";

  if (typeof type === "string") {
    return linkifyType(type, allTypeNames);
  }

  if (type.type === "intrinsic") {
    return linkifyType(type.name, allTypeNames);
  }

  if (type.type === "reference") {
    let result = linkifyType(type.name, allTypeNames);

    // Handle type arguments for generic types like Omit<T, K>, Array<T>, etc.
    if (type.typeArguments && type.typeArguments.length > 0) {
      const args = type.typeArguments
        .map((arg) => formatTypeString(arg, allTypeNames))
        .join(", ");
      result += `<${args}>`;
    }

    return result;
  }

  if (type.type === "array") {
    return `${formatTypeString(type.elementType, allTypeNames)}[]`;
  }

  if (type.type === "union") {
    return type.types.map((t) => formatTypeString(t, allTypeNames)).join(" | ");
  }

  if (type.type === "intersection") {
    return type.types.map((t) => formatTypeString(t, allTypeNames)).join(" & ");
  }

  if (type.type === "literal") {
    return `\`${String(type.value)}\``;
  }

  if (type.type === "reflection") {
    if (type.declaration && type.declaration.signatures) {
      // Handle method signatures
      const signature = type.declaration.signatures[0]; // Use first signature
      return formatMethodSignature(signature, allTypeNames);
    }
    if (type.declaration && type.declaration.children) {
      return "Object";
    }
  }

  return linkifyType(type.toString?.() || "unknown", allTypeNames);
}

export function formatMethodSignature(signature, allTypeNames = new Set()) {
  if (!signature) return "Method";

  let result = "(";

  // Add parameters
  if (signature.parameters && signature.parameters.length > 0) {
    const params = signature.parameters.map((param) => {
      let paramStr = param.name;
      if (param.flags?.isOptional || param.defaultValue !== undefined) {
        paramStr += "?";
      }
      if (param.type) {
        paramStr += ": " + formatTypeString(param.type, allTypeNames);
      }
      return paramStr;
    });
    result += params.join(", ");
  }

  result += ")";

  // Add return type
  if (signature.type) {
    result += " => " + formatTypeString(signature.type, allTypeNames);
  }

  return result;
}

export function getCommentText(comment) {
  if (!comment) return "";

  let text = "";

  if (comment.summary) {
    text += comment.summary
      .map((part) => part.text || "")
      .join("")
      .trim();
  }

  if (comment.blockTags) {
    comment.blockTags.forEach((tag) => {
      if (tag.tag === "@description" && tag.content) {
        text +=
          " " +
          tag.content
            .map((part) => part.text || "")
            .join("")
            .trim();
      }
    });
  }

  // Don't escape markdown in comments as they may contain code blocks
  return text.trim();
}

export function sortByName(a, b) {
  return a.name.localeCompare(b.name);
}

export function linkifyType(typeString, allTypeNames = new Set()) {
  if (!typeString || !allTypeNames.size) return typeString;

  // Create a regex that matches any of the type names as whole words
  const typeNamesArray = Array.from(allTypeNames);
  const regex = new RegExp(`\\b(${typeNamesArray.map(escapeRegex).join("|")})\\b`, "g");

  return typeString.replace(regex, (match) => {
    if (allTypeNames.has(match)) {
      const anchor = match.toLowerCase().replace(/[^a-z0-9]/g, "-");
      return `[${match}](#${anchor})`;
    }
    return match;
  });
}

export function escapeRegex(string) {
  return string.replace(/[.*+?^${}()|[\]\\]/g, "\\$&");
}

export function escapeTableCell(text) {
  if (!text) return "";

  // Clean up the text first
  let cleaned = text.replace(/\n/g, " ").replace(/\r/g, "").trim();

  // Apply MDX escaping
  let escaped = escapeForMDX(cleaned);

  // Additional table-specific escaping - escape pipes that aren't in code blocks
  if (!escaped.startsWith("`") && !escaped.startsWith("```")) {
    escaped = escaped.replace(/\|/g, "\\|");
  }

  return escaped;
}

export function escapeTypeForDisplay(text) {
  if (!text) return "";

  // Clean up the text
  let cleaned = text.replace(/\n/g, " ").replace(/\r/g, "").trim();

  // Use the MDX escaping function for proper handling
  return escapeForMDX(cleaned);
}

export function escapeForMDX(text) {
  if (!text) return "";

  // For complex TypeScript syntax, wrap in code blocks to avoid MDX parsing issues
  if (
    text.includes("<") ||
    text.includes(">") ||
    text.includes("{") ||
    text.includes("}") ||
    text.includes("[k in keyof") ||
    text.includes("Record<") ||
    text.includes("Omit<") ||
    text.includes("Pick<") ||
    text.includes("Partial<") ||
    text.includes("Required<") ||
    text.includes(" & ") ||
    (text.includes(" | ") && text.length > 50) // Only for complex union types
  ) {
    // Use inline code for shorter expressions, code blocks for complex ones
    if (text.length > 100 || text.includes("\n")) {
      return "```typescript\n" + text + "\n```";
    } else {
      return "`" + text + "`";
    }
  }

  // For simpler text, just escape problematic characters
  return text
    .replace(/</g, "&lt;")
    .replace(/>/g, "&gt;")
    .replace(/\{/g, "&#123;")
    .replace(/\}/g, "&#125;");
}

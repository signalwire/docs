const { config } = require("./config");
const { TypeFormatter } = require("./type-formatter");

class MarkdownGenerator {
  constructor(types, resolver) {
    this.types = types;
    this.resolver = resolver;
    this.formatter = new TypeFormatter(resolver);
  }

  generateMarkdown() {
    const typesByKind = this.organizeTypesByKind();

    let markdown = "# Types\n\n";

    if (typesByKind.interfaces.length > 0) {
      markdown += "## Interfaces\n\n";
      typesByKind.interfaces.forEach((type) => {
        markdown += this.generateTypeSection(type);
      });
    }

    if (typesByKind.types.length > 0) {
      markdown += "## Type Aliases\n\n";
      typesByKind.types.forEach((type) => {
        markdown += this.generateTypeSection(type);
      });
    }

    if (typesByKind.enums.length > 0) {
      markdown += "## Enums\n\n";
      typesByKind.enums.forEach((type) => {
        markdown += this.generateTypeSection(type);
      });
    }

    if (typesByKind.variables.length > 0) {
      markdown += "## Constants\n\n";
      typesByKind.variables.forEach((type) => {
        markdown += this.generateTypeSection(type);
      });
    }

    if (typesByKind.functions.length > 0) {
      markdown += "## Functions\n\n";
      typesByKind.functions.forEach((type) => {
        markdown += this.generateTypeSection(type);
      });
    }

    if (typesByKind.classes.length > 0) {
      markdown += "## Classes\n\n";
      typesByKind.classes.forEach((type) => {
        markdown += this.generateTypeSection(type);
      });
    }

    return markdown;
  }

  organizeTypesByKind() {
    const organized = {
      interfaces: [],
      types: [],
      enums: [],
      variables: [],
      functions: [],
      classes: [],
    };

    this.types.forEach((type) => {
      switch (type.kind) {
        case "interface":
          organized.interfaces.push(type);
          break;
        case "type-alias":
          organized.types.push(type);
          break;
        case "enum":
          organized.enums.push(type);
          break;
        case "variable":
          organized.variables.push(type);
          break;
        case "function":
          organized.functions.push(type);
          break;
        case "class":
          organized.classes.push(type);
          break;
      }
    });

    Object.keys(organized).forEach((key) => {
      organized[key].sort((a, b) => a.name.localeCompare(b.name));
    });

    return organized;
  }

  generateTypeSection(type) {
    let section = `### ${type.name}\n\n`;

    const comment = this.formatComment(type.comment);
    if (comment) {
      section += `${comment}\n\n`;
    }

    if (type.kind === "type-alias") {
      section += this.generateTypeAliasSection(type);
    } else if (type.kind === "enum") {
      section += this.generateEnumSection(type);
    } else if (type.kind === "variable") {
      section += this.generateVariableSection(type);
    } else if (type.kind === "function") {
      section += this.generateFunctionSection(type);
    } else if (type.children && type.children.length > 0) {
      section += this.generatePropertiesTable(type);
    }

    section += this.generateAdditionalSections(type);
    section += this.generateSourceLink(type);
    section += "---\n\n";

    return section;
  }

  generateTypeAliasSection(type) {
    if (type.isAliasOf) {
      let section = `This is an alias for [${type.isAliasOf}](#${this.resolver.createAnchor(type.isAliasOf)}).\n\n`;
      if (type.mainTypeDescription) {
        section += `${type.mainTypeDescription}\n\n`;
      }
      return section;
    } else {
      const typeStr = this.formatter.formatTypeForCodeBlock(type.type);
      return `**Type:** ${typeStr}\n\n`;
    }
  }

  generateVariableSection(type) {
    const typeStr = this.formatter.formatTypeForCodeBlock(type.type);
    return `**Type:** ${typeStr}\n\n`;
  }

  generateFunctionSection(type) {
    if (!type.signatures || type.signatures.length === 0) {
      return "**Function**\n\n";
    }

    let section = "";
    type.signatures.forEach((sig, index) => {
      if (index > 0) section += "\n**Overload:**\n\n";

      const params = sig.parameters
        ? sig.parameters
            .map((p) => {
              const optional = p.flags?.isOptional ? "?" : "";
              const paramType = this.formatter.formatTypeForCodeBlock(p.type);
              return `${p.name}${optional}: ${paramType}`;
            })
            .join(", ")
        : "";

      const returnType = sig.type
        ? this.formatter.formatTypeForCodeBlock(sig.type)
        : "void";

      section += `**Signature:** (${params}) => ${returnType}\n\n`;

      if (sig.comment) {
        const sigComment = this.formatComment(sig.comment);
        if (sigComment) {
          section += `${sigComment}\n\n`;
        }
      }
    });

    return section;
  }

  generateEnumSection(type) {
    let section = "**Values:**\n\n";

    if (type.children) {
      type.children.forEach((child) => {
        const value =
          child.type?.value !== undefined ? ` = ${JSON.stringify(child.type.value)}` : "";

        const childComment = this.formatComment(child.comment);
        const description = childComment ? ` - ${childComment}` : "";

        section += `- **${child.name}**${value}${description}\n`;
      });
    }

    section += "\n";
    return section;
  }

  generatePropertiesTable(type) {
    const properties = type.children.filter(
      (child) => child.kind === config.KIND.PROPERTY,
    );

    if (properties.length === 0) return "";

    const tableHeaders = ["Property", "Type", "Required", "Description"];
    const tableRows = [];

    properties.forEach((child) => {
      const optional = child.flags?.isOptional ? "?" : "";
      const readonly = child.flags?.isReadonly ? "readonly " : "";
      const isRequired = !child.flags?.isOptional ? "Yes" : "No";

      let childComment = this.formatComment(child.comment) || "";

      if (
        !childComment &&
        child.type &&
        child.type.type === "reference" &&
        child.type.name
      ) {
        const referencedType = this.resolver.findTypeByReference(child.type.name);
        if (referencedType) {
          childComment = this.formatComment(referencedType.comment) || "";
        }
      }

      childComment = this.enhanceDescription(child, childComment);

      const typeStr = this.formatter.formatTypeForTable(child.type);

      tableRows.push([
        `${readonly}**${child.name}**${optional}`,
        typeStr,
        isRequired,
        childComment,
      ]);
    });

    return this.createMarkdownTable(tableHeaders, tableRows);
  }

  enhanceDescription(child, description) {
    if (!child.comment || !child.comment.blockTags) return description;

    const additionalInfo = [];

    child.comment.blockTags.forEach((tag) => {
      if (tag.tag === "@default" && tag.content) {
        const defaultValue = tag.content
          .map((part) => part.text || "")
          .join("")
          .trim();
        additionalInfo.push(`Default: ${defaultValue}`);
      } else if (tag.tag === "@deprecated" && tag.content) {
        const deprecationNote = tag.content
          .map((part) => part.text || "")
          .join("")
          .trim();
        additionalInfo.push(`**Deprecated**: ${deprecationNote}`);
      } else if (tag.tag === "@example" && tag.content) {
      }
    });

    if (additionalInfo.length > 0) {
      description = description
        ? `${description} ${additionalInfo.join(". ")}`
        : additionalInfo.join(". ");
    }

    return description;
  }

  generateAdditionalSections(type) {
    let sections = "";

    if (type.comment && type.comment.blockTags) {
      const paramTags = type.comment.blockTags.filter((tag) => tag.tag === "@param");
      if (paramTags.length > 0) {
        sections += "#### Parameters\n\n";
        const paramHeaders = ["Parameter", "Description"];
        const paramRows = paramTags.map((param) => [
          `**${param.name || ""}**`,
          param.content ? param.content.map((part) => part.text || "").join("") : "",
        ]);
        sections += this.createMarkdownTable(paramHeaders, paramRows);
      }

      const exampleTag = type.comment.blockTags.find((tag) => tag.tag === "@example");
      if (exampleTag && exampleTag.content) {
        sections += "#### Example\n\n";
        sections += "```typescript\n";
        sections += exampleTag.content.map((part) => part.text || "").join("");
        sections += "\n```\n\n";
      }

      const returnsTag = type.comment.blockTags.find((tag) => tag.tag === "@returns");
      if (returnsTag && returnsTag.content) {
        sections += "#### Returns\n\n";
        sections += returnsTag.content.map((part) => part.text || "").join("");
        sections += "\n\n";
      }
    }

    return sections;
  }

  generateSourceLink(type) {
    if (!type.sources || type.sources.length === 0) return "";

    const source = type.sources[0];
    const link = `[${source.fileName}:${source.line}](${config.GITHUB_REPO}/blob/main/${source.fileName}#L${source.line})`;

    return `**Source:** ${link}\n\n`;
  }

  createMarkdownTable(headers, rows) {
    if (rows.length === 0) return "";

    let table = "| " + headers.join(" | ") + " |\n";
    table += "| " + headers.map(() => "---").join(" | ") + " |\n";

    rows.forEach((row) => {
      const escapedRow = row.map((cell) =>
        cell.replace(/\|/g, "\\|").replace(/\n/g, " "),
      );
      table += "| " + escapedRow.join(" | ") + " |\n";
    });

    return table + "\n";
  }

  formatComment(comment) {
    if (!comment) return "";

    let text = "";
    if (comment.summary) {
      text += comment.summary.map((part) => part.text || "").join("");
    }

    return text.trim();
  }
}

module.exports = { MarkdownGenerator };

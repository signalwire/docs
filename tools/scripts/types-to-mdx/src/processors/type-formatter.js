export class TypeFormatter {
  constructor(logger) {
    this.logger = logger;
    this.allTypeNames = new Set();
  }

  setTypeNames(typeNames) {
    this.allTypeNames = typeNames;
  }

  formatType(type) {
    if (!type) return "unknown";

    try {
      return this.formatTypeInternal(type, false, false);
    } catch (error) {
      this.logger.warn(`Error formatting type: ${error.message}`);
      return "unknown";
    }
  }

  formatTypeForTable(type) {
    if (!type) return "unknown";

    try {
      return this.formatTypeInternal(type, true, true);
    } catch (error) {
      this.logger.warn(`Error formatting type for table: ${error.message}`);
      return "unknown";
    }
  }

  formatTypeInternal(type, forTable = false, forceSingleLine = false) {
    if (typeof type === "string") {
      return forTable ? type : this.linkifyType(type);
    }

    if (type.type === "intrinsic") {
      return forTable ? type.name : this.linkifyType(type.name);
    }

    if (type.type === "reference") {
      let result = forTable ? type.name : this.linkifyType(type.name);

      if (type.typeArguments && type.typeArguments.length > 0) {
        const args = type.typeArguments
          .map((arg) => this.formatTypeInternal(arg, forTable, forceSingleLine))
          .join(", ");
        result += `<${args}>`;
      }

      return result;
    }

    if (type.type === "array") {
      return `${this.formatTypeInternal(type.elementType, forTable, forceSingleLine)}[]`;
    }

    if (type.type === "union") {
      const types = type.types.map((t) =>
        this.formatTypeInternal(t, forTable, forceSingleLine),
      );

      if (forTable || forceSingleLine) {
        return types.join(" | ");
      }

      if (types.length > 3 || types.join(" | ").length > 60) {
        return types.join(" |\n  ");
      }

      return types.join(" | ");
    }

    if (type.type === "intersection") {
      const types = type.types.map((t) =>
        this.formatTypeInternal(t, forTable, forceSingleLine),
      );
      return types.join(" & ");
    }

    if (type.type === "literal") {
      if (typeof type.value === "string") {
        return `"${type.value}"`;
      }
      return `${type.value}`;
    }

    if (type.type === "reflection") {
      return this.formatReflectionType(type, forTable, forceSingleLine);
    }

    if (type.type === "tuple") {
      const elements = type.elements.map((el) =>
        this.formatTypeInternal(el, forTable, forceSingleLine),
      );
      return `[${elements.join(", ")}]`;
    }

    if (type.type === "conditional") {
      const checkType = this.formatTypeInternal(
        type.checkType,
        forTable,
        forceSingleLine,
      );
      const extendsType = this.formatTypeInternal(
        type.extendsType,
        forTable,
        forceSingleLine,
      );
      const trueType = this.formatTypeInternal(type.trueType, forTable, forceSingleLine);
      const falseType = this.formatTypeInternal(
        type.falseType,
        forTable,
        forceSingleLine,
      );
      return `${checkType} extends ${extendsType} ? ${trueType} : ${falseType}`;
    }

    if (type.type === "mapped") {
      return this.formatMappedType(type, forTable, forceSingleLine);
    }

    if (type.type === "templateLiteral") {
      return this.formatTemplateLiteral(type, forTable, forceSingleLine);
    }

    const fallbackType = type.toString?.() || "unknown";
    return forTable ? fallbackType : this.linkifyType(fallbackType);
  }

  formatReflectionType(type, forTable = false, forceSingleLine = false) {
    if (type.declaration && type.declaration.signatures) {
      const signature = type.declaration.signatures[0];
      return this.formatMethodSignature(signature, forTable, forceSingleLine);
    }

    if (type.declaration && type.declaration.children) {
      const properties = type.declaration.children
        .map((child) => {
          const propType = this.formatTypeInternal(child.type, forTable, forceSingleLine);
          const optional = child.flags?.isOptional ? "?" : "";
          return `${child.name}${optional}: ${propType}`;
        })
        .join("; ");

      return `{ ${properties} }`;
    }

    return "object";
  }

  formatMappedType(type, forTable = false, forceSingleLine = false) {
    const parameter = type.parameter || "K";
    const parameterConstraint = type.parameterConstraint
      ? ` in ${this.formatTypeInternal(type.parameterConstraint, forTable, forceSingleLine)}`
      : "";
    const nameType = type.nameType
      ? ` as ${this.formatTypeInternal(type.nameType, forTable, forceSingleLine)}`
      : "";
    const templateType = this.formatTypeInternal(
      type.templateType,
      forTable,
      forceSingleLine,
    );
    const optional = type.readonlyModifier ? "readonly " : "";
    const questionToken = type.optionalModifier ? "?" : "";

    return `{ ${optional}[${parameter}${parameterConstraint}]${nameType}${questionToken}: ${templateType} }`;
  }

  formatTemplateLiteral(type, forTable = false, forceSingleLine = false) {
    if (!type.head || !type.tail) return "string";

    let result = "`" + type.head;

    type.tail.forEach(([templateType, literal]) => {
      result +=
        "${" +
        this.formatTypeInternal(templateType, forTable, forceSingleLine) +
        "}" +
        literal;
    });

    result += "`";
    return result;
  }

  formatMethodSignature(signature, forTable = false, forceSingleLine = false) {
    if (!signature) return "Method";

    let result = "(";

    if (signature.parameters && signature.parameters.length > 0) {
      const params = signature.parameters.map((param) => {
        let paramStr = param.name;
        if (param.flags?.isOptional || param.defaultValue !== undefined) {
          paramStr += "?";
        }
        if (param.type) {
          paramStr +=
            ": " + this.formatTypeInternal(param.type, forTable, forceSingleLine);
        }
        return paramStr;
      });
      result += params.join(", ");
    }

    result += ")";

    if (signature.type) {
      result +=
        " => " + this.formatTypeInternal(signature.type, forTable, forceSingleLine);
    }

    return result;
  }

  linkifyType(typeString) {
    if (!typeString || !this.allTypeNames.size) return typeString;

    const typeNamesArray = Array.from(this.allTypeNames);
    const regex = new RegExp(
      `\\b(${typeNamesArray.map(this.escapeRegex).join("|")})\\b`,
      "g",
    );

    return typeString.replace(regex, (match) => {
      if (this.allTypeNames.has(match)) {
        const anchor = match.toLowerCase().replace(/[^a-z0-9]/g, "-");
        return `[${match}](#${anchor})`;
      }
      return match;
    });
  }

  escapeRegex(string) {
    return string.replace(/[.*+?^${}()|[\]\\]/g, "\\$&");
  }
}

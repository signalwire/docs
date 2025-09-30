export class TypeProcessor {
  constructor(allTypeNames = new Set()) {
    this.allTypeNames = allTypeNames;
    this.typeCache = new Map();
  }

  formatType(type, context = {}) {
    if (!type) return "unknown";

    const cacheKey = JSON.stringify({ type, context });
    if (this.typeCache.has(cacheKey)) {
      return this.typeCache.get(cacheKey);
    }

    const result = this._formatTypeInternal(type, context);
    this.typeCache.set(cacheKey, result);
    return result;
  }

  _formatTypeInternal(type, context) {
    if (typeof type === "string") {
      return this.linkifyType(type);
    }

    if (!type || typeof type !== "object") {
      return "unknown";
    }

    switch (type.type) {
      case "intrinsic":
        return this.linkifyType(type.name || "unknown");

      case "reference":
        return this.formatReferenceType(type);

      case "array":
        return `${this.formatType(type.elementType, context)}[]`;

      case "union":
        return this.formatUnionType(type, context);

      case "intersection":
        return this.formatIntersectionType(type, context);

      case "literal":
        return this.formatLiteralType(type);

      case "reflection":
        return this.formatReflectionType(type, context);

      case "tuple":
        return this.formatTupleType(type, context);

      case "conditional":
        return this.formatConditionalType(type, context);

      case "mapped":
        return this.formatMappedType(type, context);

      case "templateLiteral":
        return this.formatTemplateLiteralType(type, context);

      default:
        return this.linkifyType(type.toString?.() || "unknown");
    }
  }

  formatReferenceType(type) {
    let result = this.linkifyType(type.name || "unknown");

    if (type.typeArguments && type.typeArguments.length > 0) {
      const args = type.typeArguments.map((arg) => this.formatType(arg)).join(", ");
      result += `<${args}>`;
    }

    return result;
  }

  formatUnionType(type, context) {
    if (!type.types || type.types.length === 0) return "never";

    const formattedTypes = type.types.map((t) => this.formatType(t, context));

    if (formattedTypes.length > 3 || formattedTypes.join(" | ").length > 60) {
      return formattedTypes.join(" |\n  ");
    }

    return formattedTypes.join(" | ");
  }

  formatIntersectionType(type, context) {
    if (!type.types || type.types.length === 0) return "unknown";

    const formattedTypes = type.types.map((t) => this.formatType(t, context));
    return formattedTypes.join(" & ");
  }

  formatLiteralType(type) {
    if (type.value === null) return "null";
    if (type.value === undefined) return "undefined";

    if (typeof type.value === "string") {
      return `"${type.value}"`;
    }

    return String(type.value);
  }

  formatReflectionType(type, context) {
    if (!type.declaration) return "object";

    if (type.declaration.signatures) {
      return this.formatFunctionSignature(type.declaration.signatures[0], context);
    }

    if (type.declaration.children) {
      return this.formatObjectType(type.declaration, context);
    }

    if (type.declaration.indexSignature) {
      return this.formatIndexSignature(type.declaration.indexSignature, context);
    }

    return "object";
  }

  formatTupleType(type, context) {
    if (!type.elements || type.elements.length === 0) return "[]";

    const elements = type.elements.map((el) => this.formatType(el, context));
    return `[${elements.join(", ")}]`;
  }

  formatConditionalType(type, context) {
    const checkType = this.formatType(type.checkType, context);
    const extendsType = this.formatType(type.extendsType, context);
    const trueType = this.formatType(type.trueType, context);
    const falseType = this.formatType(type.falseType, context);

    return `${checkType} extends ${extendsType} ? ${trueType} : ${falseType}`;
  }

  formatMappedType(type, context) {
    const parameter = type.parameter || "K";
    const parameterConstraint = type.parameterConstraint
      ? this.formatType(type.parameterConstraint, context)
      : "string";
    const templateType = type.templateType
      ? this.formatType(type.templateType, context)
      : "any";

    const optional =
      type.optionalModifier === "+" ? "?" : type.optionalModifier === "-" ? "-?" : "";
    const readonly =
      type.readonlyModifier === "+"
        ? "readonly "
        : type.readonlyModifier === "-"
          ? "-readonly "
          : "";

    return `{ ${readonly}[${parameter} in ${parameterConstraint}]${optional}: ${templateType} }`;
  }

  formatTemplateLiteralType(type, context) {
    if (!type.head && (!type.tail || type.tail.length === 0)) {
      return "``";
    }

    let result = "`" + (type.head || "");

    if (type.tail) {
      type.tail.forEach(([typeArg, literal]) => {
        result += "${" + this.formatType(typeArg, context) + "}" + (literal || "");
      });
    }

    result += "`";
    return result;
  }

  formatFunctionSignature(signature, context) {
    if (!signature) return "Function";

    let result = "(";

    if (signature.parameters && signature.parameters.length > 0) {
      const params = signature.parameters.map((param) => {
        let paramStr = param.name || "param";

        if (param.flags?.isOptional || param.defaultValue !== undefined) {
          paramStr += "?";
        }

        if (param.type) {
          paramStr += ": " + this.formatType(param.type, context);
        }

        return paramStr;
      });

      result += params.join(", ");
    }

    result += ")";

    if (signature.type) {
      result += " => " + this.formatType(signature.type, context);
    }

    return result;
  }

  formatObjectType(declaration, context) {
    if (!declaration.children || declaration.children.length === 0) {
      return "{}";
    }

    const properties = declaration.children.map((child) => {
      const name = child.name || "property";
      const optional = child.flags?.isOptional ? "?" : "";
      const type = child.type ? this.formatType(child.type, context) : "any";

      return `${name}${optional}: ${type}`;
    });

    if (properties.length === 1 && properties[0].length < 30) {
      return `{ ${properties[0]} }`;
    }

    return `{\n  ${properties.join(";\n  ")}\n}`;
  }

  formatIndexSignature(signature, context) {
    const keyType = signature.parameters?.[0]?.type
      ? this.formatType(signature.parameters[0].type, context)
      : "string";
    const valueType = signature.type ? this.formatType(signature.type, context) : "any";

    return `{ [key: ${keyType}]: ${valueType} }`;
  }

  linkifyType(typeString) {
    if (!typeString || !this.allTypeNames.size) {
      return typeString;
    }

    const typeNamesArray = Array.from(this.allTypeNames);
    const regex = new RegExp(
      `\\b(${typeNamesArray.map(this.escapeRegex).join("|")})\\b`,
      "g",
    );

    return typeString.replace(regex, (match) => {
      if (this.allTypeNames.has(match)) {
        const anchor = this.createAnchor(match);
        return `[${match}](#${anchor})`;
      }
      return match;
    });
  }

  createAnchor(typeName) {
    return typeName
      .toLowerCase()
      .replace(/[^a-z0-9]/g, "-")
      .replace(/-+/g, "-")
      .replace(/^-|-$/g, "");
  }

  escapeRegex(string) {
    return string.replace(/[.*+?^${}()|[\]\\]/g, "\\$&");
  }

  updateTypeNames(typeNames) {
    this.allTypeNames = new Set(typeNames);
    this.typeCache.clear();
  }
}

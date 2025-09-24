const { config } = require("./config");

class TypeFormatter {
  constructor(resolver) {
    this.resolver = resolver;
  }

  formatTypeWithLinks(type, context = "normal") {
    if (!type) return "unknown";

    switch (type.type) {
      case "array":
        const elementType = this.formatTypeWithLinks(type.elementType, context);
        return `${elementType}[]`;

      case "union":
        return type.types.map((t) => this.formatTypeWithLinks(t, context)).join(" | ");

      case "intersection":
        return type.types.map((t) => this.formatTypeWithLinks(t, context)).join(" & ");

      case "reference":
        const typeName = type.name;
        const refType = this.resolver.findTypeByReference(typeName);

        if (refType) {
          this.resolver.stats.resolvedReferences++;
          const anchor = this.resolver.createAnchor(refType.name);
          const linkedName = `[${type.name}](#${anchor})`;

          if (type.typeArguments && type.typeArguments.length > 0) {
            const args = type.typeArguments
              .map((arg) => this.formatTypeWithLinks(arg, context))
              .join(", ");
            return `${linkedName}<${args}>`;
          }
          return linkedName;
        } else {
          this.resolver.stats.unresolvedReferences++;
          if (type.typeArguments && type.typeArguments.length > 0) {
            const args = type.typeArguments
              .map((arg) => this.formatTypeWithLinks(arg, context))
              .join(", ");
            return `${typeName}<${args}>`;
          }
          return typeName;
        }

      case "intrinsic":
        return type.name;

      case "literal":
        return typeof type.value === "string" ? `"${type.value}"` : String(type.value);

      case "reflection":
        if (type.declaration && type.declaration.children) {
          const props = type.declaration.children
            .map((child) => {
              const optional = child.flags?.isOptional ? "?" : "";
              const childType = this.formatTypeWithLinks(child.type, context);
              return `${child.name}${optional}: ${childType}`;
            })
            .join(context === "table" ? "; " : ", ");

          return context === "table"
            ? `{ ${props} }`
            : `{\n  ${props.split(", ").join(",\n  ")}\n}`;
        } else if (type.declaration && type.declaration.signatures) {
          const signatures = type.declaration.signatures
            .map((sig) => {
              const params = sig.parameters
                ? sig.parameters
                    .map((p) => `${p.name}: ${this.formatTypeWithLinks(p.type, "table")}`)
                    .join(", ")
                : "";
              const returnType = sig.type
                ? this.formatTypeWithLinks(sig.type, "table")
                : "void";
              return `(${params}) => ${returnType}`;
            })
            .join(" | ");
          return signatures;
        }
        return "object";

      case "conditional":
        const checkType = this.formatTypeWithLinks(type.checkType, context);
        const extendsType = this.formatTypeWithLinks(type.extendsType, context);
        const trueType = this.formatTypeWithLinks(type.trueType, context);
        const falseType = this.formatTypeWithLinks(type.falseType, context);
        return `${checkType} extends ${extendsType} ? ${trueType} : ${falseType}`;

      case "indexedAccess":
        const objectType = this.formatTypeWithLinks(type.objectType, context);
        const indexType = this.formatTypeWithLinks(type.indexType, context);
        return `${objectType}[${indexType}]`;

      case "tuple":
        if (type.elements) {
          const elements = type.elements
            .map((el) => this.formatTypeWithLinks(el, context))
            .join(", ");
          return `[${elements}]`;
        }
        return "[]";

      default:
        return type.name || "unknown";
    }
  }

  formatTypeForTable(type) {
    const typeString = this.formatTypeWithLinks(type, "table");
    // Escape < and > characters for MDX compatibility in tables
    return typeString.replace(/</g, "&lt;").replace(/>/g, "&gt;");
  }

  formatTypeForCodeBlock(type) {
    return this.formatTypeWithLinks(type, "normal");
  }
}

module.exports = { TypeFormatter };

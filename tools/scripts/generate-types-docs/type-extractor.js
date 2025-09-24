const { config } = require("./config");

class TypeExtractor {
  constructor() {
    this.extractedTypes = new Map();
  }

  extractAllTypes(docData) {
    if (docData.children) {
      docData.children.forEach((item) => this.extractTypes(item));
    }

    return Array.from(this.extractedTypes.values());
  }

  extractTypes(item, parentName = "") {
    if (!item) return;

    const fullName = parentName ? `${parentName}.${item.name}` : item.name;

    if (item.kind === config.KIND.TYPE_ALIAS) {
      this.extractedTypes.set(fullName, {
        name: fullName,
        originalName: item.name,
        comment: item.comment,
        type: item.type,
        sources: item.sources,
        kind: "type-alias",
        rawItem: item,
      });
    } else if (item.kind === config.KIND.INTERFACE) {
      this.extractedTypes.set(fullName, {
        name: fullName,
        originalName: item.name,
        comment: item.comment,
        children: item.children,
        sources: item.sources,
        kind: "interface",
        rawItem: item,
      });
    } else if (item.kind === config.KIND.ENUM) {
      this.extractedTypes.set(fullName, {
        name: fullName,
        originalName: item.name,
        comment: item.comment,
        children: item.children,
        sources: item.sources,
        kind: "enum",
        rawItem: item,
      });
    } else if (item.kind === config.KIND.CLASS) {
      this.extractedTypes.set(fullName, {
        name: fullName,
        originalName: item.name,
        comment: item.comment,
        children: item.children,
        sources: item.sources,
        kind: "class",
        rawItem: item,
      });
    } else if (item.kind === config.KIND.VARIABLE) {
      this.extractedTypes.set(fullName, {
        name: fullName,
        originalName: item.name,
        comment: item.comment,
        type: item.type,
        sources: item.sources,
        kind: "variable",
        rawItem: item,
      });
    } else if (item.kind === config.KIND.FUNCTION) {
      this.extractedTypes.set(fullName, {
        name: fullName,
        originalName: item.name,
        comment: item.comment,
        signatures: item.signatures,
        sources: item.sources,
        kind: "function",
        rawItem: item,
      });
    }

    if (item.children) {
      item.children.forEach((child) => this.extractTypes(child, fullName));
    }
  }

  getTypeByName(name) {
    return this.extractedTypes.get(name);
  }

  getAllTypeNames() {
    return Array.from(this.extractedTypes.keys());
  }
}

module.exports = { TypeExtractor };

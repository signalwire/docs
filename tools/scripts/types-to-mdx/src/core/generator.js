import { writeFileSync } from "fs";
import { TypeExtractor } from "../processors/type-extractor.js";
import { MdxAstBuilder } from "../ast/builder.js";
import { MdxSerializer } from "../ast/serializer.js";

export class MdxGenerator {
  constructor(logger) {
    this.logger = logger;
    this.extractor = new TypeExtractor(logger);
    this.serializer = new MdxSerializer(logger);
  }

  async generate(project, options = {}) {
    const { outputPath = "./types.mdx", validate = true } = options;

    this.logger.debug("Starting MDX generation...");

    const extractedData = this.extractor.extractFromProject(project);
    const ast = this.buildAst(extractedData, project);
    const mdxContent = this.serializer.serialize(ast);

    let validation = null;
    if (validate) {
      validation = this.serializer.validateMdx(mdxContent);
    }

    writeFileSync(outputPath, mdxContent, "utf-8");

    const stats = {
      types: extractedData.types.length,
      enums: extractedData.enums.length,
      typeAliases: extractedData.typeAliases.length,
      totalLines: mdxContent.split("\n").length,
    };

    return {
      content: mdxContent,
      validation,
      stats,
    };
  }

  buildAst(data, project) {
    const builder = new MdxAstBuilder();

    builder.addChild(builder.heading(1, "API Types Documentation"));
    builder.addChild(
      builder.paragraph([
        builder.text(
          `Generated from TypeDoc JSON for ${project.name || "Unknown Project"}`,
        ),
      ]),
    );

    this.buildTableOfContents(builder, data);

    if (data.typeAliases.length > 0) {
      this.buildTypeAliasesSection(builder, data.typeAliases);
    }

    if (data.enums.length > 0) {
      this.buildEnumsSection(builder, data.enums);
    }

    if (data.types.length > 0) {
      this.buildTypesSection(builder, data.types);
    }

    return builder.build();
  }

  buildTableOfContents(builder, data) {
    builder.addChild(builder.heading(2, "Table of Contents"));

    const tocItems = [];

    if (data.typeAliases.length > 0) {
      tocItems.push(`[Type Aliases](#type-aliases) (${data.typeAliases.length})`);
    }

    if (data.enums.length > 0) {
      tocItems.push(`[Enums](#enums) (${data.enums.length})`);
    }

    if (data.types.length > 0) {
      tocItems.push(
        `[Interfaces & Classes](#interfaces--classes) (${data.types.length})`,
      );
    }

    if (tocItems.length > 0) {
      builder.addChild(builder.list(tocItems));
    }
  }

  buildTypeAliasesSection(builder, typeAliases) {
    builder.addChild(builder.heading(2, "Type Aliases", "type-aliases"));

    typeAliases.forEach((alias) => {
      builder.addChild(builder.heading(3, alias.name, alias.anchor));

      if (alias.comment) {
        alias.comment.forEach((node) => builder.addChild(node));
      }

      builder.addChild(
        builder.paragraph([builder.text("**Type:** "), builder.inlineCode(alias.type)]),
      );
    });
  }

  buildEnumsSection(builder, enums) {
    builder.addChild(builder.heading(2, "Enums", "enums"));

    enums.forEach((enumItem) => {
      builder.addChild(builder.heading(3, enumItem.name, enumItem.anchor));

      // Add comment nodes if they exist
      if (enumItem.comment) {
        enumItem.comment.forEach((node) => builder.addChild(node));
      }

      if (enumItem.members.length > 0) {
        const headers = ["Member", "Value", "Description"];
        const rows = enumItem.members.map((member) => [
          `\`${member.name}\``,
          member.value ? `\`${member.value}\`` : "",
          member.comment || "",
        ]);

        builder.addChild(builder.table(headers, rows));
      }
    });
  }

  buildTypesSection(builder, types) {
    builder.addChild(builder.heading(2, "Interfaces & Classes", "interfaces--classes"));

    types.forEach((type) => {
      builder.addChild(builder.heading(3, type.name, type.anchor));

      // Add comment nodes if they exist
      if (type.comment) {
        type.comment.forEach((node) => builder.addChild(node));
      }

      if (type.properties && type.properties.length > 0) {
        builder.addChild(builder.heading(4, "Properties"));

        const headers = ["Property", "Type", "Optional", "Readonly", "Description"];
        const rows = type.properties.map((prop) => [
          `\`${prop.name}\``,
          `\`${prop.type}\``,
          prop.optional ? "✓" : "",
          prop.readonly ? "✓" : "",
          prop.comment || "",
        ]);

        builder.addChild(builder.table(headers, rows));
      }

      if (type.methods && type.methods.length > 0) {
        builder.addChild(builder.heading(4, "Methods"));

        const headers = ["Method", "Signature", "Description"];
        const rows = type.methods.map((method) => [
          `\`${method.name}\``,
          `\`${method.signature}\``,
          method.comment || "",
        ]);

        builder.addChild(builder.table(headers, rows));
      }
    });
  }
}

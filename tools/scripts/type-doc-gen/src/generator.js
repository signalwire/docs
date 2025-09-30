import { writeFileSync } from "fs";
import { markdownTable } from "markdown-table";
import { extractTypesFromProject } from "./extractor.js";
import {
  escapeMarkdown,
  escapeTableCell,
  escapeTypeForDisplay,
  escapeForMDX,
} from "./utils.js";

export async function generateTypesMarkdown(project, outputPath = "./types.md") {
  const { types, enums, typeAliases } = extractTypesFromProject(project);

  // Collect all type names for linking
  const allTypeNames = new Set();
  typeAliases.forEach((alias) => allTypeNames.add(alias.name));
  enums.forEach((enumItem) => allTypeNames.add(enumItem.name));
  types.forEach((type) => allTypeNames.add(type.name));

  let markdown = `# API Types Documentation\n\n`;
  markdown += `Generated from TypeDoc JSON\n\n`;
  markdown += `## Table of Contents\n\n`;

  if (typeAliases.length > 0) {
    markdown += `- [Type Aliases](#type-aliases)\n`;
  }

  if (enums.length > 0) {
    markdown += `- [Enums](#enums)\n`;
  }

  if (types.length > 0) {
    markdown += `- [Interfaces](#interfaces)\n`;
  }

  markdown += `\n`;

  if (typeAliases.length > 0) {
    markdown += generateTypeAliasesSection(typeAliases, allTypeNames);
  }

  if (enums.length > 0) {
    markdown += generateEnumsSection(enums, allTypeNames);
  }

  if (types.length > 0) {
    markdown += generateInterfacesSection(types, allTypeNames);
  }

  writeFileSync(outputPath, markdown, "utf-8");

  return markdown;
}

function generateTypeAliasesSection(typeAliases, allTypeNames) {
  let section = `## Type Aliases\n\n`;

  typeAliases.forEach((alias) => {
    const anchor = alias.name.toLowerCase().replace(/[^a-z0-9]/g, "-");
    section += `### ${escapeMarkdown(alias.name)} {#${anchor}}\n\n`;

    if (alias.comment) {
      section += `${alias.comment}\n\n`;
    }

    section += `**Type:** ${escapeTypeForDisplay(alias.type)}\n\n`;
  });

  return section;
}

function generateEnumsSection(enums, allTypeNames) {
  let section = `## Enums\n\n`;

  enums.forEach((enumItem) => {
    const anchor = enumItem.name.toLowerCase().replace(/[^a-z0-9]/g, "-");
    section += `### ${escapeMarkdown(enumItem.name)} {#${anchor}}\n\n`;

    if (enumItem.comment) {
      section += `${enumItem.comment}\n\n`;
    }

    if (enumItem.members.length > 0) {
      const tableData = [
        ["Member", "Value", "Description"],
        ...enumItem.members.map((member) => [
          `\`${escapeTableCell(member.name)}\``,
          member.value ? `\`${escapeTableCell(member.value)}\`` : "",
          escapeTableCell(member.comment || ""),
        ]),
      ];

      section += markdownTable(tableData) + "\n\n";
    }
  });

  return section;
}

function generateInterfacesSection(types, allTypeNames) {
  let section = `## Interfaces\n\n`;

  types.forEach((type) => {
    const anchor = type.name.toLowerCase().replace(/[^a-z0-9]/g, "-");
    section += `### ${escapeMarkdown(type.name)} {#${anchor}}\n\n`;

    if (type.comment) {
      section += `${type.comment}\n\n`;
    }

    if (type.properties.length > 0) {
      const tableData = [
        ["Property", "Type", "Optional", "Readonly", "Description"],
        ...type.properties.map((prop) => [
          `\`${escapeTableCell(prop.name)}\``,
          escapeTableCell(prop.type),
          prop.optional ? "✓" : "",
          prop.readonly ? "✓" : "",
          escapeTableCell(prop.comment || ""),
        ]),
      ];

      section += markdownTable(tableData) + "\n\n";
    }
  });

  return section;
}

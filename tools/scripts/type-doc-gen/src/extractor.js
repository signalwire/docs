import { ReflectionKind } from "typedoc";
import {
  formatTypeString,
  formatMethodSignature,
  getCommentText,
  sortByName,
} from "./utils.js";

export function extractTypesFromProject(project) {
  const types = [];
  const enums = [];
  const typeAliases = [];
  const allTypeNames = new Set();

  // First pass: collect all type names
  function collectTypeNames(reflection) {
    if (!reflection) return;

    if (reflection.kind === ReflectionKind.TypeAlias) {
      allTypeNames.add(reflection.name);
    }

    if (reflection.kind === ReflectionKind.Enum) {
      allTypeNames.add(reflection.name);
    }

    if (reflection.kind === ReflectionKind.Interface) {
      allTypeNames.add(reflection.name);
    }

    if (reflection.children) {
      reflection.children.forEach(collectTypeNames);
    }
  }

  collectTypeNames(project);

  // Second pass: extract types with linking
  function traverse(reflection) {
    if (!reflection) return;

    if (reflection.kind === ReflectionKind.TypeAlias) {
      typeAliases.push({
        name: reflection.name,
        type: formatTypeString(reflection.type, allTypeNames),
        comment: getCommentText(reflection.comment),
        sources: reflection.sources || [],
      });
    }

    if (reflection.kind === ReflectionKind.Enum) {
      const enumMembers = [];

      if (reflection.children) {
        reflection.children.forEach((child) => {
          if (child.kind === ReflectionKind.EnumMember) {
            enumMembers.push({
              name: child.name,
              value: child.defaultValue || "",
              comment: getCommentText(child.comment),
            });
          }
        });
      }

      enums.push({
        name: reflection.name,
        comment: getCommentText(reflection.comment),
        members: enumMembers.sort(sortByName),
        sources: reflection.sources || [],
      });
    }

    if (reflection.kind === ReflectionKind.Interface) {
      const properties = [];

      if (reflection.children) {
        reflection.children.forEach((child) => {
          if (
            child.kind === ReflectionKind.Property ||
            child.kind === ReflectionKind.Method
          ) {
            let typeInfo;

            // Handle methods differently from properties
            if (child.kind === ReflectionKind.Method) {
              // For methods, try to get the signature information
              if (child.signatures && child.signatures.length > 0) {
                typeInfo = formatMethodSignature(child.signatures[0], allTypeNames);
              } else if (child.type) {
                typeInfo = formatTypeString(child.type, allTypeNames);
              } else {
                typeInfo = "Method";
              }
            } else {
              // For properties, use the type directly
              typeInfo = formatTypeString(child.type, allTypeNames);
            }

            properties.push({
              name: child.name,
              type: typeInfo,
              comment: getCommentText(child.comment),
              optional: child.flags?.isOptional || false,
              readonly: child.flags?.isReadonly || false,
              isMethod: child.kind === ReflectionKind.Method,
            });
          }
        });
      }

      types.push({
        name: reflection.name,
        kind: "Interface",
        comment: getCommentText(reflection.comment),
        properties: properties.sort(sortByName),
        sources: reflection.sources || [],
      });
    }

    if (reflection.children) {
      reflection.children.forEach(traverse);
    }
  }

  traverse(project);

  return {
    types: types.sort(sortByName),
    enums: enums.sort(sortByName),
    typeAliases: typeAliases.sort(sortByName),
  };
}

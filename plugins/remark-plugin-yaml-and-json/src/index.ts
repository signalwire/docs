import * as YAML from "yaml";
import type { Code, Literal } from "mdast";
import type { MdxJsxFlowElement, MdxJsxAttribute } from "mdast-util-mdx";
import type { Node, Parent } from "unist";
import type { Transformer } from "unified";

function yamlToJson(str: string): string {
  let json = "YAML is ill-formatted...";
  try {
    json = JSON.stringify(YAML.parse(str), null, 2);
  } catch (e) {
    console.error(e);
  }
  return json;
}

function createAttribute(
  attributeName: string,
  attributeValue: MdxJsxAttribute["value"]
): MdxJsxAttribute {
  return {
    type: "mdxJsxAttribute",
    name: attributeName,
    value: attributeValue,
  };
}

function createTabItem({
  code,
  node,
  value,
  label,
  lang,
}: {
  code: string;
  node: Code;
  value: string;
  label?: string;
  lang?: string;
}): MdxJsxFlowElement {
  return {
    type: "mdxJsxFlowElement",
    name: "TabItem",
    attributes: [
      createAttribute("value", value),
      label && createAttribute("label", label),
    ].filter((attr): attr is MdxJsxAttribute => Boolean(attr)),
    children: [
      {
        type: node.type,
        lang: node.lang ?? lang,
        value: code,
      },
    ],
  };
}

const transformNode = (node: Code, isSync: boolean) => {
  const groupIdProp = isSync
    ? {
        type: "mdxJsxAttribute",
        name: "groupId",
        value: "yamlAndJson",
      }
    : undefined;
  const yamlCode = node.value;

  return [
    {
      type: "mdxJsxFlowElement",
      name: "Tabs",
      attributes: [groupIdProp].filter(Boolean),
      children: [
        createTabItem({
          code: yamlCode,
          node,
          label: "YAML",
          value: "YAML",
          lang: "yaml",
        }),
        createTabItem({
          code: yamlToJson(yamlCode),
          node,
          label: "JSON",
          value: "JSON",
          lang: "json",
        }),
      ],
    },
  ] as any[];
};

const isMdxEsmLiteral = (node: Node): node is Literal => node.type === "mdxjsEsm";
// TODO legacy approximation, good-enough for now but not 100% accurate
const isTabsImport = (node: Node): boolean =>
  isMdxEsmLiteral(node) && node.value.includes("@theme/Tabs");

const isParent = (node: Node): node is Parent => Array.isArray((node as Parent).children);
const isYamlAndJson = (node: Node): node is Code => {
  return node.type === "code" && (node as Code).meta?.toLowerCase() === "andjson";
};

function createImportNode() {
  return {
    type: "mdxjsEsm",
    value: "import Tabs from '@theme/Tabs'\nimport TabItem from '@theme/TabItem'",
    data: {
      estree: {
        type: "Program",
        body: [
          {
            type: "ImportDeclaration",
            specifiers: [
              {
                type: "ImportDefaultSpecifier",
                local: { type: "Identifier", name: "Tabs" },
              },
            ],
            source: {
              type: "Literal",
              value: "@theme/Tabs",
              raw: "'@theme/Tabs'",
            },
          },
          {
            type: "ImportDeclaration",
            specifiers: [
              {
                type: "ImportDefaultSpecifier",
                local: { type: "Identifier", name: "TabItem" },
              },
            ],
            source: {
              type: "Literal",
              value: "@theme/TabItem",
              raw: "'@theme/TabItem'",
            },
          },
        ],
        sourceType: "module",
      },
    },
  };
}

// eslint-disable-next-line @typescript-eslint/no-unused-vars
type Plugin<T> = any;

// @ts-ignore
const plugin: Plugin<[PluginOptions?]> = (options = {}): Transformer => {
  // @ts-ignore
  const { sync = false } = options;
  return async (root) => {
    const { visit } = await import("unist-util-visit");

    let transformed = false;
    let alreadyImported = false;

    visit(root, (node: Node) => {
      if (isTabsImport(node)) {
        alreadyImported = true;
      }

      if (isParent(node)) {
        let index = 0;
        while (index < node.children.length) {
          const child = node.children[index]!;
          if (isYamlAndJson(child)) {
            const result = transformNode(child, sync);
            node.children.splice(index, 1, ...result);
            index += result.length;
            transformed = true;
          } else {
            index += 1;
          }
        }
      }
    });

    if (transformed && !alreadyImported) {
      (root as Parent).children.unshift(createImportNode());
    }
  };
};

export = plugin;

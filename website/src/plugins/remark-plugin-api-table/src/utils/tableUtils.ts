import type { Node } from 'unist';
import type {
  Table,
  TableRow,
  BlockContent,
  DefinitionContent,
  TableCell,
  PhrasingContent,
} from 'mdast';
import type { MdxJsxFlowElement } from 'mdast-util-mdx';
import { visit } from 'unist-util-visit';
import {
  isParent,
  isLinkNode,
  isHeadingNode,
  hasHProperties,
} from './typeGuards';

/**
 * Collects all unique anchors from the Markdown AST.
 * @param root - The root node of the AST.
 * @returns A set of unique anchor strings.
 */
export const collectAnchors = async (root: Node): Promise<Set<string>> => {
  const anchors = new Set<string>();

  try {
    visit(root, (node: Node) => {
      // Collect anchors from headings with ids
      if (isHeadingNode(node) && hasHProperties(node)) {
        // @ts-ignore
        anchors.add(node.data.hProperties.id);
      }

      // Collect anchors from links that are internal (starting with '#')
      if (isLinkNode(node) && node.url.startsWith('#')) {
        anchors.add(node.url.slice(1));
      }

      // Collect anchors from heading children links that are internal
      if (isHeadingNode(node) && isParent(node)) {
        node.children.forEach((child) => {
          if (isLinkNode(child) && child.url.startsWith('#')) {
            anchors.add(child.url.slice(1));
          }
        });
      }
    });
  } catch (error) {
    console.error('Error visiting nodes to collect anchors:', error);
  }

  return anchors;
};

let tableRowIndex = 0;
let namelessRowIndex = 0;

export const resetTableRowIndex = (): void => {
  tableRowIndex = 0;
  namelessRowIndex = 0;
};

const generateUniqueAnchor = (
  id: string,
  existingAnchors: Set<string>
): string => {
  if (!existingAnchors.has(id)) {
    existingAnchors.add(id);
    return id;
  }

  let suffix = 1;
  while (existingAnchors.has(`${id}-${suffix}`)) {
    suffix++;
  }

  const uniqueId = `${id}-${suffix}`;
  existingAnchors.add(uniqueId);
  return uniqueId;
};

/**
 * Extracts the text content from a node.
 * @param node - The node to extract text from.
 * @returns The extracted text.
 */
const extractText = (node: PhrasingContent): string => {
  if ('value' in node) {
    return node.value;
  } else if ('children' in node && Array.isArray(node.children)) {
    return node.children.map(extractText).join('');
  }
  return '';
};

/**
 * Creates an APITable element from a Table node.
 * @param tableNode - The table node from the AST.
 * @param existingAnchors - A set of existing anchors to ensure uniqueness.
 * @returns An MdxJsxFlowElement representing the APITable.
 */
export const createAPITable = ({
                                 tableNode,
                                 existingAnchors,
                               }: {
  tableNode: Table;
  existingAnchors: Set<string>;
}): MdxJsxFlowElement => {
  const [thead, ...tbodyRows] = tableNode.children as TableRow[];
  const alignments = tableNode.align || []; // Extract alignment data

  const theadElement: MdxJsxFlowElement = {
    type: 'mdxJsxFlowElement',
    name: 'thead',
    attributes: [],
    children: [
      {
        type: 'mdxJsxFlowElement',
        name: 'tr',
        attributes: [],
        children: thead.children.map((cell: TableCell, index) => ({
          type: 'mdxJsxFlowElement',
          name: 'th',
          attributes: [
            {
              type: 'mdxJsxAttribute',
              name: 'align',
              value: alignments[index] || 'left', // Pass alignment
            },
          ],
          children: cell.children,
        })) as (BlockContent | DefinitionContent)[],
      },
    ],
  };

  const tbodyElements = tbodyRows.map((row) => {
    const firstCell = row.children[0];
    let rowName = '';

    if (firstCell.children.length > 0) {
      const firstChild = firstCell.children[0];
      rowName = extractText(firstChild);
    }

    if (!rowName) {
      rowName = `nameless-row-${namelessRowIndex++}`;
    }

    const slug = generateUniqueAnchor(rowName, existingAnchors);

    return {
      type: 'mdxJsxFlowElement',
      name: 'tr',
      attributes: [
        {
          type: 'mdxJsxAttribute',
          name: 'data-row-slug',
          value: slug,
        },
      ],
      children: row.children.map((cell: TableCell, index) => ({
        type: 'mdxJsxFlowElement',
        name: 'td',
        attributes: [
          {
            type: 'mdxJsxAttribute',
            name: 'align',
            value: alignments[index] || 'left', // Pass alignment
          },
        ],
        children: cell.children,
      })) as (BlockContent | DefinitionContent)[],
    } as MdxJsxFlowElement;
  }) as (BlockContent | DefinitionContent)[];

  const tbodyElement: MdxJsxFlowElement = {
    type: 'mdxJsxFlowElement',
    name: 'tbody',
    attributes: [],
    children: tbodyElements,
  };

  return {
    type: 'mdxJsxFlowElement',
    name: 'APITable',
    attributes: [],
    data: {
      hProperties: {
        index: tableRowIndex++,
      },
    },
    children: [
      {
        type: 'mdxJsxFlowElement',
        name: 'table',
        attributes: [],
        children: [theadElement, tbodyElement],
      },
    ],
  };
};

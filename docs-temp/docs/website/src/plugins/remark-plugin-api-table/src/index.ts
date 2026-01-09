import type { Plugin, Transformer } from 'unified';
import type { Node, Parent } from 'unist';
import { collectAnchors, isParent, isTableNode, resetTableRowIndex, createAPITable } from './utils/index.js';
import { visit } from 'unist-util-visit';

/**
 * Unified plugin to handle custom table nodes.
 * @returns Transformer function to process the AST.
 */
const plugin: Plugin = (): Transformer => {
  return async (root) => {
    resetTableRowIndex();

    // Collect existing anchors
    const existingAnchors = await collectAnchors(root);

    // Visit and process table nodes
    visit(root, 'table', (node: Node, index: number, parent: Parent) => {
      if (isTableNode(node) && isParent(parent) && index !== null) {
        const result = createAPITable({ tableNode: node, existingAnchors });
        parent.children.splice(index, 1, result);
      }
    });
  };
};

export default plugin;

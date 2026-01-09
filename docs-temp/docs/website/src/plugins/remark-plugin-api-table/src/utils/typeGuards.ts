import type { Node, Parent } from 'unist';
import type { HeadingWithProperties } from '../types/index.js';
import type { Table, Link } from 'mdast';

/**
 * Type guard to check if a node is a Parent node.
 * @param node - The node to check.
 * @returns True if the node is a Parent, false otherwise.
 */
export const isParent = (node: Node): node is Parent => Array.isArray((node as Parent).children);

/**
 * Type guard to check if a node is a Table node.
 * @param node - The node to check.
 * @returns True if the node is a Table, false otherwise.
 */
export const isTableNode = (node: Node): node is Table => node.type === 'table';

/**
 * Type guard to check if a node is a Link node.
 * @param node - The node to check.
 * @returns True if the node is a Link, false otherwise.
 */
export const isLinkNode = (node: Node): node is Link => node.type === 'link';

/**
 * Type guard to check if a node is a HeadingWithProperties node.
 * @param node - The node to check.
 * @returns True if the node is a HeadingWithProperties, false otherwise.
 */
export const isHeadingNode = (node: Node): node is HeadingWithProperties => node.type === 'heading';

/**
 * Type guard to check if a HeadingWithProperties node has hProperties.
 * @param node - The node to check.
 * @returns True if the node has hProperties, false otherwise.
 */
export const hasHProperties = (node: HeadingWithProperties): node is HeadingWithProperties =>
  !!node.data && !!node.data.hProperties && typeof node.data.hProperties.id === 'string';

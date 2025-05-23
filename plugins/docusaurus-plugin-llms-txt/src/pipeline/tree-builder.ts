import { DocInfo, PluginOptions, TreeNode } from '../types/plugin';
import { getEffectiveConfigForPath } from '../config/options';

/**
 * Build hierarchical tree from docs
 */
export function buildTree(docs: DocInfo[], globalConfig: PluginOptions): TreeNode {
  const root: TreeNode = { 
    name: 'root', 
    relPath: '', 
    docs: [], 
    subCategories: [],
    // Store the config title and description in the root node
    title: globalConfig.siteTitle || '',
    description: globalConfig.siteDescription || ''
  };
  const categoryMap = new Map<string, TreeNode>();
  categoryMap.set('', root);

  for (const doc of docs) {
    // Use categoryPath (standard Docusaurus route) for categorization
    const route = doc.routePath.replace(/\.md$/, ''); // Strip .md for categorization
    const routePath = route.startsWith('/') ? route : '/' + route;
    const effectiveConfig = getEffectiveConfigForPath(routePath, globalConfig);
    const depth = effectiveConfig.depth || 1;

    const segments = routePath.split('/').filter(Boolean);
    if (segments.length === 1 && segments[0] === 'index') {
      root.indexDoc = doc;
      continue;
    }

    const catDepth = Math.min(depth, segments.length);
    let categoryPath = '';
    let currentNode = root;

    for (let i = 0; i < catDepth; i++) {
      const segment = segments[i];
      const nextPath = categoryPath ? `${categoryPath}/${segment}` : segment;
      if (!categoryMap.has(nextPath)) {
        const newNode: TreeNode = { name: segment, relPath: nextPath, docs: [], subCategories: [] };
        currentNode.subCategories.push(newNode);
        categoryMap.set(nextPath, newNode);
      }
      currentNode = categoryMap.get(nextPath)!;
      categoryPath = nextPath;
    }

    if (segments.length === catDepth) {
      currentNode.indexDoc = doc;
    } else {
      currentNode.docs.push(doc);
    }
  }
  return root;
} 
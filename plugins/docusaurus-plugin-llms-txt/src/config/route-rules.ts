/**
 * Route rules engine
 * Handles route rule matching, validation, and application
 */

import { createMatcher } from '@docusaurus/utils';
import type { RouteRule, PluginOptions, EffectiveConfig, ContentOptions, Logger } from '../types';
import { ensureLeadingSlash } from '../utils';
import { VALIDATION_MESSAGES } from '../constants';



/**
 * Find the most specific matching route rule
 */
export function findMostSpecificRule(
  path: string,
  routeRules: readonly RouteRule[]
): RouteRule | null {
  if (!routeRules.length) {
    return null;
  }

  const normalizedPath = ensureLeadingSlash(path);
  
  // Find all matching rules
  const matchingRules = routeRules.filter(rule => {
    const matcher = createMatcher([rule.route]);
    return matcher(normalizedPath);
  });

  if (matchingRules.length === 0) {
    return null;
  }

  // Sort by specificity (longer paths are more specific)
  const sortedRules = matchingRules.sort((a, b) => {
    const aPath = a.route.replace(/\/\*\*$/, '');
    const bPath = b.route.replace(/\/\*\*$/, '');
    return bPath.length - aPath.length;
  });

  return sortedRules[0] || null;
}

/**
 * Apply route rule to create effective configuration
 */
export function applyRouteRule(
  rule: RouteRule | null,
  baseConfig: PluginOptions,
  contentConfig: Required<ContentOptions>,
  path: string
): EffectiveConfig {
  const includeOrder = rule?.includeOrder || baseConfig.includeOrder || [];
  
  const effectiveConfig: EffectiveConfig = {
    ...baseConfig,
    includeOrder,
    content: contentConfig,
    path,
    // Apply rule-specific overrides if rule exists
    ...(rule?.depth !== undefined && { depth: rule.depth }),
    ...(rule?.categoryName !== undefined && { categoryName: rule.categoryName })
  };

  return effectiveConfig;
}

/**
 * Validate route rules for conflicts and warn about issues
 */
export function validateRouteRules(routeRules: readonly RouteRule[], logger: Logger): void {
  if (routeRules.length === 0) {
    return;
  }

  const conflicts = findRouteRuleConflicts(routeRules);
  
  // Report conflicts using logger
  conflicts.forEach(({ route, categories, includeOrders }) => {
    if (categories.length > 1) {
      const message = `${VALIDATION_MESSAGES.ROUTE_RULE_MULTIPLE_CATEGORIES} "${route}": ${categories.join(', ')}. ${VALIDATION_MESSAGES.USING_LAST_DEFINITION}`;
      logger.warn(message);
    }
    
    if (includeOrders > 1) {
      const message = `${VALIDATION_MESSAGES.ROUTE_RULE_MULTIPLE_ORDERS} "${route}". ${VALIDATION_MESSAGES.USING_LAST_DEFINITION}`;
      logger.warn(message);
    }
  });
}

/**
 * Find conflicts between route rules
 */
function findRouteRuleConflicts(routeRules: readonly RouteRule[]): Array<{
  route: string;
  categories: string[];
  includeOrders: number;
}> {
  const routeMap = new Map<string, RouteRule[]>();
  
  // Group rules by route pattern
  routeRules.forEach(rule => {
    if (!routeMap.has(rule.route)) {
      routeMap.set(rule.route, []);
    }
    routeMap.get(rule.route)!.push(rule);
  });
  
  const conflicts: Array<{
    route: string;
    categories: string[];
    includeOrders: number;
  }> = [];
  
  // Check for conflicts within each route group
  routeMap.forEach((rulesForRoute, route) => {
    if (rulesForRoute.length <= 1) {
      return;
    }
    
    const categories = rulesForRoute
      .map(r => r.categoryName)
      .filter((name): name is string => Boolean(name));
    
    const includeOrders = rulesForRoute
      .map(r => r.includeOrder)
      .filter(Boolean);
    
    const uniqueCategories = [...new Set(categories)];
    
    if (uniqueCategories.length > 1 || includeOrders.length > 1) {
      conflicts.push({
        route,
        categories: uniqueCategories,
        includeOrders: includeOrders.length
      });
    }
  });
  
  return conflicts;
} 
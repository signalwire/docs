/**
 * Route validation for processing pipeline
 * Focused module for validating routes before processing
 */

import type { RouteConfig, PluginRouteConfig } from '@docusaurus/types';
import type { PluginOptions, Logger, CachedRouteInfo, ValidationResult } from '../../types';
import { validateRouteForProcessing, validateAndLogRouteFiltering } from '../discovery/route-filter';
import { createExclusionMatcher } from '../discovery/exclusion-matcher';
import { getContentConfig } from '../../config';

/**
 * Validate a single route for processing
 */
export function validateSingleRoute(
  route: RouteConfig,
  cachedRoute: CachedRouteInfo | null,
  options: PluginOptions,
  isExcluded: (_path: string) => boolean,
  logger: Logger
): ValidationResult {
  const pluginRoute = route as PluginRouteConfig;
  
  // Check if route should be processed based on content classification
  if (!validateRouteForProcessing(pluginRoute, options, isExcluded, logger)) {
    return { isValid: false, reason: 'Route failed classification validation' };
  }
  
  // Check if cached route has HTML path
  if (!cachedRoute?.htmlPath) {
    return { isValid: false, reason: 'No HTML path available' };
  }
  
  return { isValid: true };
}

/**
 * Batch validate routes for processing
 */
export function validateRoutesForProcessing(
  routes: RouteConfig[],
  cachedRoutes: CachedRouteInfo[],
  options: PluginOptions,
  logger: Logger
): Array<{ route: RouteConfig; cachedRoute: CachedRouteInfo; isValid: boolean }> {
  const contentConfig = getContentConfig(options);
  const isExcluded = createExclusionMatcher(contentConfig.excludeRoutes);
  
  // Get filtering info if we have route data to filter
  if (routes.length > 0) {
    const pluginRoutes = routes as PluginRouteConfig[];
    validateAndLogRouteFiltering(pluginRoutes, options, isExcluded, logger);
  }
  
  // Create a simple map for route lookup
  const routeMap = new Map<string, RouteConfig>();
  for (const route of routes) {
    routeMap.set(route.path, route);
  }
  
  return cachedRoutes.map(cachedRoute => {
    const route = routeMap.get(cachedRoute.path);
    
    if (!route) {
      logger.debug(`Route not found in processing map: ${cachedRoute.path}`);
      return { route: { path: cachedRoute.path } as RouteConfig, cachedRoute, isValid: false };
    }
    
    const validation = validateSingleRoute(route, cachedRoute, options, isExcluded, logger);
    return { route, cachedRoute, isValid: validation.isValid };
  });
} 
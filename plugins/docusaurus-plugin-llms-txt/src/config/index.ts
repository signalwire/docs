import { PluginOptions, EffectiveConfig, pluginOptionsSchema, ContentOptions } from '../types';
import { createConfigError } from '../errors';
import { createPluginLogger } from '../logging';
import { applyGfmConfiguration } from './gfm-resolver';
import { validateRouteRules, findMostSpecificRule, applyRouteRule } from './route-rules';
import { ensureLeadingSlash } from '../utils';
import { VALIDATION_MESSAGES } from '../constants';

/**
 * Processes and validates plugin options, applying defaults
 * Simplified with focused modules
 * @internal
 */
export function getConfig(options: Partial<PluginOptions>): PluginOptions {
  try {
    const validated = pluginOptionsSchema
      .validate(options, { abortEarly: false })
      .value satisfies PluginOptions;
    
    // Validate route rules for conflicts
    const contentConfig = getContentConfig(validated);
    if (contentConfig.routeRules.length > 0) {
      const logger = createPluginLogger(validated);
      validateRouteRules(contentConfig.routeRules, logger);
    }
    
    // Apply GFM configuration
    return applyGfmConfiguration(validated);
  } catch (error) {
    if (error instanceof Error) {
      throw createConfigError(
        `${VALIDATION_MESSAGES.INVALID_CONFIG}: ${error.message}`,
        { originalOptions: options, validationError: error.message }
      );
    }
    throw createConfigError(
      VALIDATION_MESSAGES.UNKNOWN_ERROR,
      { originalOptions: options }
    );
  }
}

// Re-export security validation from focused module
export { validateUserInputs } from './security-validator';

/**
 * Get content options with defaults applied
 * @internal
 */
export function getContentConfig(config: PluginOptions): Required<ContentOptions> {
  const content = config.content || {};
  return {
    enableMarkdownFiles: content.enableMarkdownFiles ?? true,
    relativePaths: content.relativePaths ?? true,
    includeBlog: content.includeBlog ?? false,
    includePages: content.includePages ?? false,
    includeDocs: content.includeDocs ?? true,
    excludeRoutes: content.excludeRoutes ?? [],
    contentSelectors: content.contentSelectors ?? [],
    routeRules: content.routeRules ?? [],
    remarkStringify: content.remarkStringify ?? {},
    remarkGfm: content.remarkGfm ?? true,
    rehypeProcessTables: content.rehypeProcessTables ?? true,
  };
}

/**
 * Gets config effective for a specific path, applying any matching route rules
 * Simplified using focused route rules engine
 * @internal
 */
export function getEffectiveConfigForPath(relPath: string, config: PluginOptions): EffectiveConfig {
  const matchPath = ensureLeadingSlash(relPath);
  const contentConfig = getContentConfig(config);

  // Use focused route rules engine
  const rule = findMostSpecificRule(matchPath, contentConfig.routeRules);
  return applyRouteRule(rule, config, contentConfig, matchPath);
}



 
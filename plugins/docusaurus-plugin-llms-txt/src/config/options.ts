import { PluginOptions, EffectiveConfig, pluginOptionsSchema, RuntimeConfig } from '../types/plugin';
import stringWidth from 'string-width';
import { createMatcher } from '@docusaurus/utils';

/**
 * Processes and validates plugin options, applying defaults
 */
export function getConfig(options: Partial<PluginOptions>): RuntimeConfig {
  const validated = pluginOptionsSchema
    .validate(options, { abortEarly: false })
    .value as PluginOptions;
  
  // Create a mutable copy of the config
  const config: RuntimeConfig = { ...validated };

  // Setup remark-gfm defaults
  const defaultRemarkGfm = {
    singleTilde: false,
    tableCellPadding: true,
    tablePipeAlign: true,
    stringLength: stringWidth,
  } as const;

  if (config.remarkGfm === false) {
    // noop - already false
  } else if (config.remarkGfm === true) {
    config.remarkGfm = defaultRemarkGfm;
  } else if (config.remarkGfm) {
    config.remarkGfm = {
      ...defaultRemarkGfm,
      ...config.remarkGfm,
    };
  }

  return config;
}

/**
 * Gets config effective for a specific path, applying any matching path rules
 */
export function getEffectiveConfigForPath(relPath: string, config: RuntimeConfig): EffectiveConfig {
  const matchPath = relPath.startsWith('/') ? relPath : `/${relPath}`;

  // Apply first matching path rule if any
  if (config.pathRules?.length) {
    for (const rule of config.pathRules) {
      const matcher = createMatcher([rule.path]);
      if (matcher(matchPath)) {
        return { ...config, ...rule } as EffectiveConfig;
      }
    }
  }

  return { ...config, path: matchPath } as EffectiveConfig;
} 
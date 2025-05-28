/**
 * Public API for docusaurus-plugin-llms-txt
 * 
 * This module exports only what plugin users need.
 * Internal implementation details are not exposed.
 */

/**
 * Public API exports
 * These are the types and functions that plugin users can import
 */

// === PLUGIN EXPORTS ===

// Main plugin function and validation utility
export { default, validateOptions } from '../index';

// === CONFIGURATION TYPES ===

// Export public types
export type {
  PluginOptions,
  ContentOptions,
  RouteRule,
  OptionalLink,
  Depth,
  PluginError,
  PluginConfigError,
  PluginValidationError,
  Logger
} from '../types/public';

export type { LogLevelType as LogLevel } from '../constants';

// === USER ERROR HANDLING ===

// Export error utilities
export { isPluginError } from '../errors';

// === UNIFIED PLUGIN DEVELOPMENT ===

// Logger factory for users creating unified plugins
export { createLogger } from '../logging'; 
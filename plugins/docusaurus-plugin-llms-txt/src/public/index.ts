/**
 * Public API for docusaurus-plugin-llms-txt
 * 
 * This module exports all types and utilities that plugin users need.
 * Internal implementation details are not exposed.
 */

// === PLUGIN EXPORTS ===

// Main plugin function and validation utility
export { default, validateOptions } from '../index';

// === CONFIGURATION TYPES ===

// Core configuration types that users need for plugin setup
export type { 
  PluginOptions,
  PathRule,
  OptionalLink
} from '../types/plugin';

// Enums for configuration
export { 
  LogLevel,
  Depth
} from '../types/plugin';

// === PLUGIN DEVELOPMENT UTILITIES ===

// Logging interface and factory for potential plugin extensions
export type { Logger } from '../types/logging';
export { createLogger } from '../logging/logger';

// === ERROR HANDLING ===

// Error types and utilities for graceful error handling
export type { ErrorType } from '../utils/errors';
export { PluginError } from '../utils/errors'; 
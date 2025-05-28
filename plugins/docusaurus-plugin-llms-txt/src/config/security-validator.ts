/**
 * Minimal security validation for things Joi can't handle
 * Joi handles type checking, required fields, etc. - we only need custom security checks
 */

import path from 'path';
import { createValidationError } from '../errors';
import { VALIDATION_MESSAGES } from '../constants';

/**
 * Validate user inputs for security-specific concerns that Joi can't handle
 * Joi already handles: type checking, required fields, array validation, etc.
 */
export function validateUserInputs(options: unknown): asserts options is Record<string, unknown> {
  if (typeof options !== 'object' || options === null) {
    throw createValidationError(VALIDATION_MESSAGES.OBJECT_REQUIRED);
  }
  
  const opts = options as Record<string, unknown>;
  
  // Only validate path security - Joi handles the rest
  if (opts.outputDir && typeof opts.outputDir === 'string') {
    validatePathSecurity(opts.outputDir, 'outputDir');
  }
}

/**
 * Validate that a path doesn't escape the project directory
 * This is the one thing Joi can't easily do
 */
function validatePathSecurity(dirPath: string, fieldName: string): void {
  if (dirPath.includes('..')) {
    throw createValidationError(
      `${fieldName} ${VALIDATION_MESSAGES.PARENT_DIR_FORBIDDEN}`,
      { [fieldName]: dirPath }
    );
  }
  
  if (path.isAbsolute(dirPath)) {
    throw createValidationError(
      `${fieldName} ${VALIDATION_MESSAGES.RELATIVE_PATH_REQUIRED}`,
      { [fieldName]: dirPath }
    );
  }
} 
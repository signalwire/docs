/**
 * Error types for plugin operations
 */
export type ErrorType = 'config' | 'file' | 'document' | 'conversion';

/**
 * Unified error class for all plugin errors with typed cause
 */
export class PluginError extends Error {
  public readonly name: string;

  constructor(
    public readonly type: ErrorType, 
    message: string, 
    public readonly filePath?: string, 
    public readonly cause?: Error
  ) {
    super(message);
    this.name = `${type.charAt(0).toUpperCase() + type.slice(1)}Error`;
    
    // Capture stack trace
    if (Error.captureStackTrace) {
      Error.captureStackTrace(this, this.constructor);
    }
  }
}

/**
 * Creates a plugin error with appropriate type and cause
 * 
 * @param type - Type of error
 * @param message - Error message
 * @param filePath - Optional path to file causing the error
 * @param cause - Optional cause of the error
 * @returns A new PluginError
 */
export function createError(
  type: ErrorType, 
  message: string, 
  filePath?: string, 
  cause?: unknown
): PluginError {
  return new PluginError(
    type, 
    message, 
    filePath, 
    cause instanceof Error ? cause : undefined
  );
}

/**
 * Creates a configuration error
 * 
 * @param message - Error message
 * @param cause - Optional cause of the error
 * @returns A new PluginError with type 'config'
 */
export const createConfigError = (message: string, cause?: unknown): PluginError => 
  createError('config', message, undefined, cause);

/**
 * Creates a file error
 * 
 * @param message - Error message
 * @param filePath - Path to file causing the error
 * @param cause - Optional cause of the error
 * @returns A new PluginError with type 'file'
 */
export const createFileError = (message: string, filePath: string, cause?: unknown): PluginError => 
  createError('file', message, filePath, cause);

/**
 * Creates a document error
 * 
 * @param message - Error message
 * @param filePath - Path to document causing the error
 * @param cause - Optional cause of the error
 * @returns A new PluginError with type 'document'
 */
export const createDocumentError = (
  message: string,
  filePath: string,
  cause?: unknown,
): PluginError =>
  createError('document', message, filePath, cause);

/**
 * Creates a conversion error
 * 
 * @param message - Error message
 * @param cause - Optional cause of the error
 * @returns A new PluginError with type 'conversion'
 */
export const createConversionError = (
  message: string,
  cause?: unknown,
): PluginError =>
  createError('conversion', message, undefined, cause);

// === Error Handling Utilities ===

/**
 * Type guard to check if an unknown value is an Error
 * 
 * @param error - Unknown value to check
 * @returns True if the value is an Error instance
 */
export function isError(error: unknown): error is Error {
  return error instanceof Error;
}

/**
 * Safely extracts an error message from an unknown error value
 * 
 * @param error - Unknown error value
 * @returns Error message string
 */
export function getErrorMessage(error: unknown): string {
  if (isError(error)) {
    return error.message;
  }
  return String(error);
}

/**
 * Safely extracts an Error instance from an unknown error value
 * 
 * @param error - Unknown error value
 * @returns Error instance or undefined
 */
export function getErrorCause(error: unknown): Error | undefined {
  return isError(error) ? error : undefined;
}

/**
 * Strategy for handling non-critical errors (log and continue)
 * Use for operations where failure shouldn't stop the entire process
 * 
 * @param logger - Logger instance
 * @param message - Context message
 * @param error - The error that occurred
 * @param filePath - Optional file path for context
 */
export function logAndContinue(
  logger: { warn: (msg: string) => void },
  message: string,
  error: unknown,
  filePath?: string
): void {
  const errorMsg = getErrorMessage(error);
  const context = filePath ? ` (${filePath})` : '';
  logger.warn(`${message}${context}: ${errorMsg}`);
}

/**
 * Strategy for handling critical errors (throw typed error)
 * Use for operations where failure should propagate up the call stack
 * 
 * @param type - Type of error to create
 * @param message - Error message
 * @param filePath - Optional file path for context
 * @param cause - Original error that caused this
 * @throws PluginError with appropriate type
 */
export function throwTypedError(
  type: ErrorType,
  message: string,
  filePath?: string,
  cause?: unknown
): never {
  throw createError(type, message, filePath, cause);
} 
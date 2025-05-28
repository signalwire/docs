import baseLogger from '@docusaurus/logger';
import { Logger } from '../types';
import { LogLevel, LogLevelType } from '../constants';


/**
 * Logger implementation that can be instantiated
 */
class PluginLogger implements Logger {
  private name: string;
  private logLevel: LogLevelType;

  constructor(name: string, logLevel: LogLevelType = LogLevel.INFO) {
    this.name = name;
    this.logLevel = logLevel;
  }

  /**
   * Gets the prefix for log messages
   * 
   * @returns The formatted prefix string
   */
  private getPrefix(): string {
    return `[${this.name}]`;
  }

  /**
   * Checks if a message should be logged based on level
   * 
   * @param level - The level of the message
   * @returns True if the message should be logged
   */
  private shouldLog(level: LogLevelType): boolean {
    return level <= this.logLevel;
  }

  /**
   * Logs an error message
   * 
   * @param msg - The error message
   */
  public error(msg: string): void {
    if (this.shouldLog(LogLevel.ERROR)) {
      baseLogger.error(`${this.getPrefix()} ${msg}`);
    }
  }

  /**
   * Logs a warning message
   * 
   * @param msg - The warning message
   */
  public warn(msg: string): void {
    if (this.shouldLog(LogLevel.WARN)) {
      baseLogger.warn(`${this.getPrefix()} ${msg}`);
    }
  }

  /**
   * Logs an info message
   * 
   * @param msg - The info message
   */
  public info(msg: string): void {
    if (this.shouldLog(LogLevel.INFO)) {
      baseLogger.info(`${this.getPrefix()} ${msg}`);
    }
  }

  /**
   * Logs a debug message
   * 
   * @param msg - The debug message
   */
  public debug(msg: string): void {
    if (this.shouldLog(LogLevel.DEBUG)) {
      // Use info since Docusaurus has no debug level
      baseLogger.info(`${this.getPrefix()} [DEBUG] ${msg}`);
    }
  }
}

/**
 * Factory function to create logger instances
 * 
 * @param name - Name for log prefix
 * @param logLevel - Minimum log level to display
 * @returns A new logger instance
 */
export function createLogger(name: string, logLevel: LogLevelType = LogLevel.INFO): Logger {
  return new PluginLogger(name, logLevel);
}

/**
 * Create logger for plugin operations with standard naming
 * 
 * @param config - Plugin configuration (optional)
 * @returns Logger instance with standard plugin name
 */
export function createPluginLogger(config?: { logLevel?: LogLevelType }): Logger {
  const logLevel = config?.logLevel ?? LogLevel.INFO;
  return createLogger('docusaurus-plugin-llms-txt', logLevel);
} 
/**
 * Logger utility with standard log levels, JSON output support, and collectors
 *
 * Usage:
 *   import { Logger, LogLevel } from './utils/logger.js';
 *
 *   // Standard logging (default)
 *   const log = new Logger();
 *   log.info('Starting process...');
 *   log.warn('Config not found');
 *   log.error('Something went wrong');
 *
 *   // JSON logging
 *   const jsonLog = new Logger({ format: 'json' });
 *   jsonLog.info('Starting process...');
 *   // Output: {"level":"info","message":"Starting process...","timestamp":"..."}
 *
 *   // Collectors for batching entries
 *   const collector = log.collector('errors');
 *   collector.failure('Link broken: https://example.com');
 *   collector.flush({ header: 'Broken Links:', limit: 20 });
 *
 * Environment Variables:
 *   LOGGER_LEVEL   Set log verbosity: error, warn, info, debug, trace (default: info)
 *   LOGGER_FORMAT  Set output format: text, json (default: text)
 */

// ============================================
// Log Levels
// ============================================

export const LogLevel = {
  ERROR: 0,
  WARN: 1,
  INFO: 2,
  DEBUG: 3,
  TRACE: 4,
};

const LevelNames = {
  [LogLevel.ERROR]: 'error',
  [LogLevel.WARN]: 'warn',
  [LogLevel.INFO]: 'info',
  [LogLevel.DEBUG]: 'debug',
  [LogLevel.TRACE]: 'trace',
};

function getLogLevelFromEnv() {
  const envLevel = process.env.LOGGER_LEVEL?.toUpperCase();
  if (envLevel && LogLevel[envLevel] !== undefined) {
    return LogLevel[envLevel];
  }
  return LogLevel.INFO;
}

function getFormatFromEnv() {
  const envFormat = process.env.LOGGER_FORMAT?.toLowerCase();
  if (envFormat === 'json') return 'json';
  return 'text';
}

// ============================================
// Colors (for text format)
// ============================================

export const colors = {
  red: (s) => `\x1b[31m${s}\x1b[0m`,
  green: (s) => `\x1b[32m${s}\x1b[0m`,
  yellow: (s) => `\x1b[33m${s}\x1b[0m`,
  blue: (s) => `\x1b[34m${s}\x1b[0m`,
  gray: (s) => `\x1b[90m${s}\x1b[0m`,
  cyan: (s) => `\x1b[36m${s}\x1b[0m`,
  magenta: (s) => `\x1b[35m${s}\x1b[0m`,
  bold: (s) => `\x1b[1m${s}\x1b[0m`,
};

// ============================================
// Log Entry
// ============================================

export class LogEntry {
  constructor(level, message, meta = {}) {
    this.level = level;
    this.message = message;
    this.meta = meta;
    this.timestamp = new Date();
  }
}

// ============================================
// Log Collector
// ============================================

export class LogCollector {
  constructor(name, logger) {
    this.name = name;
    this.logger = logger;
    this.entries = [];
  }

  add(level, message, meta = {}) {
    this.entries.push(new LogEntry(level, message, meta));
    return this;
  }

  error(message, meta) {
    return this.add(LogLevel.ERROR, message, meta);
  }

  warn(message, meta) {
    return this.add(LogLevel.WARN, message, meta);
  }

  info(message, meta) {
    return this.add(LogLevel.INFO, message, meta);
  }

  debug(message, meta) {
    return this.add(LogLevel.DEBUG, message, meta);
  }

  trace(message, meta) {
    return this.add(LogLevel.TRACE, message, meta);
  }

  success(message, meta = {}) {
    return this.add(LogLevel.INFO, message, { ...meta, style: 'success' });
  }

  failure(message, meta = {}) {
    return this.add(LogLevel.ERROR, message, { ...meta, style: 'failure' });
  }

  getEntries() {
    return [...this.entries];
  }

  getEntriesByLevel(level) {
    return this.entries.filter((e) => e.level === level);
  }

  count(level = null) {
    if (level === null) return this.entries.length;
    return this.entries.filter((e) => e.level === level).length;
  }

  hasErrors() {
    return this.entries.some((e) => e.level === LogLevel.ERROR);
  }

  isEmpty() {
    return this.entries.length === 0;
  }

  flush(options = {}) {
    const { header = null, indent = '  ', limit = 0 } = options;

    if (this.entries.length === 0) return this;

    if (header) {
      this.logger.info(header);
    }

    const entriesToLog = limit > 0 ? this.entries.slice(0, limit) : this.entries;

    for (const entry of entriesToLog) {
      if (this.logger.format === 'json') {
        this.logger._outputJson(entry.level, entry.message, entry.meta);
      } else {
        let formattedMessage = entry.message;
        if (entry.meta.style === 'success') {
          formattedMessage = `${colors.green('✓')} ${entry.message}`;
        } else if (entry.meta.style === 'failure') {
          formattedMessage = `${colors.red('✗')} ${entry.message}`;
        }
        this.logger._outputText(entry.level, `${indent}${formattedMessage}`, { skipPrefix: !!entry.meta.style });
      }
    }

    if (limit > 0 && this.entries.length > limit) {
      this.logger.info(`${indent}${colors.gray(`... and ${this.entries.length - limit} more`)}`);
    }

    return this;
  }

  clear() {
    this.entries = [];
    return this;
  }
}

// ============================================
// Logger
// ============================================

export class Logger {
  /**
   * Create a new logger
   * @param {object} options - Logger options
   * @param {number} options.level - Log level (default: from LOGGER_LEVEL env or INFO)
   * @param {string} options.format - Output format: 'text' or 'json' (default: from LOGGER_FORMAT env or 'text')
   * @param {boolean} options.timestamps - Show timestamps in text format (default: false)
   */
  constructor(options = {}) {
    this.level = options.level ?? getLogLevelFromEnv();
    this.format = options.format ?? getFormatFromEnv();
    this.timestamps = options.timestamps ?? false;
    this.collectors = new Map();
  }

  setLevel(level) {
    if (typeof level === 'string') {
      this.level = LogLevel[level.toUpperCase()] ?? LogLevel.INFO;
    } else {
      this.level = level;
    }
    return this;
  }

  setFormat(format) {
    this.format = format === 'json' ? 'json' : 'text';
    return this;
  }

  _outputJson(level, message, meta = {}) {
    if (level > this.level) return;

    const entry = {
      level: LevelNames[level],
      message,
      timestamp: new Date().toISOString(),
      ...meta,
    };

    const output = JSON.stringify(entry);
    if (level === LogLevel.ERROR) {
      console.error(output);
    } else {
      console.log(output);
    }
  }

  _outputText(level, message, options = {}) {
    if (level > this.level) return;

    const { skipPrefix = false } = options;

    let parts = [];

    // Timestamp
    if (this.timestamps) {
      parts.push(colors.gray(`[${new Date().toISOString().slice(11, 19)}]`));
    }

    // Level prefix
    if (!skipPrefix) {
      const prefixes = {
        [LogLevel.ERROR]: colors.red('ERROR'),
        [LogLevel.WARN]: colors.yellow('WARN'),
        [LogLevel.INFO]: colors.blue('INFO'),
        [LogLevel.DEBUG]: colors.gray('DEBUG'),
        [LogLevel.TRACE]: colors.gray('TRACE'),
      };
      parts.push(prefixes[level] || 'INFO');
    }

    // Message
    parts.push(message);

    const fullMessage = parts.join(' ');

    if (level === LogLevel.ERROR) {
      console.error(fullMessage);
    } else {
      console.log(fullMessage);
    }
  }

  _output(level, message, meta = {}) {
    if (this.format === 'json') {
      this._outputJson(level, message, meta);
    } else {
      this._outputText(level, message);
    }
  }

  error(message, meta = {}) {
    this._output(LogLevel.ERROR, message, meta);
    return this;
  }

  warn(message, meta = {}) {
    this._output(LogLevel.WARN, message, meta);
    return this;
  }

  info(message, meta = {}) {
    this._output(LogLevel.INFO, message, meta);
    return this;
  }

  debug(message, meta = {}) {
    this._output(LogLevel.DEBUG, message, meta);
    return this;
  }

  trace(message, meta = {}) {
    this._output(LogLevel.TRACE, message, meta);
    return this;
  }

  /**
   * Log a success message (green checkmark)
   */
  success(message, meta = {}) {
    if (this.format === 'json') {
      this._outputJson(LogLevel.INFO, message, { ...meta, status: 'success' });
    } else {
      this._outputText(LogLevel.INFO, `${colors.green('✓')} ${message}`, { skipPrefix: true });
    }
    return this;
  }

  /**
   * Log a failure message (red X)
   */
  failure(message, meta = {}) {
    if (this.format === 'json') {
      this._outputJson(LogLevel.ERROR, message, { ...meta, status: 'failure' });
    } else {
      this._outputText(LogLevel.ERROR, `${colors.red('✗')} ${message}`, { skipPrefix: true });
    }
    return this;
  }

  /**
   * Log a step/action message (arrow indicator)
   */
  step(message, meta = {}) {
    if (this.format === 'json') {
      this._outputJson(LogLevel.INFO, message, { ...meta, type: 'step' });
    } else {
      this._outputText(LogLevel.INFO, `${colors.yellow('→')} ${message}`, { skipPrefix: true });
    }
    return this;
  }

  /**
   * Log a header/title message
   */
  header(message, meta = {}) {
    if (this.format === 'json') {
      this._outputJson(LogLevel.INFO, message, { ...meta, type: 'header' });
    } else {
      this._outputText(LogLevel.INFO, colors.bold(message), { skipPrefix: true });
    }
    return this;
  }

  /**
   * Print an empty line (text format only)
   */
  newline() {
    if (this.format === 'text' && this.level >= LogLevel.INFO) {
      console.log('');
    }
    return this;
  }

  collector(name) {
    if (!this.collectors.has(name)) {
      this.collectors.set(name, new LogCollector(name, this));
    }
    return this.collectors.get(name);
  }

  getCollectors() {
    return this.collectors;
  }

  flushAll(options = {}) {
    for (const collector of this.collectors.values()) {
      collector.flush(options);
    }
    return this;
  }

  clearAll() {
    for (const collector of this.collectors.values()) {
      collector.clear();
    }
    return this;
  }
}

export default Logger;

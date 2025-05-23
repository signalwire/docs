/**
 * Types related to filesystem operations
 */

/**
 * Entry representing an HTML file found during directory traversal
 */
export interface HtmlFileEntry {
  /** Relative path to the HTML file from the base directory */
  readonly relPath: string;
}

/**
 * Represents a cache fingerprint for a processed file
 */
export interface FileFingerprint {
  /** Hash of the file's content */
  readonly hash: string;
  /** Document title */
  readonly title: string;
  /** Document description */
  readonly description: string;
}

/**
 * Schema for the plugin's cache file
 */
export interface CacheSchema {
  /** Plugin version used to create the cache */
  readonly pluginVersion: string;
  /** Hash of the plugin configuration */
  readonly configHash: string;
  /** Map of file paths to their fingerprints */
  readonly files: Record<string, FileFingerprint>;
} 
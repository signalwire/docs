/**
 * Cache I/O operations
 * Focused module for cache file reading, writing, and atomic operations
 */

import fs from 'fs-extra';
import path from 'path';
import type { CacheSchema } from '../../types';
import { createCacheError, getErrorCause } from '../../errors';
import { TEMP_FILE_PREFIX, JSON_INDENT } from '../../constants';

/**
 * Cache file I/O handler
 */
export class CacheIO {
  constructor(private readonly _cachePath: string) {}

  /**
   * Load cache from disk, returning empty cache if file doesn't exist
   */
  async loadCache(): Promise<CacheSchema> {
    try {
      const data = await fs.readJson(this._cachePath);
      return data as CacheSchema;
    } catch {
      // Return empty cache if file doesn't exist or is invalid
      return { pluginVersion: '', configHash: '', routes: [] };
    }
  }

  /**
   * Save cache to disk atomically
   */
  async saveCache(cache: CacheSchema): Promise<void> {
    try {
      await this.writeJsonAtomic(this._cachePath, cache);
    } catch (error) {
      const errorCause = getErrorCause(error);
      throw createCacheError(
        'Failed to write cache file', 
        { cachePath: this._cachePath, cause: errorCause }
      );
    }
  }

  /**
   * Atomically writes JSON data to filePath
   * Uses temporary file + rename for atomic operation
   */
  private async writeJsonAtomic(filePath: string, data: unknown): Promise<void> {
    const dir = path.dirname(filePath);
    await fs.ensureDir(dir);
    
    // Create temporary file with timestamp to avoid conflicts
    const tmp = path.join(dir, `${TEMP_FILE_PREFIX}${path.basename(filePath)}-${Date.now()}`);
    
    try {
      // Write to temporary file first
      await fs.writeFile(tmp, JSON.stringify(data, null, JSON_INDENT), 'utf8');
      // Atomic rename to final location
      await fs.rename(tmp, filePath);
    } catch (error) {
      // Clean up temporary file if write failed
      try {
        await fs.remove(tmp);
      } catch {
        // Ignore cleanup errors
      }
      throw error;
    }
  }

  /**
   * Get cache file information for debugging
   */
  getCacheInfo(): { dir: string; path: string } {
    return { 
      dir: path.dirname(this._cachePath), 
      path: this._cachePath 
    };
  }
} 
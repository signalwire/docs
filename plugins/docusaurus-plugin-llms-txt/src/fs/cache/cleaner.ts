import fs from 'fs-extra';
import type { Logger } from '../../types/logging';
import { noopLogger } from '../../logging/logger';
import { loadCache } from './manager';
import { htmlPathToMdPath } from '../path';
import { logAndContinue } from '../../utils/errors';

/**
 * Clean up markdown files using the cache for tracking
 * This is more efficient than recursively searching for all .md files
 */
export async function cleanupMarkdownFiles(
  mdOutDir: string, 
  siteDir: string,
  logger: Logger = noopLogger
): Promise<void> {
  try {
    const { cache } = await loadCache(siteDir);
    if (!Object.keys(cache.files).length) {
      logger.info('No cache entries found for cleanup');
      return;
    }
    
    logger.info(`Cleaning up markdown files based on cache entries`);
    let count = 0;
    
    for (const htmlPath of Object.keys(cache.files)) {
      const mdPath = htmlPathToMdPath(htmlPath, mdOutDir);
      if (await fs.pathExists(mdPath)) {
        try {
          await fs.remove(mdPath);
          count++;
        } catch (error) {
          logAndContinue(logger, 'Failed to remove file', error, mdPath);
        }
      }
    }
    
    logger.info(`Removed ${count} markdown files`);
  } catch (error) {
    logAndContinue(logger, 'Error cleaning up markdown files', error);
  }
} 
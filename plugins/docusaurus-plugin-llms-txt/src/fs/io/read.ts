import path from 'path';
import { createFileError, getErrorCause } from '../../utils';
import { toPosixPath } from '../path';
import { safeGlobby } from '@docusaurus/utils';
import { HtmlFileEntry } from '../../types';

/**
 * Async generator that recursively finds HTML files in a directory and yields them as HtmlFileEntry objects.
 * 
 * @param dir - Directory to search for HTML files
 * @param baseDir - Base directory for creating relative paths
 * @returns AsyncGenerator yielding HtmlFileEntry objects
 */
export async function* walkHtmlFiles(
  dir: string,
  baseDir: string
): AsyncGenerator<HtmlFileEntry> {
  try {
    // Find all HTML files using safeGlobby for better Windows path handling
    const htmlPattern = path.join(dir, '**/*.html');
    
    const htmlFiles = await safeGlobby([htmlPattern], {
      onlyFiles: true,
      absolute: true,
    });
    
    // Process files one by one
    for (const filePath of htmlFiles) {
      const relativePath = path.relative(baseDir, filePath);
      const posixRelPath = toPosixPath(relativePath);
      
      // Note: Exclusion is now handled in the orchestrator to avoid duplicate path processing
      yield { relPath: posixRelPath };
    }
  } catch (error) {
    const errorCause = getErrorCause(error);
    throw createFileError(
      `Failed to read directory ${dir}`,
      dir,
      errorCause
    );
  }
} 
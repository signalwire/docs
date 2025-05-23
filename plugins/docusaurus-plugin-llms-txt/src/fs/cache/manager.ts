import fs from 'fs-extra';
import path from 'path';
import { DocInfo, PluginOptions } from '../../types/plugin';
import { createFileError, getErrorCause } from '../../utils/errors';
import { writeJsonAtomic } from '../io/atomic';
import { md5Hash } from '@docusaurus/utils';
import { FileFingerprint, CacheSchema } from '../../types/fs';
import { getCacheDir, getCacheFilePath } from '../path';
import { CACHE_FILE_NAME } from '../../constants';

export function calcConfigHash(options: Partial<PluginOptions>): string {
  const stable = JSON.stringify(options, Object.keys(options).sort());
  return md5Hash(stable);
}

export async function loadCache(siteDir: string): Promise<{ cache: CacheSchema; dir: string }> {
  const cacheDir = getCacheDir(siteDir);
  const cachePath = getCacheFilePath(siteDir);
  try {
    const data = await fs.readJson(cachePath);
    return { cache: data as CacheSchema, dir: cacheDir };
  } catch (error) {
    // Non-critical - return empty cache if we can't load
    return { cache: { pluginVersion: '', configHash: '', files: {} }, dir: cacheDir };
  }
}

export async function saveCache(cacheDir: string, cache: CacheSchema): Promise<void> {
  const cachePath = path.join(cacheDir, CACHE_FILE_NAME);
  try {
    await writeJsonAtomic(cachePath, cache);
  } catch (error) {
    const errorCause = getErrorCause(error);
    throw createFileError('Failed to write cache file', cachePath, errorCause);
  }
}

export function fileUnchanged(entry: FileFingerprint, hash: string): boolean {
  return entry?.hash === hash;
}

export function toFingerprint(hash: string, doc: DocInfo): FileFingerprint {
  return { hash, title: doc.title, description: doc.description };
}

export async function hashFile(filePath: string): Promise<string> {
  const content = await fs.readFile(filePath, 'utf8');
  return md5Hash(content);
} 
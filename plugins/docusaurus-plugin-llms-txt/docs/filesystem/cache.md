# Cache Management

## Overview

The Cache Management system (`src/filesystem/cache/`) provides intelligent caching to avoid unnecessary reprocessing of HTML files. It uses file content hashing and configuration fingerprinting to determine when files need to be regenerated.

## Architecture

The caching system follows a **content-addressable storage pattern** where cache validity is determined by:

1. **File Content Hash**: MD5 hash of HTML file content
2. **Configuration Hash**: Serialized plugin configuration
3. **Plugin Version**: Plugin version for cache invalidation

### Cache Schema

```typescript
interface CacheSchema {
  pluginVersion: string;                    // Plugin version for invalidation
  configHash: string;                       // Configuration fingerprint
  files: Record<string, FileFingerprint>;   // File path → metadata mapping
}

interface FileFingerprint {
  hash: string;        // MD5 hash of file content
  title: string;       // Extracted document title
  description: string; // Extracted document description
}
```

## Core Components

### Cache Manager (`cache/manager.ts`)

Handles cache CRUD operations and validation logic.

#### `loadCache(siteDir: string)`

Loads existing cache or creates empty cache structure:

```typescript
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
```

**Features:**
- Graceful degradation: Returns empty cache if loading fails
- No exceptions thrown for missing cache files
- Provides both cache data and directory path

#### `saveCache(cacheDir: string, cache: CacheSchema)`

Atomically saves cache to disk:

```typescript
export async function saveCache(cacheDir: string, cache: CacheSchema): Promise<void> {
  const cachePath = path.join(cacheDir, CACHE_FILE_NAME);
  try {
    await writeJsonAtomic(cachePath, cache);
  } catch (error) {
    const errorCause = getErrorCause(error);
    throw createFileError('Failed to write cache file', cachePath, errorCause);
  }
}
```

**Features:**
- Uses atomic write operations to prevent corruption
- Creates directory structure if needed
- Provides detailed error context

#### `calcConfigHash(options: Partial<PluginOptions>)`

Creates stable hash of plugin configuration:

```typescript
export function calcConfigHash(options: Partial<PluginOptions>): string {
  const stable = JSON.stringify(options, Object.keys(options).sort());
  return md5Hash(stable);
}
```

**Features:**
- Deterministic serialization with sorted keys
- Detects any configuration changes
- Uses MD5 for fast hashing

#### `hashFile(filePath: string)`

Generates content hash for a file:

```typescript
export async function hashFile(filePath: string): Promise<string> {
  const content = await fs.readFile(filePath, 'utf8');
  return md5Hash(content);
}
```

**Features:**
- UTF-8 encoding for consistent text handling
- MD5 hashing for speed and collision resistance
- Async operation for non-blocking I/O

### Cache Cleaner (`cache/cleaner.ts`)

Handles cleanup of generated files using cache records.

#### `cleanupMarkdownFiles()`

Removes generated Markdown files based on cache entries:

```typescript
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
```

**Features:**
- Cache-driven cleanup (more efficient than directory scanning)
- Graceful error handling for individual file failures
- Progress reporting and statistics
- Non-critical operation (continues on errors)

## Cache Lifecycle

### 1. Cache Loading

```typescript
// Load existing cache or create empty
const { cache, dir: cacheDir } = await loadCache(siteDir);
const cfgHash = calcConfigHash(config);

// Create mutable copy for updates
const mutableCache = {
  pluginVersion,
  configHash: cfgHash, 
  files: { ...cache.files }
};
```

### 2. Version Validation

```typescript
// Reset cache if version changed
if (mutableCache.pluginVersion !== pluginVersion) {
  mutableCache.files = {};
  mutableCache.pluginVersion = pluginVersion;
}
```

### 3. File Processing

```typescript
for await (const { relPath } of htmlFiles) {
  const hash = await hashFile(absPath);
  const cached = mutableCache.files[relPath];
  
  // Check if we can use cached result
  if (cached && fileUnchanged(cached, hash) && config.enableCache !== false) {
    // Use cached metadata
    docs.push({ 
      routePath: generateRoutePath(relPath, !!config.enableMarkdownFiles, log),
      htmlPath: relPath, 
      title: cached.title, 
      description: cached.description 
    });
    continue;
  }
  
  // Process file and update cache
  const doc = await processHtmlFile(/* ... */);
  docs.push(doc);
  mutableCache.files[relPath] = toFingerprint(hash, doc);
}
```

### 4. Cache Cleanup

```typescript
// Remove entries for files that no longer exist
Object.keys(mutableCache.files).forEach(k => { 
  if (!visited.has(k)) {
    delete mutableCache.files[k];
  }
});
```

### 5. Cache Persistence

```typescript
// Save updated cache
await saveCache(cacheDir, mutableCache);
logger.info(`Cache saved (${Object.keys(mutableCache.files).length} entries)`);
```

## Cache Invalidation Strategies

### File-Level Invalidation

Cache entries are invalidated when:
- File content changes (different hash)
- File is deleted (removed from filesystem)
- Generated Markdown file is missing

### Global Invalidation

Entire cache is invalidated when:
- Plugin version changes
- Configuration changes
- Cache file is corrupted or missing

### Selective Invalidation

Individual entries are removed when:
- Files are excluded by new configuration
- Files no longer exist in the build directory

## Performance Benefits

### Build Time Reduction

**Without Cache:**
```
1000 files × 50ms processing = 50 seconds
```

**With Cache (90% hit rate):**
```
100 files × 50ms processing + 900 files × 1ms cache lookup = 5.9 seconds
```

### Memory Efficiency

- Only metadata is cached (not full content)
- Cache size grows linearly with file count
- Typical cache entry: ~100 bytes per file

### I/O Optimization

- Avoids re-reading unchanged HTML files
- Skips Markdown generation for cached files
- Reduces disk write operations

## Cache Storage

### Location

```
<siteDir>/.docusaurus/.llms-txt/cache.json
```

### Format

```json
{
  "pluginVersion": "1.0.0",
  "configHash": "a1b2c3d4e5f6...",
  "files": {
    "docs/api/index.html": {
      "hash": "d4e5f6a1b2c3...",
      "title": "API Documentation",
      "description": "Complete API reference"
    },
    "guides/getting-started.html": {
      "hash": "f6a1b2c3d4e5...",
      "title": "Getting Started",
      "description": "Quick start guide"
    }
  }
}
```

### Size Considerations

- **Small Sites** (< 100 pages): < 10KB cache file
- **Medium Sites** (100-1000 pages): 10-100KB cache file  
- **Large Sites** (1000+ pages): 100KB-1MB cache file

## Configuration Integration

### Cache Control

```typescript
// Enable/disable caching
{
  enableCache: true,  // Default: enabled
}
```

### Cache Behavior

- **Enabled**: Uses cache for unchanged files
- **Disabled**: Processes all files but still maintains cache for cleanup
- **Missing**: Treats as disabled, creates new cache

### Debug Information

```typescript
// Debug logging shows cache statistics
logger.info(`Cache hit rate: ${hitCount}/${totalCount} (${hitRate}%)`);
logger.info(`Cache saved (${Object.keys(cache.files).length} entries)`);
```

## Error Handling

### Cache Loading Errors

```typescript
// Graceful degradation - continue with empty cache
try {
  const data = await fs.readJson(cachePath);
  return { cache: data as CacheSchema, dir: cacheDir };
} catch (error) {
  return { cache: { pluginVersion: '', configHash: '', files: {} }, dir: cacheDir };
}
```

### Cache Saving Errors

```typescript
// Critical error - propagate to user
try {
  await writeJsonAtomic(cachePath, cache);
} catch (error) {
  throw createFileError('Failed to write cache file', cachePath, error);
}
```

### File Hashing Errors

```typescript
// Continue processing with empty hash
try { 
  hash = await hashFile(absPath);
} catch (error) { 
  logger.error(`Failed to hash ${relPath}: ${errorMsg}`); 
  hash = ''; 
}
```

## Best Practices

### Cache Maintenance

1. **Regular Cleanup**: Use CLI cleanup command periodically
2. **Version Updates**: Cache automatically invalidates on plugin updates
3. **Configuration Changes**: Cache invalidates when options change
4. **Manual Reset**: Delete cache directory to force full rebuild

### Performance Optimization

1. **Enable Caching**: Keep `enableCache: true` for development
2. **Exclude Patterns**: Use specific exclusion patterns to avoid cache churn
3. **Stable Configuration**: Avoid frequent configuration changes
4. **Monitor Cache Size**: Large caches may indicate configuration issues

### Debugging

1. **Cache Statistics**: Enable debug logging to see hit rates
2. **Cache Inspection**: Examine cache.json for unexpected entries
3. **Force Rebuild**: Disable cache temporarily to isolate issues
4. **File Tracking**: Use debug logs to trace file processing decisions

## Integration Points

### With Orchestrator

```typescript
// Cache loading and management
const { cache, dir: cacheDir } = await loadCache(siteDir);
const docs = await processHtmlFilesStream(/* cache integration */);
await saveCache(cacheDir, updatedCache);
```

### With HTML Processor

```typescript
// Cache validation for Markdown files
const mdExists = await checkMarkdownFileExists(relPath, mdOutDir);
if (!mdExists) {
  // Regenerate even if HTML unchanged
  await processAndAddToCache(relPath, hash);
}
```

### With CLI Commands

```typescript
// Cleanup command uses cache for file tracking
await cleanupMarkdownFiles(mdOutDir, siteDir, log);
```

## Related Components

- **[Orchestrator](../pipeline/orchestrator.md)**: Integrates cache into processing pipeline
- **[File I/O](./io.md)**: Provides atomic write operations for cache persistence
- **[Path Utilities](./path.md)**: Handles cache file path generation
- **[CLI Commands](../cli/commands.md)**: Provides cache cleanup functionality 
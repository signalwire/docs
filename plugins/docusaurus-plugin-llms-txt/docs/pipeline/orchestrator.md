# Orchestrator

## Overview

The Orchestrator (`src/pipeline/core/orchestrator.ts`) is the main workflow coordinator that manages the entire HTML-to-Markdown conversion pipeline. It handles file discovery, processing coordination, caching integration, and error management across the entire document set.

## Core Responsibilities

1. **Workflow Coordination**: Orchestrates the complete processing pipeline
2. **Cache Management**: Integrates with the caching system for performance
3. **Stream Processing**: Manages async file processing streams
4. **Error Handling**: Coordinates error handling across all processing stages
5. **Progress Tracking**: Provides processing statistics and progress information

## Key Functions

### `processHtmlFilesStream()`

The main orchestration function that processes HTML files through the complete pipeline:

```typescript
export async function processHtmlFilesStream(
  htmlFiles: AsyncIterable<HtmlFileEntry>,
  docsDir: string,
  mdOutDir: string,
  siteDir: string,
  config: PluginOptions,
  logger: Logger,
  baseUrl: string = '',
): Promise<DocInfo[]>
```

#### Processing Flow

1. **Cache Initialization**
   ```typescript
   const { cache, dir: cacheDir } = await loadCache(siteDir);
   const cfgHash = calcConfigHash(config);
   
   const mutableCache = {
     pluginVersion,
     configHash: cfgHash, 
     files: { ...cache.files }
   };
   ```

2. **Version Validation**
   ```typescript
   if (mutableCache.pluginVersion !== pluginVersion) {
     mutableCache.files = {};
     mutableCache.pluginVersion = pluginVersion;
   }
   ```

3. **Exclusion Setup**
   ```typescript
   const isExcluded = config.excludePaths?.length 
     ? createMatcher([...config.excludePaths])
     : (): boolean => false;
   ```

4. **File Processing Loop**
   ```typescript
   for await (const { relPath } of htmlFiles) {
     // Check exclusions
     const normalizedPath = relPath.startsWith('/') ? relPath : `/${relPath}`;
     if (isExcluded(normalizedPath)) {
       continue;
     }
     
     // Check cache
     const hash = await hashFile(absPath);
     const cached = mutableCache.files[relPath];
     
     if (shouldUseCache && config.enableCache !== false) {
       // Use cached result
     } else {
       // Process file
       await processAndAddToCache(relPath, hash);
     }
   }
   ```

5. **Cache Cleanup and Persistence**
   ```typescript
   // Remove stale entries
   Object.keys(mutableCache.files).forEach(k => { 
     if (!visited.has(k) || isExcluded(normalizedPath)) {
       delete mutableCache.files[k];
     }
   });
   
   // Save updated cache
   await saveCache(cacheDir, mutableCache);
   ```

## Cache Integration

### Cache Loading Strategy

The orchestrator implements intelligent cache loading:

```typescript
const { cache, dir: cacheDir } = await loadCache(siteDir);
```

**Features:**
- Graceful handling of missing cache files
- Automatic cache directory creation
- Version-aware cache validation

### Cache Validation Logic

```typescript
const shouldUseCache = cached && fileUnchanged(cached, hash);

if (shouldUseCache && config.enableMarkdownFiles) {
  const mdExists = await checkMarkdownFileExists(relPath, mdOutDir);
  if (!mdExists) {
    // Regenerate even though HTML hasn't changed
    await processAndAddToCache(relPath, hash);
    continue;
  }
}
```

**Validation Checks:**
- File content hash comparison
- Generated Markdown file existence
- Configuration hash validation
- Plugin version compatibility

### Cache Update Strategy

```typescript
async function processAndAddToCache(relPath: string, hash: string): Promise<void> {
  const doc = await processHtmlFile(relPath, docsDir, mdOutDir, config, log, baseUrl);
  docs.push(doc);
  mutableCache.files[relPath] = toFingerprint(hash, doc);
}
```

**Update Process:**
- Process HTML file to DocInfo
- Add to results collection
- Update cache with new fingerprint
- Handle processing errors gracefully

## Error Handling Strategy

### File-Level Error Handling

```typescript
.catch((error): void => {
  const errorMsg = getErrorMessage(error);
  const errorCause = getErrorCause(error);
  log.error(`Error processing ${relPath}: ${errorMsg}`);
  errors.push(errorCause || new Error(String(error)));
});
```

**Strategy:**
- Log individual file errors
- Continue processing other files
- Collect errors for final reporting
- Preserve error context and stack traces

### Cache Error Handling

```typescript
try { 
  await saveCache(cacheDir, mutableCache); 
  log.info(`Cache saved (${Object.keys(mutableCache.files).length} entries)`);
} catch (error) {
  const errorMsg = getErrorMessage(error);
  log.error(`Failed to save cache: ${errorMsg}`);
}
```

**Strategy:**
- Non-critical cache operations don't fail the build
- Detailed error logging for debugging
- Graceful degradation when cache operations fail

## Performance Optimizations

### Streaming Processing

```typescript
const tasks: Promise<void>[] = [];

for await (const { relPath } of htmlFiles) {
  // Process files as they're discovered
  const task = processAndAddToCache(relPath, hash);
  tasks.push(task);
}

await Promise.all(tasks);
```

**Benefits:**
- Memory-efficient file processing
- Parallel processing of independent files
- Early start of processing pipeline
- Responsive progress reporting

### Exclusion Optimization

```typescript
// Early exclusion check before expensive operations
const normalizedPath = relPath.startsWith('/') ? relPath : `/${relPath}`;
if (isExcluded(normalizedPath)) {
  log.debug(`Skipping excluded path: ${relPath}`);
  continue;
}
```

**Benefits:**
- Avoids expensive file operations for excluded files
- Reduces cache churn from excluded files
- Improves overall processing performance

### Cache Optimization

```typescript
// Only hash files when necessary
let hash: string;
try { 
  hash = await hashFile(abs);
} catch (error) { 
  log.error(`Failed to hash ${relPath}: ${errorMsg}`); 
  hash = ''; 
}

// Skip processing if cache hit
if (cached && fileUnchanged(cached, hash) && config.enableCache !== false) {
  // Use cached metadata without reprocessing
}
```

**Benefits:**
- Avoids redundant file processing
- Reduces I/O operations
- Maintains cache consistency

## Configuration Integration

### Cleanup Mode Handling

```typescript
// If markdown files are disabled, clean up existing ones
if (!config.enableMarkdownFiles) {
  await cleanupMarkdownFiles(mdOutDir, siteDir, log);
}
```

**Features:**
- Automatic cleanup when switching modes
- Cache-driven cleanup for efficiency
- Graceful handling of cleanup errors

### Path Rules Integration

The orchestrator respects configuration-driven exclusions:

```typescript
const isExcluded = config.excludePaths?.length 
  ? createMatcher([...config.excludePaths])
  : (): boolean => false;
```

**Features:**
- Glob pattern matching for flexible exclusions
- Performance-optimized matcher creation
- Consistent exclusion logic across the pipeline

## Monitoring and Logging

### Progress Reporting

```typescript
log.debug('Processing HTML files (stream)');
log.info(`Cache saved (${Object.keys(mutableCache.files).length} entries)`);
```

**Information Provided:**
- Processing stage indicators
- Cache statistics and hit rates
- File processing progress
- Error summaries and counts

### Debug Information

```typescript
log.debug(`Skipping excluded path: ${relPath}`);
log.debug(`Markdown file missing for ${relPath}, regenerating`);
```

**Debug Details:**
- Exclusion decisions
- Cache hit/miss reasons
- File regeneration triggers
- Processing decision rationale

## Integration Points

### With File Discovery

```typescript
const htmlStream = walkHtmlFiles(docsDir, docsDir);
const docs = await processHtmlFilesStream(htmlStream, /* ... */);
```

**Integration:**
- Consumes async file stream
- Handles file discovery errors
- Processes files as they're discovered

### With HTML Processor

```typescript
const doc = await processHtmlFile(relPath, docsDir, mdOutDir, config, log, baseUrl);
```

**Integration:**
- Delegates individual file processing
- Handles processor errors gracefully
- Collects processing results

### With Cache System

```typescript
const { cache, dir: cacheDir } = await loadCache(siteDir);
await saveCache(cacheDir, mutableCache);
```

**Integration:**
- Manages cache lifecycle
- Handles cache validation
- Coordinates cache updates

## Usage Examples

### Basic Orchestration

```typescript
const htmlFiles = walkHtmlFiles(docsDir, docsDir);
const docs = await processHtmlFilesStream(
  htmlFiles,
  docsDir,
  mdOutDir,
  siteDir,
  config,
  logger,
  baseUrl
);
```

### With Custom Configuration

```typescript
const config = {
  enableMarkdownFiles: true,
  enableCache: true,
  excludePaths: ['/internal/**', '/temp/**'],
  logLevel: LogLevel.DEBUG
};

const docs = await processHtmlFilesStream(/* ... */);
```

### Error Handling

```typescript
try {
  const docs = await processHtmlFilesStream(/* ... */);
  console.log(`Processed ${docs.length} documents`);
} catch (error) {
  console.error('Processing failed:', error.message);
}
```

## Best Practices

### Performance

1. **Enable Caching**: Use `enableCache: true` for development
2. **Specific Exclusions**: Use targeted exclusion patterns
3. **Monitor Cache Size**: Large caches may indicate issues
4. **Debug Logging**: Use debug logs to understand processing decisions

### Error Handling

1. **Graceful Degradation**: Continue processing despite individual failures
2. **Error Collection**: Collect and report all errors at the end
3. **Context Preservation**: Maintain file paths and error context
4. **Logging Strategy**: Use appropriate log levels for different scenarios

### Configuration

1. **Validate Early**: Check configuration before processing starts
2. **Document Exclusions**: Clearly document exclusion patterns
3. **Test Configurations**: Verify configurations with representative data
4. **Monitor Performance**: Track processing times and cache hit rates

## Related Components

- **[HTML Processor](./html-processor.md)**: Processes individual HTML files
- **[Cache Management](../filesystem/cache.md)**: Provides caching functionality
- **[File I/O](../filesystem/io.md)**: Handles file discovery and reading
- **[Configuration](../config/plugin-options.md)**: Defines orchestrator options 
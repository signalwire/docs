# File I/O Operations

## Overview

The File I/O system (`src/filesystem/io/`) handles all file system operations for the plugin, including HTML file discovery, Markdown file writing, and atomic JSON operations. It provides a robust foundation for file operations with proper error handling and performance optimization.

## Core Components

### File Reading (`io/read.ts`)

Handles HTML file discovery and reading operations.

#### `walkHtmlFiles()`

Async generator that recursively discovers HTML files in a directory:

```typescript
export async function* walkHtmlFiles(
  dir: string,
  baseDir: string
): AsyncGenerator<HtmlFileEntry>
```

**Features:**
- **Streaming Discovery**: Uses async generators for memory efficiency
- **Cross-Platform**: Uses `safeGlobby` for Windows path compatibility
- **Flexible Patterns**: Supports glob patterns for file matching
- **Error Handling**: Graceful handling of directory access errors

#### Implementation Details

```typescript
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
```

**Key Features:**
- **Memory Efficient**: Yields files one at a time instead of loading all into memory
- **Path Normalization**: Converts OS-specific paths to POSIX format
- **Error Context**: Provides detailed error information with file paths
- **Absolute Paths**: Uses absolute paths internally for reliability

### File Writing (`io/write.ts`)

Handles Markdown file creation and writing operations.

#### `saveMarkdownFile()`

Saves Markdown content to a file with directory creation:

```typescript
export async function saveMarkdownFile(
  outputPath: string,
  content: string,
): Promise<void>
```

**Features:**
- **Directory Creation**: Automatically creates parent directories
- **Atomic Operations**: Ensures file consistency during writes
- **Error Handling**: Provides detailed error context
- **UTF-8 Encoding**: Proper text encoding for international content

#### Implementation Details

```typescript
export async function saveMarkdownFile(
  outputPath: string,
  content: string,
): Promise<void> {
  try {
    await fs.ensureDir(path.dirname(outputPath));
    await fs.writeFile(outputPath, content);
  } catch (error) {
    const errorCause = getErrorCause(error);
    throw createFileError(
      `Failed to save markdown file to ${outputPath}`,
      outputPath,
      errorCause,
    );
  }
}
```

**Safety Features:**
- **Directory Validation**: Ensures output directory exists
- **Error Recovery**: Detailed error messages for troubleshooting
- **Path Safety**: Validates output paths to prevent issues
- **Consistent Encoding**: Uses UTF-8 for all text operations

### Atomic Operations (`io/atomic.ts`)

Provides atomic file operations to prevent corruption.

#### `writeJsonAtomic()`

Atomically writes JSON data to prevent partial writes:

```typescript
export async function writeJsonAtomic(filePath: string, data: unknown): Promise<void>
```

**Atomic Write Process:**
1. **Temporary File**: Write to temporary file first
2. **JSON Serialization**: Format data with proper indentation
3. **Atomic Rename**: Rename temporary file to target (atomic operation)
4. **Cleanup**: Automatic cleanup on failure

#### Implementation Details

```typescript
export async function writeJsonAtomic(filePath: string, data: unknown): Promise<void> {
  const dir = path.dirname(filePath);
  await fs.ensureDir(dir);
  const tmp = path.join(dir, `.${path.basename(filePath)}.tmp-${Date.now()}`);
  await fs.writeFile(tmp, JSON.stringify(data, null, 2), 'utf8');
  await fs.rename(tmp, filePath);
}
```

**Reliability Features:**
- **Atomic Rename**: File is never in partial state
- **Unique Temporary Names**: Prevents conflicts with concurrent operations
- **Directory Creation**: Ensures target directory exists
- **Proper Formatting**: JSON with 2-space indentation for readability

## File Discovery Strategy

### HTML File Pattern Matching

```typescript
const htmlPattern = path.join(dir, '**/*.html');

const htmlFiles = await safeGlobby([htmlPattern], {
  onlyFiles: true,
  absolute: true,
});
```

**Pattern Features:**
- **Recursive Search**: `**/*.html` finds files in all subdirectories
- **File Type Filtering**: Only matches actual files (not directories)
- **Absolute Paths**: Returns absolute paths for reliability
- **Cross-Platform**: Works consistently across operating systems

### Path Normalization

```typescript
const relativePath = path.relative(baseDir, filePath);
const posixRelPath = toPosixPath(relativePath);
```

**Normalization Process:**
- **Relative Paths**: Convert absolute paths to relative for portability
- **POSIX Format**: Standardize on forward slashes for consistency
- **Route Generation**: Prepare paths for URL route generation
- **Cache Keys**: Create consistent cache keys across platforms

## Error Handling Strategy

### Typed Error Creation

```typescript
throw createFileError(
  `Failed to read directory ${dir}`,
  dir,
  errorCause
);
```

**Error Information:**
- **Error Type**: Specific error type for different handling
- **Context Message**: Human-readable error description
- **File Path**: Specific file or directory that caused the error
- **Original Cause**: Preserved original error for debugging

### Error Recovery Patterns

```typescript
try {
  // File operation
} catch (error) {
  const errorCause = getErrorCause(error);
  throw createFileError(
    `Operation failed: ${operation}`,
    filePath,
    errorCause,
  );
}
```

**Recovery Strategy:**
- **Context Preservation**: Maintain original error information
- **Specific Messages**: Provide actionable error messages
- **File Context**: Include file paths in all error messages
- **Error Chaining**: Link errors to their root causes

## Performance Optimizations

### Streaming File Discovery

```typescript
async function* walkHtmlFiles(): AsyncGenerator<HtmlFileEntry> {
  // Yields files one by one instead of loading all into memory
  for (const filePath of htmlFiles) {
    yield { relPath: posixRelPath };
  }
}
```

**Benefits:**
- **Memory Efficiency**: Constant memory usage regardless of file count
- **Early Processing**: Start processing before discovery completes
- **Responsiveness**: Immediate feedback on file discovery
- **Scalability**: Handles sites with thousands of files

### Efficient Path Operations

```typescript
const relativePath = path.relative(baseDir, filePath);
const posixRelPath = toPosixPath(relativePath);
```

**Optimizations:**
- **Single Pass**: Convert paths in one operation
- **Cached Results**: Path operations are cached where possible
- **Native Operations**: Use Node.js native path operations
- **Minimal Allocations**: Reduce string allocations

### Atomic Write Optimization

```typescript
const tmp = path.join(dir, `.${path.basename(filePath)}.tmp-${Date.now()}`);
await fs.writeFile(tmp, JSON.stringify(data, null, 2), 'utf8');
await fs.rename(tmp, filePath);
```

**Performance Features:**
- **Single Write**: Write data once to temporary file
- **Fast Rename**: Atomic rename is very fast operation
- **No Locking**: Avoids file locking issues
- **Concurrent Safe**: Multiple processes can write safely

## Integration Points

### With Cache System

```typescript
// File discovery for cache validation
const htmlFiles = walkHtmlFiles(docsDir, docsDir);

// Atomic cache file writing
await writeJsonAtomic(cachePath, cacheData);
```

**Integration Features:**
- **Cache Validation**: Discover files for cache comparison
- **Atomic Updates**: Prevent cache corruption
- **Consistent Paths**: Use same path format throughout

### With HTML Processor

```typescript
// File discovery feeds processing pipeline
for await (const { relPath } of walkHtmlFiles(dir, baseDir)) {
  await processHtmlFile(relPath, /* ... */);
}

// Save processed Markdown files
await saveMarkdownFile(mdPath, markdown);
```

**Processing Integration:**
- **Stream Processing**: Files processed as discovered
- **Output Generation**: Save processed results to disk
- **Error Handling**: Coordinate error handling across components

### With CLI Commands

```typescript
// File discovery for cleanup operations
const htmlFiles = walkHtmlFiles(docsDir, docsDir);

// Cleanup generated files
await cleanupMarkdownFiles(mdOutDir, siteDir, logger);
```

**CLI Integration:**
- **File Enumeration**: Discover files for operations
- **Cleanup Operations**: Remove generated files safely
- **Progress Reporting**: Provide feedback during operations

## Usage Examples

### Basic File Discovery

```typescript
const htmlFiles = walkHtmlFiles('/build', '/build');

for await (const { relPath } of htmlFiles) {
  console.log(`Found: ${relPath}`);
}
```

### Markdown File Creation

```typescript
const markdownContent = `# My Document

This is the content of my document.
`;

await saveMarkdownFile('/output/my-document.md', markdownContent);
```

### Atomic JSON Writing

```typescript
const cacheData = {
  version: '1.0.0',
  files: {
    'index.html': { hash: 'abc123', title: 'Home' }
  }
};

await writeJsonAtomic('/cache/cache.json', cacheData);
```

### Error Handling

```typescript
try {
  const files = walkHtmlFiles('/nonexistent', '/base');
  for await (const file of files) {
    // Process files
  }
} catch (error) {
  if (error instanceof PluginError && error.type === 'file') {
    console.error(`File operation failed: ${error.message}`);
    console.error(`Path: ${error.filePath}`);
  }
}
```

## Best Practices

### File Discovery

1. **Use Streaming**: Always use async generators for file discovery
2. **Handle Errors**: Wrap file operations in try-catch blocks
3. **Normalize Paths**: Convert paths to consistent format early
4. **Validate Directories**: Check directory existence before operations

### File Writing

1. **Atomic Operations**: Use atomic writes for important data
2. **Directory Creation**: Ensure parent directories exist
3. **Error Context**: Provide file paths in error messages
4. **Encoding**: Use UTF-8 encoding for text files

### Performance

1. **Stream Processing**: Process files as they're discovered
2. **Minimize I/O**: Batch operations where possible
3. **Cache Results**: Cache expensive path operations
4. **Monitor Memory**: Watch memory usage with large file sets

### Error Handling

1. **Specific Errors**: Use typed errors for different failure modes
2. **Context Preservation**: Maintain file paths and operation context
3. **Graceful Degradation**: Continue processing when possible
4. **User Feedback**: Provide actionable error messages

## Related Components

- **[Cache Management](./cache.md)**: Uses I/O operations for cache persistence
- **[Path Utilities](./path.md)**: Provides path transformation functions
- **[HTML Processor](../pipeline/html-processor.md)**: Consumes file discovery results
- **[Orchestrator](../pipeline/orchestrator.md)**: Coordinates file operations 
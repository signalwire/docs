# Generate Types Documentation

A tool that converts TypeDoc JSON output into formatted markdown documentation for TypeScript types, interfaces, enums, and classes.

## Usage

```bash
# Use local documentation.json file (default)
node index.js

# Download from URL
node index.js "https://example.com/path/to/documentation.json"
```

## Output

Generates `./types.md` with organized documentation including:

- Type aliases with resolved references
- Interface properties and methods
- Enum values
- Class definitions
- Source code links

## Requirements

- Node.js
- TypeDoc JSON output (either local file or accessible URL)

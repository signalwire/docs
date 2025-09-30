# TypeDoc Markdown Generator

A Node.js script that converts TypeDoc JSON files into clean markdown documentation, focusing on types, enums, and type aliases.

## Installation

```bash
npm install
```

## Usage

### Basic Usage

```bash
# Use default documentation.json file in current directory
node index.js

# Or using npm script
npm start
```

### Custom Input File

```bash
# Use a specific JSON file
node index.js ./path/to/your/documentation.json

# Use a URL
node index.js https://example.com/documentation.json
```

### Custom Output File

```bash
# Specify output file
node index.js -o ./custom-types.md

# With custom input and output
node index.js ./custom-input.json -o ./custom-output.md
```

## Features

- **Types**: Extracts and documents TypeScript interfaces with properties, types, and descriptions
- **Enums**: Documents enum values with their descriptions
- **Type Aliases**: Shows type alias definitions
- **Markdown Tables**: Uses proper markdown tables for clean formatting
- **Markdown Escaping**: Properly escapes special characters to prevent rendering issues
- **URL Support**: Can fetch TypeDoc JSON from remote URLs
- **Sorting**: Alphabetically sorts all items for consistent output

## Output Format

The generated markdown includes:

1. **Table of Contents** - Links to each section
2. **Type Aliases** - Table with name, type definition, and description
3. **Enums** - Individual sections for each enum with member tables
4. **Interfaces** - Individual sections for each interface with property tables

## Dependencies

- `typedoc` - For deserializing TypeDoc JSON
- `commander` - Command line interface
- `axios` - HTTP requests for URL support
- `markdown-table` - Clean table generation

## File Structure

```
├── index.js           # Main entry point
├── package.json       # Dependencies and scripts
├── src/
│   ├── loader.js      # Loads and deserializes TypeDoc JSON
│   ├── extractor.js   # Extracts types, enums, and aliases
│   ├── generator.js   # Generates markdown output
│   └── utils.js       # Utility functions for escaping and formatting
└── README.md          # This file
```

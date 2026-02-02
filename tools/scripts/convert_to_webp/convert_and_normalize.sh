#!/bin/bash

set -euo pipefail

print_usage() {
    echo "Usage: $0 <directory>"
    echo ""
    echo "This script will:"
    echo "  1. Normalize .webP extensions to .webp (lowercase)"
    echo "  2. Convert .png files to .webp (keeps originals)"
    echo ""
    echo "Example: $0 ../../images"
    exit 1
}

if [ $# -ne 1 ]; then
    echo "Error: Missing directory argument"
    print_usage
fi

TARGET_DIR="$1"

if [ ! -d "$TARGET_DIR" ]; then
    echo "Error: Directory '$TARGET_DIR' does not exist"
    exit 1
fi

TARGET_DIR_ABS=$(cd "$TARGET_DIR" && pwd)

echo "================================================"
echo "WebP Normalization and PNG Conversion Script"
echo "================================================"
echo ""
echo "Target directory: $TARGET_DIR_ABS"
echo ""

WEBP_MIXED_CASE=$(find "$TARGET_DIR_ABS" -type f -name "*.webP" 2>/dev/null | wc -l | tr -d ' ')
PNG_FILES=$(find "$TARGET_DIR_ABS" -type f -iname "*.png" 2>/dev/null | wc -l | tr -d ' ')

echo "Found:"
echo "  - $WEBP_MIXED_CASE .webP files (mixed case) to normalize"
echo "  - $PNG_FILES .png files to convert"
echo ""

if [ "$WEBP_MIXED_CASE" -eq 0 ] && [ "$PNG_FILES" -eq 0 ]; then
    echo "No files to process. Exiting."
    exit 0
fi

read -p "Proceed with these operations in $TARGET_DIR_ABS? (yes/no): " -r
echo ""

if [[ ! $REPLY =~ ^[Yy][Ee][Ss]$ ]]; then
    echo "Operation cancelled."
    exit 0
fi

if ! command -v cwebp &> /dev/null; then
    echo "Error: 'cwebp' command not found. Please install webp tools."
    echo "  macOS: brew install webp"
    echo "  Ubuntu/Debian: sudo apt-get install webp"
    exit 1
fi

normalize_count=0
convert_count=0
error_count=0

echo "Starting processing..."
echo ""

echo "=== Normalizing .webP to .webp ==="
while IFS= read -r -d '' file; do
    if [ -f "$file" ]; then
        dir=$(dirname "$file")
        filename=$(basename "$file")
        new_filename="${filename%.webP}.webp"
        new_path="$dir/$new_filename"
        
        if [ "$file" != "$new_path" ]; then
            if [ -e "$new_path" ]; then
                echo "⚠️  Skipping: $file (target already exists)"
                ((error_count++))
            else
                echo "✓ Renaming: $file -> $new_filename"
                mv "$file" "$new_path"
                ((normalize_count++))
            fi
        fi
    fi
done < <(find "$TARGET_DIR_ABS" -type f -name "*.webP" -print0)

echo ""
echo "=== Converting .png to .webp ==="
while IFS= read -r -d '' file; do
    if [ -f "$file" ]; then
        output_file="${file%.*}.webp"
        
        if [ -e "$output_file" ]; then
            echo "⚠️  Skipping: $file (webp already exists)"
        else
            echo "✓ Converting: $(basename "$file")"
            if cwebp -q 90 "$file" -o "$output_file" > /dev/null 2>&1; then
                ((convert_count++))
            else
                echo "❌ Error converting: $file"
                ((error_count++))
            fi
        fi
    fi
done < <(find "$TARGET_DIR_ABS" -type f -iname "*.png" -print0)

echo ""
echo "================================================"
echo "Summary:"
echo "  - Normalized: $normalize_count files"
echo "  - Converted: $convert_count files"
echo "  - Errors/Skipped: $error_count files"
echo "================================================"
echo "Done!"

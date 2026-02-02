#!/bin/bash

set -euo pipefail

print_usage() {
    echo "Usage: $0 <directory>"
    echo ""
    echo "This script will:"
    echo "  - Recursively delete all .png files in the specified directory"
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
echo "PNG Deletion Script"
echo "================================================"
echo ""
echo "Target directory: $TARGET_DIR_ABS"
echo ""

PNG_FILES=$(find "$TARGET_DIR_ABS" -type f -iname "*.png" 2>/dev/null | wc -l | tr -d ' ')

echo "Found: $PNG_FILES .png files to delete"
echo ""

if [ "$PNG_FILES" -eq 0 ]; then
    echo "No PNG files to delete. Exiting."
    exit 0
fi

echo "⚠️  WARNING: This will permanently delete $PNG_FILES PNG files!"
echo ""

read -p "Are you absolutely sure you want to delete all PNGs in $TARGET_DIR_ABS? (type 'DELETE' to confirm): " -r
echo ""

if [[ "$REPLY" != "DELETE" ]]; then
    echo "Operation cancelled."
    exit 0
fi

deleted_count=0
error_count=0

echo "Deleting PNG files..."
echo ""

while IFS= read -r -d '' file; do
    if [ -f "$file" ]; then
        echo "✓ Deleting: $(basename "$file")"
        if rm "$file" 2>/dev/null; then
            ((deleted_count++))
        else
            echo "❌ Error deleting: $file"
            ((error_count++))
        fi
    fi
done < <(find "$TARGET_DIR_ABS" -type f -iname "*.png" -print0)

echo ""
echo "================================================"
echo "Summary:"
echo "  - Deleted: $deleted_count files"
echo "  - Errors: $error_count files"
echo "================================================"
echo "Done!"

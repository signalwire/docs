#!/bin/bash

set -euo pipefail

print_usage() {
    echo "Usage: $0 <directory>"
    echo ""
    echo "This script will:"
    echo "  - Normalize .webP extensions to .webp (lowercase)"
    echo "  - Uses two-step rename to ensure git detects changes on macOS"
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

if ! git rev-parse --git-dir > /dev/null 2>&1; then
    echo "Error: Not in a git repository"
    exit 1
fi

echo "================================================"
echo "WebP Case Normalization Script (Git-aware)"
echo "================================================"
echo ""
echo "Target directory: $TARGET_DIR_ABS"
echo ""

WEBP_MIXED_CASE=$(find "$TARGET_DIR_ABS" -type f -name "*.webP" 2>/dev/null | wc -l | tr -d ' ')

echo "Found: $WEBP_MIXED_CASE .webP files (mixed case) to normalize"
echo ""

if [ "$WEBP_MIXED_CASE" -eq 0 ]; then
    echo "No files to process. Exiting."
    exit 0
fi

read -p "Proceed with normalizing extensions in $TARGET_DIR_ABS? (yes/no): " -r
echo ""

if [[ ! $REPLY =~ ^[Yy][Ee][Ss]$ ]]; then
    echo "Operation cancelled."
    exit 0
fi

normalize_count=0
error_count=0

echo "Starting normalization (two-step rename for git)..."
echo ""

while IFS= read -r -d '' file; do
    if [ -f "$file" ]; then
        dir=$(dirname "$file")
        filename=$(basename "$file")
        base_name="${filename%.webP}"
        new_filename="${base_name}.webp"
        temp_filename="${base_name}.tmp_webp_normalize"
        
        temp_path="$dir/$temp_filename"
        new_path="$dir/$new_filename"
        
        echo "✓ Normalizing: $filename -> $new_filename"
        
        if git mv "$file" "$temp_path" 2>/dev/null; then
            if git mv "$temp_path" "$new_path" 2>/dev/null; then
                ((normalize_count++))
            else
                echo "❌ Error: Failed second rename for $filename"
                git mv "$temp_path" "$file" 2>/dev/null || true
                ((error_count++))
            fi
        else
            echo "⚠️  File not tracked by git, using regular mv: $filename"
            if mv "$file" "$temp_path" 2>/dev/null; then
                if mv "$temp_path" "$new_path" 2>/dev/null; then
                    ((normalize_count++))
                else
                    echo "❌ Error: Failed second rename for $filename"
                    mv "$temp_path" "$file" 2>/dev/null || true
                    ((error_count++))
                fi
            else
                echo "❌ Error: Failed to rename $filename"
                ((error_count++))
            fi
        fi
    fi
done < <(find "$TARGET_DIR_ABS" -type f -name "*.webP" -print0)

echo ""
echo "================================================"
echo "Summary:"
echo "  - Normalized: $normalize_count files"
echo "  - Errors/Skipped: $error_count files"
echo "================================================"
echo ""
echo "Note: Changes are staged in git. Review with 'git status'"
echo "Commit when ready with: git commit -m 'Normalize WebP extensions to lowercase'"
echo "Done!"

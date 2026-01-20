#!/bin/bash
# Migrate home/ (platform) from Docusaurus to Fern
# This recursively converts all MDX files, preserving structure
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
CONVERT="$SCRIPT_DIR/convert-docusaurus-to-fern.sh"

SRC=/airlock/docs/website/docs/main/home
DST="$SCRIPT_DIR/../../fern/products/platform/pages"

echo "Migrating platform (home/)..."
echo "Source: $SRC"
echo "Destination: $DST"

# Count source files
total=$(find "$SRC" -name "*.mdx" | wc -l)
echo "Found $total MDX files to migrate"

count=0

# Recursively find and convert all MDX files
find "$SRC" -name "*.mdx" | while read -r src_file; do
    # Get relative path from SRC
    rel_path="${src_file#$SRC/}"

    # Convert directory/index.mdx to directory.mdx for cleaner structure
    # But keep some index.mdx files as-is for sections
    dst_file="$DST/$rel_path"

    # Create destination directory
    mkdir -p "$(dirname "$dst_file")"

    # Convert the file
    $CONVERT "$src_file" "$dst_file"

    count=$((count + 1))
done

echo ""
echo "Done! Converted $(find "$DST" -name "*.mdx" | wc -l) files"

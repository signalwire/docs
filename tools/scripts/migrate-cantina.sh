#!/bin/bash
# Migrate cantina from Docusaurus to Fern
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
CONVERT="$SCRIPT_DIR/convert-docusaurus-to-fern.sh"

SRC=/airlock/docs/website/docs/main/cantina
DST="$SCRIPT_DIR/../../fern/products/cantina/pages"

echo "Migrating cantina..."
mkdir -p "$DST"

$CONVERT "$SRC/user-guide/index.mdx" "$DST/user-guide.mdx"
$CONVERT "$SRC/user-guide-for-admin-rights.mdx" "$DST/admin-guide.mdx"

echo "Done! Converted $(find "$DST" -name "*.mdx" | wc -l) files"

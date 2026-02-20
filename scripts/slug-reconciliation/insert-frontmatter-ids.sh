#!/usr/bin/env bash
# Insert a unique `id: <uuid>` field at the top of every MDX page's frontmatter
# in fern/products/. Skips files that already have an `id:` field or no frontmatter.

set -euo pipefail

PRODUCTS_DIR="$(cd "$(dirname "$0")/../fern/products" && pwd)"
count=0
skipped=0

while IFS= read -r -d '' file; do
  # Check that the file starts with ---
  first_line=$(head -n1 "$file")
  if [[ "$first_line" != "---" ]]; then
    ((skipped++)) || true
    continue
  fi

  # Skip if id: already exists in frontmatter
  # Extract frontmatter (between first --- and next ---)
  if awk 'NR==1 && /^---$/{found=1; next} found && /^---$/{exit} found{print}' "$file" | grep -q '^id:'; then
    ((skipped++)) || true
    continue
  fi

  uuid=$(cat /proc/sys/kernel/random/uuid 2>/dev/null || uuidgen || python3 -c "import uuid; print(uuid.uuid4())")

  # Insert `id: <uuid>` as the second line (right after opening ---)
  sed -i "1 a id: $uuid" "$file"
  ((count++)) || true
done < <(find "$PRODUCTS_DIR" -name '*.mdx' -print0)

echo "Inserted id into $count files, skipped $skipped files."

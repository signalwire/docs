#!/usr/bin/env bash
# Export frontmatter fields (id, title, slug, description) + file path to CSV
# from all MDX pages in fern/products/.

set -euo pipefail

FERN_DIR="$(cd "$(dirname "$0")/../../fern" && pwd)"
REPORTS_DIR="$(cd "$(dirname "$0")" && pwd)/reports"
PRODUCTS_DIR="$FERN_DIR/products"
DOCS_YML="$FERN_DIR/docs.yml"
OUTPUT="${1:-$REPORTS_DIR/frontmatter-export.csv}"

# Build associative array: directory name → product slug from docs.yml
declare -A DIR_TO_SLUG
while IFS= read -r line; do
  # Match "    slug: <value>" lines
  if [[ "$line" =~ ^[[:space:]]+slug:[[:space:]]+(.*) ]]; then
    current_slug="${BASH_REMATCH[1]}"
  fi
  # Match "    path: products/<dir>/" lines — extract the directory name
  if [[ "$line" =~ ^[[:space:]]+path:[[:space:]]+products/([^/]+) ]]; then
    dir="${BASH_REMATCH[1]}"
    # Only set if we haven't seen this dir yet (first slug wins)
    if [[ -n "${current_slug:-}" && -z "${DIR_TO_SLUG[$dir]:-}" ]]; then
      DIR_TO_SLUG["$dir"]="$current_slug"
    fi
  fi
done < "$DOCS_YML"

echo 'id,title,product,slug,description,file_path' > "$OUTPUT"

extract_field() {
  local file="$1" field="$2"
  # Extract frontmatter, then find the field.
  # Handles multi-line values (continued with indentation) by joining them.
  awk -v field="$field" '
    NR==1 && /^---$/ { in_fm=1; next }
    in_fm && /^---$/ { exit }
    in_fm && $0 ~ "^" field ":" {
      val = $0
      sub("^" field ":[ ]*", "", val)
      # Strip surrounding quotes if present
      if (val ~ /^".*"$/) { val = substr(val, 2, length(val)-2) }
      if (val ~ /^'\''.*'\''$/) { val = substr(val, 2, length(val)-2) }
      printf "%s", val
      capture = 1
      next
    }
    in_fm && capture && /^[ ]+/ {
      # Continuation line — append with a space
      val = $0
      sub("^[ ]+", "", val)
      printf " %s", val
      next
    }
    capture { exit }
  ' "$file"
}

csv_escape() {
  local val="$1"
  # If value contains comma, quote, or newline — wrap in quotes and double any quotes
  if [[ "$val" == *","* || "$val" == *'"'* || "$val" == *$'\n'* ]]; then
    val="${val//\"/\"\"}"
    val="\"$val\""
  fi
  printf '%s' "$val"
}

while IFS= read -r -d '' file; do
  first_line=$(head -n1 "$file")
  [[ "$first_line" != "---" ]] && continue

  rel_path="${file#"$PRODUCTS_DIR"/}"

  # Derive product slug from docs.yml mapping
  dir="${file#"$PRODUCTS_DIR"/}"
  dir="${dir%%/*}"
  product="${DIR_TO_SLUG[$dir]:-$dir}"

  id=$(extract_field "$file" "id")
  title=$(extract_field "$file" "title")
  slug=$(extract_field "$file" "slug")
  description=$(extract_field "$file" "description")

  printf '%s,%s,%s,%s,%s,%s\n' \
    "$(csv_escape "$id")" \
    "$(csv_escape "$title")" \
    "$(csv_escape "$product")" \
    "$(csv_escape "$slug")" \
    "$(csv_escape "$description")" \
    "$(csv_escape "$rel_path")" >> "$OUTPUT"

done < <(find "$PRODUCTS_DIR" -name '*.mdx' -print0 | sort -z)

lines=$(($(wc -l < "$OUTPUT") - 1))
echo "Exported $lines pages to $OUTPUT"

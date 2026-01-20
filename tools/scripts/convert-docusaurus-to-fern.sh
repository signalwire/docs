#!/bin/bash
# Convert Docusaurus MDX to Fern MDX
# Usage: ./convert-docusaurus-to-fern.sh <input.mdx> <output.mdx>
#
# Conversions performed:
# - Remove sidebar_position frontmatter
# - @image/ -> images/
# - :::tip -> <Tip> ... </Tip>
# - :::note -> <Note> ... </Note>
# - :::warning -> <Warning> ... </Warning>
# - :::info -> <Info> ... </Info>
# - :::caution -> <Warning> ... </Warning>

set -e

if [ $# -lt 2 ]; then
    echo "Usage: $0 <input.mdx> <output.mdx>"
    exit 1
fi

input="$1"
output="$2"

if [ ! -f "$input" ]; then
    echo "Error: Input file '$input' not found"
    exit 1
fi

# Create output directory if needed
mkdir -p "$(dirname "$output")"

# Process the file
cat "$input" | \
  sed '/^sidebar_position:/d' | \
  sed 's|@image/|/images/|g' | \
  awk '
    BEGIN { in_admon = 0; admon_type = "" }
    /^:::tip/ { in_admon = 1; admon_type = "Tip"; print "<Tip>"; next }
    /^:::note/ { in_admon = 1; admon_type = "Note"; print "<Note>"; next }
    /^:::warning/ { in_admon = 1; admon_type = "Warning"; print "<Warning>"; next }
    /^:::info/ { in_admon = 1; admon_type = "Info"; print "<Info>"; next }
    /^:::caution/ { in_admon = 1; admon_type = "Warning"; print "<Warning>"; next }
    /^:::$/ {
      if (in_admon) {
        print "</" admon_type ">"
        in_admon = 0
        admon_type = ""
      } else {
        print
      }
      next
    }
    { print }
  ' > "$output"

echo "Converted: $input -> $output"

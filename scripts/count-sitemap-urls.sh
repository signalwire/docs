#!/usr/bin/env bash
# Downloads the sitemap and counts the number of <url> entries

SITEMAP_URL="https://signalwire.docs.buildwithfern.com/sitemap.xml"

echo "Downloading sitemap from $SITEMAP_URL ..."
content=$(curl -s "$SITEMAP_URL")

count=$(echo "$content" | grep -c '<url>')

echo "Total URL entries: $count"

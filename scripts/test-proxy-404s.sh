#!/usr/bin/env bash
# Test CloudFront proxy for 404s by comparing against Fern origin
#
# Usage: ./scripts/test-proxy-404s.sh [--all] [--limit N] [--parallel N]
#   --all        Don't stop at first 404, check everything
#   --limit N    Only check first N URLs
#   --parallel N Concurrent requests (default: 20)

set -euo pipefail

SITEMAP_URL="https://signalwire-preview-9652e06b-7f14-4e59-b5d1-990f66a67462.docs.buildwithfern.com/docs/sitemap.xml"
ORIGIN_BASE="https://signalwire-preview-9652e06b-7f14-4e59-b5d1-990f66a67462.docs.buildwithfern.com"
PROXY_BASE="https://signalwire.com"

STOP_ON_FIRST=true
LIMIT=0
PARALLEL=20
REPORT="scripts/proxy-404-report.txt"

while [[ $# -gt 0 ]]; do
  case "$1" in
    --all) STOP_ON_FIRST=false; shift ;;
    --limit) LIMIT="$2"; shift 2 ;;
    --parallel) PARALLEL="$2"; shift 2 ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
done

# Tee all output to report file and terminal
exec > >(tee "$REPORT") 2>&1

echo "=== Proxy 404 Report — $(date -u '+%Y-%m-%d %H:%M:%S UTC') ==="
echo
echo "=== Fetching sitemap ==="
URLS=$(curl -s "$SITEMAP_URL" | grep -oP '(?<=<loc>)[^<]+')
TOTAL=$(echo "$URLS" | wc -l)
echo "Found $TOTAL URLs in sitemap"

if [[ $LIMIT -gt 0 ]]; then
  URLS=$(echo "$URLS" | head -n "$LIMIT")
  TOTAL=$LIMIT
  echo "(Limited to $LIMIT)"
fi

# Build proxy URLs
PROXY_URLS=$(echo "$URLS" | sed "s|${ORIGIN_BASE}|${PROXY_BASE}|")

TMPDIR=$(mktemp -d)
trap 'rm -rf "$TMPDIR"' EXIT

echo "=== Checking $TOTAL URLs ($PARALLEL concurrent) ==="
echo

# Use xargs + curl to blast through URLs in parallel
# Output: status_code url (one per line)
echo "$PROXY_URLS" | xargs -P "$PARALLEL" -I{} \
  curl -s -o /dev/null -w "%{http_code} %{url_effective}\n" --max-time 10 "{}" \
  > "$TMPDIR/results.txt" 2>/dev/null

PASS=$(grep -c "^200 " "$TMPDIR/results.txt" || true)
FAIL_LINES=$(grep -v "^200 " "$TMPDIR/results.txt" || true)
FAIL=$(echo "$FAIL_LINES" | grep -c . || true)

echo "Checked: $TOTAL  |  Pass: $PASS  |  Fail: $FAIL"
echo

if [[ $FAIL -eq 0 ]]; then
  echo "All URLs passed!"
  exit 0
fi

echo "=== Failures — checking origin ==="
echo

# For each failure, check origin in parallel too
ORIGIN_CHECK_URLS=""
while IFS=' ' read -r status proxy_url; do
  [[ -z "$status" ]] && continue
  path="${proxy_url#"$PROXY_BASE"}"
  origin_url="${ORIGIN_BASE}${path}"
  ORIGIN_CHECK_URLS+="${origin_url}"$'\n'
done <<< "$FAIL_LINES"

echo "$ORIGIN_CHECK_URLS" | grep -v '^$' | xargs -P "$PARALLEL" -I{} \
  curl -s -o /dev/null -w "%{http_code} %{url_effective}\n" --max-time 10 "{}" \
  > "$TMPDIR/origin_results.txt" 2>/dev/null

# Build lookup of origin statuses
declare -A ORIGIN_STATUS
while IFS=' ' read -r status url; do
  [[ -z "$status" ]] && continue
  path="${url#"$ORIGIN_BASE"}"
  ORIGIN_STATUS["$path"]="$status"
done < "$TMPDIR/origin_results.txt"

# Print results table
printf "%-6s %-6s %s\n" "PROXY" "ORIGIN" "PATH"
printf "%-6s %-6s %s\n" "-----" "------" "----"
while IFS=' ' read -r status proxy_url; do
  [[ -z "$status" ]] && continue
  path="${proxy_url#"$PROXY_BASE"}"
  origin="${ORIGIN_STATUS[$path]:-???}"
  printf "%-6s %-6s %s\n" "$status" "$origin" "$path"
done <<< "$FAIL_LINES"

echo
echo "PROXY≠200 + ORIGIN=200  →  reverse proxy issue"
echo "Both≠200                →  missing from origin"

# If stop-on-first, dump headers for the first failure
if $STOP_ON_FIRST; then
  first_fail_url=$(echo "$FAIL_LINES" | head -1 | cut -d' ' -f2)
  path="${first_fail_url#"$PROXY_BASE"}"
  origin_url="${ORIGIN_BASE}${path}"
  echo
  echo "=== Headers for first failure: $path ==="
  echo "--- Proxy ---"
  curl -sI --max-time 10 "$first_fail_url" 2>/dev/null
  echo "--- Origin ---"
  curl -sI --max-time 10 "$origin_url" 2>/dev/null
fi

echo
echo "Report saved to: $REPORT"

#!/bin/bash
# Migrate call-flow-builder from Docusaurus to Fern
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
CONVERT="$SCRIPT_DIR/convert-docusaurus-to-fern.sh"

SRC=/airlock/docs/website/docs/main/call-flow-builder
DST="$SCRIPT_DIR/../../fern/products/call-flow-builder/pages"

echo "Migrating call-flow-builder..."
echo "Source: $SRC"
echo "Destination: $DST"

# Create directories
mkdir -p "$DST/nodes"

# Main files
$CONVERT "$SRC/index.mdx" "$DST/index.mdx"
$CONVERT "$SRC/variables/index.mdx" "$DST/variables.mdx"
$CONVERT "$SRC/version/index.mdx" "$DST/version.mdx"

# Nodes
$CONVERT "$SRC/nodes/index.mdx" "$DST/nodes/index.mdx"

for node in ai_agent answer_call conditions execute_swml forward_to_phone \
            gather_input handle_call hangup_call play_audio_or_tts request \
            send_sms set_variables start_call_recording stop_call_recording \
            unset_variables voicemail_recording; do
    if [ -f "$SRC/nodes/$node/index.mdx" ]; then
        $CONVERT "$SRC/nodes/$node/index.mdx" "$DST/nodes/$node.mdx"
    else
        echo "Warning: $SRC/nodes/$node/index.mdx not found"
    fi
done

echo "Done! Converted $(find "$DST" -name "*.mdx" | wc -l) files"

#!/bin/bash
# Migrate events/demos from Docusaurus to Fern
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
CONVERT="$SCRIPT_DIR/convert-docusaurus-to-fern.sh"

SRC=/airlock/docs/website/docs/main/events
DST="$SCRIPT_DIR/../../fern/products/demos/pages"

echo "Migrating demos..."
mkdir -p "$DST/serverless" "$DST/server" "$DST/livewire/swaig-zendesk" "$DST/hackathons"

# Serverless demos
$CONVERT "$SRC/demos/serverless/weather-bot-demo/index.mdx" "$DST/serverless/weather-bot.mdx"
$CONVERT "$SRC/demos/serverless/virtual-flowers-demo/index.mdx" "$DST/serverless/virtual-flowers.mdx"
$CONVERT "$SRC/demos/serverless/admin-assistant/index.mdx" "$DST/serverless/admin-assistant.mdx"

# Server demos
$CONVERT "$SRC/demos/server/esp8266-sensor-bot/index.mdx" "$DST/server/esp8266-sensor-bot.mdx"
$CONVERT "$SRC/demos/server/mfa/index.mdx" "$DST/server/mfa.mdx"
$CONVERT "$SRC/demos/server/flos-flowers-2/index.mdx" "$DST/server/flos-flowers.mdx"
$CONVERT "$SRC/demos/server/ai-cal/index.mdx" "$DST/server/ai-calendar.mdx"
$CONVERT "$SRC/demos/server/room-service/index.mdx" "$DST/server/room-service.mdx"
$CONVERT "$SRC/demos/server/room-service/menu.mdx" "$DST/server/room-service-menu.mdx"
$CONVERT "$SRC/demos/server/restaurant-reservation/index.mdx" "$DST/server/restaurant-reservation.mdx"
$CONVERT "$SRC/demos/server/tier-1-support/index.mdx" "$DST/server/tier-1-support.mdx"

# LiveWire
$CONVERT "$SRC/livewire/swaig-plus-zendesk/index.mdx" "$DST/livewire/swaig-zendesk.mdx"
$CONVERT "$SRC/livewire/swaig-plus-zendesk/functions/_create_ticket.mdx" "$DST/livewire/swaig-zendesk/create-ticket.mdx"
$CONVERT "$SRC/livewire/smart-biz-ai/index.mdx" "$DST/livewire/smart-biz-ai.mdx"

# Hackathons
$CONVERT "$SRC/hackathons/cluecon-2024/index.mdx" "$DST/hackathons/cluecon-2024.mdx"

echo "Done! Converted $(find "$DST" -name "*.mdx" | wc -l) files"

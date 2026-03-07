#!/usr/bin/env node

/**
 * Apply mdx-path link fixes — replace relative .mdx file paths with proper Fern slugs.
 */

import { readFileSync, writeFileSync } from "node:fs";
import { resolve, dirname } from "node:path";
import { fileURLToPath } from "node:url";

const __dirname = dirname(fileURLToPath(import.meta.url));
const ROOT = resolve(__dirname, "..");
const FERN = resolve(ROOT, "fern");

// All 61 replacements: [sourceFile, oldLink, newLink]
const replacements = [
  // === Resolved from Fern file structure (41) ===
  // compatibility-api
  ["products/compatibility-api/pages/cxml/voice/sip-noun.mdx", "./dial.mdx#verb-attributes", "/compatibility-api/cxml/reference/voice/dial#verb-attributes"],
  // platform
  ["products/platform/pages/calling/voice/SIP/sip-trunking/index.mdx", "../sip-domain-apps/index.mdx", "/platform/voice/sip/domain-applications"],
  ["products/platform/pages/messaging/sms/the-campaign-registry/csps/index.mdx", "../registration/index.mdx", "/platform/messaging/campaign-registry/registration"],
  // realtime-sdk (latest)
  ["products/realtime-sdk/pages/latest/tech-ref/chat/overview.mdx", "./chat-chatmember.mdx", "/realtime-sdk/node/reference/chat/chat-member"],
  ["products/realtime-sdk/pages/latest/tech-ref/chat/overview.mdx", "./chat-chatmessage.mdx", "/realtime-sdk/node/reference/chat/chat-message"],
  ["products/realtime-sdk/pages/latest/tech-ref/core/realtime-client/index.mdx", "../../voice/client/index.mdx", "/realtime-sdk/node/reference/voice/client"],
  ["products/realtime-sdk/pages/latest/tech-ref/core/realtime-client/index.mdx", "../../video/client/index.mdx", "/realtime-sdk/node/reference/video/client"],
  ["products/realtime-sdk/pages/latest/tech-ref/core/realtime-client/index.mdx", "../../chat/client/index.mdx", "/realtime-sdk/node/reference/chat/client"],
  ["products/realtime-sdk/pages/latest/tech-ref/core/realtime-client/index.mdx", "../../task/client/index.mdx", "/realtime-sdk/node/reference/task/client"],
  ["products/realtime-sdk/pages/latest/tech-ref/core/realtime-client/index.mdx", "../../pubsub/client/index.mdx", "/realtime-sdk/node/reference/pubsub/client"],
  ["products/realtime-sdk/pages/latest/tech-ref/pubsub/overview.mdx", "./pubsub-pubsubmessage.mdx", "/realtime-sdk/node/reference/pubsub/pubsub-message"],
  ["products/realtime-sdk/pages/latest/tech-ref/video/overview.mdx", "./client/index.mdx", "/realtime-sdk/node/reference/video/client"],
  ["products/realtime-sdk/pages/latest/tech-ref/video/overview.mdx", "./video-roomsessionfullstate.mdx", "/realtime-sdk/node/reference/video/room-session-full-state"],
  ["products/realtime-sdk/pages/latest/tech-ref/video/overview.mdx", "./video-roomsessionmember.mdx", "/realtime-sdk/node/reference/video/room-session-member"],
  ["products/realtime-sdk/pages/latest/tech-ref/video/overview.mdx", "./video-roomsessionplayback.mdx", "/realtime-sdk/node/reference/video/room-session-playback"],
  ["products/realtime-sdk/pages/latest/tech-ref/video/overview.mdx", "./video-roomsessionrecording.mdx", "/realtime-sdk/node/reference/video/room-session-recording"],
  ["products/realtime-sdk/pages/latest/tech-ref/video/overview.mdx", "./video-roomsessionstream.mdx", "/realtime-sdk/node/reference/video/room-session-stream"],
  ["products/realtime-sdk/pages/latest/tech-ref/voice/overview.mdx", "./callcollect.mdx", "/realtime-sdk/node/reference/voice/call-collect"],
  ["products/realtime-sdk/pages/latest/tech-ref/voice/overview.mdx", "./calldetect.mdx", "/realtime-sdk/node/reference/voice/call-detect"],
  ["products/realtime-sdk/pages/latest/tech-ref/voice/overview.mdx", "./callplayback.mdx", "/realtime-sdk/node/reference/voice/call-playback"],
  ["products/realtime-sdk/pages/latest/tech-ref/voice/overview.mdx", "./callprompt.mdx", "/realtime-sdk/node/reference/voice/call-prompt"],
  ["products/realtime-sdk/pages/latest/tech-ref/voice/overview.mdx", "./callrecording.mdx", "/realtime-sdk/node/reference/voice/call-recording"],
  ["products/realtime-sdk/pages/latest/tech-ref/voice/overview.mdx", "./callstate.mdx", "/realtime-sdk/node/reference/voice/call-state"],
  ["products/realtime-sdk/pages/latest/tech-ref/voice/overview.mdx", "./calltap.mdx", "/realtime-sdk/node/reference/voice/call-tap"],
  ["products/realtime-sdk/pages/latest/tech-ref/voice/overview.mdx", "./voice-devicebuilder.mdx", "/realtime-sdk/node/reference/voice/device-builder"],
  ["products/realtime-sdk/pages/latest/tech-ref/voice/overview.mdx", "./voice-playlist.mdx", "/realtime-sdk/node/reference/voice/playlist"],
  // realtime-sdk v3
  ["products/realtime-sdk/pages/v3/tech-ref/messaging/client/methods/listen.mdx", "../index.mdx", "/realtime-sdk/node/reference/messaging/client"],
  // swml bedrock
  ["products/swml/pages/reference/methods/bedrock/swaig/functions/index.mdx", "./ai_swaig.data_map/index.mdx", "/swml/reference/amazon-bedrock/swaig/functions/data-map"],
  ["products/swml/pages/reference/methods/bedrock/swaig/functions/index.mdx", "./parameters/index.mdx", "/swml/reference/amazon-bedrock/swaig/functions/parameters"],
  ["products/swml/pages/reference/methods/bedrock/swaig/index.mdx", "./functions/index.mdx", "/swml/reference/amazon-bedrock/swaig/functions"],
  ["products/swml/pages/reference/methods/bedrock/swaig/index.mdx", "./includes/index.mdx", "/swml/reference/amazon-bedrock/swaig/includes"],
  // swml methods
  ["products/swml/pages/reference/methods/denoise.mdx", "./stop_denoise.mdx", "/swml/reference/stop-denoise"],
  ["products/swml/pages/reference/methods/execute.mdx", "./return.mdx", "/swml/reference/return"],
  ["products/swml/pages/reference/methods/label.mdx", "./goto.mdx", "/swml/reference/goto"],
  ["products/swml/pages/reference/methods/receive_fax.mdx", "./execute.mdx", "/swml/reference/execute"],
  ["products/swml/pages/reference/methods/record.mdx", "./record_call.mdx", "/swml/reference/record-call"],
  ["products/swml/pages/reference/methods/record_call.mdx", "./record.mdx", "/swml/reference/record"],
  ["products/swml/pages/reference/methods/record_call.mdx", "./stop_record_call.mdx", "/swml/reference/stop-record-call"],
  ["products/swml/pages/reference/methods/set.mdx", "./unset.mdx", "/swml/reference/unset"],
  ["products/swml/pages/reference/methods/stop_denoise.mdx", "./denoise.mdx", "/swml/reference/denoise"],
  ["products/swml/pages/reference/methods/unset.mdx", "./set.mdx", "/swml/reference/set"],

  // === Manually resolved (20) ===
  // browser-sdk (files renamed to directories)
  ["products/browser-sdk/pages/latest/reference/video/overview.mdx", "./video-roomsessiondevice.mdx", "/browser-sdk/js/reference/video/room-session-device"],
  ["products/browser-sdk/pages/latest/reference/video/overview.mdx", "./video-roomsessionscreenshare.mdx", "/browser-sdk/js/reference/video/room-session-screen-share"],
  // call-flow-builder (relative paths were wrong — all nodes are siblings)
  ["products/call-flow-builder/pages/core/overview.mdx", "./nodes/handle_call/index.mdx", "/call-flow-builder/reference/handle-call"],
  ["products/call-flow-builder/pages/core/overview.mdx", "./nodes/play_audio_or_tts/index.mdx", "/call-flow-builder/reference/play-audio-or-tts"],
  ["products/call-flow-builder/pages/nodes/gather_input.mdx", "../set_variables/index.mdx", "/call-flow-builder/reference/set-variables"],
  ["products/call-flow-builder/pages/nodes/gather_input.mdx", "../conditions/index.mdx", "/call-flow-builder/reference/conditions"],
  ["products/call-flow-builder/pages/nodes/set_variables.mdx", "../unset_variables/index.mdx", "/call-flow-builder/reference/unset-variables"],
  ["products/call-flow-builder/pages/nodes/set_variables.mdx", "../request/index.mdx", "/call-flow-builder/reference/request"],
  ["products/call-flow-builder/pages/nodes/start_call_recording.mdx", "../stop_call_recording/index.mdx", "/call-flow-builder/reference/stop-call-recording"],
  ["products/call-flow-builder/pages/nodes/stop_call_recording.mdx", "../start_call_recording/index.mdx", "/call-flow-builder/reference/start-call-recording"],
  // compatibility-api fax (index.mdx renamed to overview.mdx)
  ["products/compatibility-api/pages/cxml/fax/receive.mdx", "./index.mdx#request-parameters", "/compatibility-api/cxml/reference/fax#request-parameters"],
  // platform (file moved/renamed)
  ["products/platform/pages/messaging/sms/the-campaign-registry/csps/index.mdx", "../../getting-started/sms-best-practices-how-to-ensure-message-delivery.mdx#explicitly-prohibited-content", "/platform/messaging/sms-best-practices#explicitly-prohibited-content"],
  // realtime-sdk (files renamed to directories)
  ["products/realtime-sdk/pages/latest/tech-ref/chat/overview.mdx", "./chat-client.mdx", "/realtime-sdk/node/reference/chat/client"],
  ["products/realtime-sdk/pages/latest/tech-ref/pubsub/overview.mdx", "./pubsub-client.mdx", "/realtime-sdk/node/reference/pubsub/client"],
  ["products/realtime-sdk/pages/latest/tech-ref/task/overview.mdx", "./task-client.mdx", "/realtime-sdk/node/reference/task/client"],
  ["products/realtime-sdk/pages/latest/tech-ref/video/overview.mdx", "./video-roomsession.mdx", "/realtime-sdk/node/reference/video/room-session"],
  ["products/realtime-sdk/pages/latest/tech-ref/voice/overview.mdx", "./voice-call.mdx", "/realtime-sdk/node/reference/voice/call"],
  ["products/realtime-sdk/pages/latest/tech-ref/voice/overview.mdx", "./voice-client.mdx", "/realtime-sdk/node/reference/voice/client"],
  // swml ai swaig data_map.output.mdx merged into index.mdx
  ["products/swml/pages/reference/methods/ai/ai_swaig/functions/index.mdx", "./ai_swaig.data_map/data_map.output.mdx#actions", "/swml/reference/ai/swaig/functions/data-map#actions"],
  // swml cond.mdx ./index.mdx -> methods overview
  ["products/swml/pages/reference/methods/cond.mdx", "./index.mdx", "/swml/reference"],
];

let totalApplied = 0;
let totalFailed = 0;

// Group by file
const byFile = new Map();
for (const [file, oldLink, newLink] of replacements) {
  if (!byFile.has(file)) byFile.set(file, []);
  byFile.get(file).push([oldLink, newLink]);
}

for (const [relFile, fixes] of byFile) {
  const absPath = resolve(FERN, relFile);
  let source = readFileSync(absPath, "utf8");

  for (const [oldLink, newLink] of fixes) {
    // Handle both markdown links and JSX hrefs
    // Escape special regex chars in the old link
    const escaped = oldLink.replace(/[.*+?^${}()|[\]\\]/g, "\\$&");

    // Match in markdown link context: ](oldLink)
    const mdPattern = new RegExp(`\\]\\(${escaped}\\)`, "g");
    // Match in href="oldLink" or href='oldLink'
    const hrefPattern = new RegExp(`href=["']${escaped}["']`, "g");

    let replaced = false;

    if (mdPattern.test(source)) {
      source = source.replace(mdPattern, `](${newLink})`);
      replaced = true;
    }

    // Reset lastIndex
    hrefPattern.lastIndex = 0;
    if (hrefPattern.test(source)) {
      // Need to re-read since source may have changed
      source = source.replace(new RegExp(`href=["']${escaped}["']`, "g"), `href="${newLink}"`);
      replaced = true;
    }

    if (replaced) {
      totalApplied++;
      console.log(`  ${relFile}: ${oldLink} -> ${newLink}`);
    } else {
      totalFailed++;
      console.error(`  MISSED: ${relFile}: ${oldLink}`);
    }
  }

  writeFileSync(absPath, source, "utf8");
}

console.log(`\nApplied: ${totalApplied}, Failed: ${totalFailed}`);

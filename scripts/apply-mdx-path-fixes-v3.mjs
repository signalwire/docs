#!/usr/bin/env node

import { readFileSync, writeFileSync } from "node:fs";
import { resolve, dirname } from "node:path";
import { fileURLToPath } from "node:url";

const __dirname = dirname(fileURLToPath(import.meta.url));
const ROOT = resolve(__dirname, "..");
const FERN = resolve(ROOT, "fern");

// v3 uses same slug structure but under v3 version — the slugs don't include version prefix
// since the product handles versioning. Use same slugs as latest.
const replacements = [
  // chat
  ["products/realtime-sdk/pages/v3/tech-ref/chat/overview.mdx", "./chat-client.mdx", "/realtime-sdk/node/reference/chat/client"],
  ["products/realtime-sdk/pages/v3/tech-ref/chat/overview.mdx", "./chat-chatmember.mdx", "/realtime-sdk/node/reference/chat/chat-member"],
  ["products/realtime-sdk/pages/v3/tech-ref/chat/overview.mdx", "./chat-chatmessage.mdx", "/realtime-sdk/node/reference/chat/chat-message"],
  // pubsub
  ["products/realtime-sdk/pages/v3/tech-ref/pubsub/overview.mdx", "./pubsub-client.mdx", "/realtime-sdk/node/reference/pubsub/client"],
  ["products/realtime-sdk/pages/v3/tech-ref/pubsub/overview.mdx", "./pubsub-pubsubmessage.mdx", "/realtime-sdk/node/reference/pubsub/pubsub-message"],
  // task
  ["products/realtime-sdk/pages/v3/tech-ref/task/overview.mdx", "./task-client.mdx", "/realtime-sdk/node/reference/task/client"],
  // voice
  ["products/realtime-sdk/pages/v3/tech-ref/voice/overview.mdx", "./voice-call.mdx", "/realtime-sdk/node/reference/voice/call"],
  ["products/realtime-sdk/pages/v3/tech-ref/voice/overview.mdx", "./callcollect.mdx", "/realtime-sdk/node/reference/voice/call-collect"],
  ["products/realtime-sdk/pages/v3/tech-ref/voice/overview.mdx", "./calldetect.mdx", "/realtime-sdk/node/reference/voice/call-detect"],
  ["products/realtime-sdk/pages/v3/tech-ref/voice/overview.mdx", "./callplayback.mdx", "/realtime-sdk/node/reference/voice/call-playback"],
  ["products/realtime-sdk/pages/v3/tech-ref/voice/overview.mdx", "./callprompt.mdx", "/realtime-sdk/node/reference/voice/call-prompt"],
  ["products/realtime-sdk/pages/v3/tech-ref/voice/overview.mdx", "./callrecording.mdx", "/realtime-sdk/node/reference/voice/call-recording"],
  ["products/realtime-sdk/pages/v3/tech-ref/voice/overview.mdx", "./callstate.mdx", "/realtime-sdk/node/reference/voice/call-state"],
  ["products/realtime-sdk/pages/v3/tech-ref/voice/overview.mdx", "./calltap.mdx", "/realtime-sdk/node/reference/voice/call-tap"],
  ["products/realtime-sdk/pages/v3/tech-ref/voice/overview.mdx", "./voice-client.mdx", "/realtime-sdk/node/reference/voice/client"],
  ["products/realtime-sdk/pages/v3/tech-ref/voice/overview.mdx", "./voice-devicebuilder.mdx", "/realtime-sdk/node/reference/voice/device-builder"],
  ["products/realtime-sdk/pages/v3/tech-ref/voice/overview.mdx", "./voice-playlist.mdx", "/realtime-sdk/node/reference/voice/playlist"],
  // video
  ["products/realtime-sdk/pages/v3/tech-ref/video/overview.mdx", "./client/index.mdx", "/realtime-sdk/node/reference/video/client"],
  ["products/realtime-sdk/pages/v3/tech-ref/video/overview.mdx", "./video-roomsession.mdx", "/realtime-sdk/node/reference/video-room-session"],
  ["products/realtime-sdk/pages/v3/tech-ref/video/overview.mdx", "./video-roomsessionfullstate.mdx", "/realtime-sdk/node/reference/video/room-session-full-state"],
  ["products/realtime-sdk/pages/v3/tech-ref/video/overview.mdx", "./video-roomsessionmember.mdx", "/realtime-sdk/node/reference/video/room-session-member"],
  ["products/realtime-sdk/pages/v3/tech-ref/video/overview.mdx", "./video-roomsessionplayback.mdx", "/realtime-sdk/node/reference/video/room-session-playback"],
  ["products/realtime-sdk/pages/v3/tech-ref/video/overview.mdx", "./video-roomsessionrecording.mdx", "/realtime-sdk/node/reference/video/room-session-recording"],
  ["products/realtime-sdk/pages/v3/tech-ref/video/overview.mdx", "./video-roomsessionstream.mdx", "/realtime-sdk/node/reference/video/room-session-stream"],
];

let totalApplied = 0;
let totalFailed = 0;

const byFile = new Map();
for (const [file, oldLink, newLink] of replacements) {
  if (!byFile.has(file)) byFile.set(file, []);
  byFile.get(file).push([oldLink, newLink]);
}

for (const [relFile, fixes] of byFile) {
  const absPath = resolve(FERN, relFile);
  let source = readFileSync(absPath, "utf8");

  for (const [oldLink, newLink] of fixes) {
    const escaped = oldLink.replace(/[.*+?^${}()|[\]\\]/g, "\\$&");
    const mdPattern = new RegExp(`\\]\\(${escaped}\\)`, "g");
    const hrefPattern = new RegExp(`href=["']${escaped}["']`, "g");

    let replaced = false;
    if (mdPattern.test(source)) {
      source = source.replace(new RegExp(`\\]\\(${escaped}\\)`, "g"), `](${newLink})`);
      replaced = true;
    }
    if (hrefPattern.test(source)) {
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

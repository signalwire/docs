#!/usr/bin/env node

import { readFileSync, writeFileSync } from "node:fs";
import { resolve, dirname } from "node:path";
import { fileURLToPath } from "node:url";

const __dirname = dirname(fileURLToPath(import.meta.url));
const ROOT = resolve(__dirname, "..");
const FERN = resolve(ROOT, "fern");

const replacements = [
  // compat-api voice: ./index.mdx#request-parameters -> voice overview
  ["products/compatibility-api/pages/cxml/voice/conference-noun.mdx", "./index.mdx#request-parameters", "/compatibility-api/cxml/reference/voice#request-parameters"],
  ["products/compatibility-api/pages/cxml/voice/refer.mdx", "./index.mdx#request-parameters", "/compatibility-api/cxml/reference/voice#request-parameters"],
  ["products/compatibility-api/pages/cxml/voice/record.mdx", "./index.mdx#request-parameters", "/compatibility-api/cxml/reference/voice#request-parameters"],
  ["products/compatibility-api/pages/cxml/voice/queue-noun.mdx", "./index.mdx#request-parameters", "/compatibility-api/cxml/reference/voice#request-parameters"],
  ["products/compatibility-api/pages/cxml/voice/enqueue.mdx", "./index.mdx#request-parameters", "/compatibility-api/cxml/reference/voice#request-parameters"],
  ["products/compatibility-api/pages/cxml/voice/gather.mdx", "./index.mdx#request-parameters", "/compatibility-api/cxml/reference/voice#request-parameters"],
  ["products/compatibility-api/pages/cxml/voice/sip-noun.mdx", "./index.mdx#request-parameters", "/compatibility-api/cxml/reference/voice#request-parameters"],
  ["products/compatibility-api/pages/cxml/voice/dial.mdx", "./index.mdx#request-parameters", "/compatibility-api/cxml/reference/voice#request-parameters"],
  ["products/compatibility-api/pages/cxml/voice/sms.mdx", "./index.mdx#request-parameters", "/compatibility-api/cxml/reference/voice#request-parameters"],
  ["products/compatibility-api/pages/cxml/voice/virtualagent-noun.mdx", "./index.mdx#request-parameters", "/compatibility-api/cxml/reference/voice#request-parameters"],
  ["products/compatibility-api/pages/cxml/voice/verto-noun.mdx", "./index.mdx#request-parameters", "/compatibility-api/cxml/reference/voice#request-parameters"],
  // compat-api messaging: ./index.mdx#request-parameters
  ["products/compatibility-api/pages/cxml/messaging/message.mdx", "./index.mdx#request-parameters", "/compatibility-api/cxml/reference/messaging#request-parameters"],
  // swml switch: ./index.mdx -> methods overview
  ["products/swml/pages/reference/methods/switch.mdx", "./index.mdx", "/swml/reference"],
  // swml return: ./execute.mdx
  ["products/swml/pages/reference/methods/return.mdx", "./execute.mdx", "/swml/reference/execute"],
  // swml bedrock: ./ai_swaig.data_map/data_map.output.mdx#actions
  ["products/swml/pages/reference/methods/bedrock/swaig/functions/index.mdx", "./ai_swaig.data_map/data_map.output.mdx#actions", "/swml/reference/amazon-bedrock/swaig/functions/data-map#actions"],
  // call-flow-builder: remaining relative links
  ["products/call-flow-builder/pages/nodes/stop_call_recording.mdx", "../request/index.mdx", "/call-flow-builder/reference/request"],
  ["products/call-flow-builder/pages/nodes/stop_call_recording.mdx", "../set_variables/index.mdx", "/call-flow-builder/reference/set-variables"],
  ["products/call-flow-builder/pages/nodes/unset_variables.mdx", "../set_variables/index.mdx", "/call-flow-builder/reference/set-variables"],
  ["products/call-flow-builder/pages/nodes/request.mdx", "../set_variables/index.mdx", "/call-flow-builder/reference/set-variables"],
  ["products/call-flow-builder/pages/nodes/voicemail_recording.mdx", "../request/index.mdx", "/call-flow-builder/reference/request"],
  ["products/call-flow-builder/pages/nodes/voicemail_recording.mdx", "../set_variables/index.mdx", "/call-flow-builder/reference/set-variables"],
  // realtime-sdk: getmembers -> roomsessionmember (wrong relative path from methods/ subdir)
  ["products/realtime-sdk/pages/latest/tech-ref/video/roomsession/methods/getmembers.mdx", "./video-roomsessionmember.mdx", "/realtime-sdk/node/reference/video/room-session-member"],
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

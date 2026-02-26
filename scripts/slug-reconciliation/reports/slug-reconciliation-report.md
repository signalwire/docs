# Slug Reconciliation Report

## Summary

| Metric | Count |
|--------|-------|
| Old sitemap URLs | 1489 |
| Current Fern pages (CSV) | 1153 |
| **Matched** | **491** |
| **Unmatched** | **998** |
| Match rate | 33.0% |

## Unmatched by section

| Prefix | Count |
|--------|-------|
| `/rest` | 418 |
| `/compatibility-api` | 195 |
| `/sdks` | 132 |
| `/platform` | 80 |
| `/swml` | 53 |
| `/call-flow-builder` | 19 |
| `/messaging` | 15 |
| `/page` | 14 |
| `/video` | 14 |
| `/demos` | 10 |
| `/internal` | 9 |
| `/voice` | 9 |
| `/fax` | 8 |
| `/chat` | 7 |
| `/ai` | 4 |
| `/home` | 4 |
| `/cantina` | 2 |
| `/livewire` | 2 |
| `/cluecon-2024` | 1 |
| `/events` | 1 |
| `/sms` | 1 |

## Matched samples

- `/ai` -> [platform] `/ai`
- `/ai/get-started` -> [platform] `/ai/get-started`
- `/ai/get-started/platform-capabilities` -> [platform] `/ai/get-started/platform-capabilities` -> `/ai/platform-capabilities`
- `/ai/get-started/prompt-engineering` -> [platform] `/ai/get-started/prompt-engineering` -> `/ai/prompt-engineering`
- `/ai/get-started/prompt-engineering/best-practices` -> [platform] `/ai/get-started/prompt-engineering/best-practices` -> `/ai/prompt-engineering-best-practices`
- `/ai/get-started/prompt-engineering/where-to-apply` -> [platform] `/ai/get-started/prompt-engineering/where-to-apply` -> `/ai/where-to-apply`
- `/ai/guides/best-practices` -> [platform] `/ai/guides/best-practices` -> `/ai/guides-best-practices`
- `/ai/guides/integrations/livekit/inbound` -> [platform] `/ai/guides/integrations/livekit/inbound` -> `/ai/inbound`
- `/ai/guides/integrations/livekit/outbound` -> [platform] `/ai/guides/integrations/livekit/outbound` -> `/ai/outbound`
- `/ai/guides/integrations/vapi/inbound-calls` -> [platform] `/ai/guides/integrations/vapi/inbound-calls` -> `/ai/inbound-calls`
- `/ai/guides/integrations/vapi/outbound-calls` -> [platform] `/ai/guides/integrations/vapi/outbound-calls` -> `/ai/outbound-calls`
- `/ai/pom` -> [platform] `/ai/pom`
- `/ai/pom/technical-reference` -> [platform] `/ai/pom/technical-reference` -> `/ai/technical-reference`
- `/call-flow-builder` -> [call-flow-builder] `/`
- `/chat` -> [platform] `/chat`
- `/compatibility-api` -> [compatibility-api] `/`
- `/fax` -> [platform] `/fax`
- `/guides` -> [browser-sdk] `/guides`
- `/messaging` -> [platform] `/messaging`
- `/messaging/get-started/campaign-registry` -> [platform] `/messaging/get-started/campaign-registry` -> `/messaging/campaign-registry`
- ... and 471 more

## Unmatched samples

- `/ai/guides`
- `/ai/guides/integrations`
- `/ai/guides/integrations/livekit`
- `/ai/guides/integrations/vapi`
- `/call-flow-builder/ai-agent`
- `/call-flow-builder/answer-call`
- `/call-flow-builder/conditions`
- `/call-flow-builder/execute-swml`
- `/call-flow-builder/forward-to-phone`
- `/call-flow-builder/gather-input`
- `/call-flow-builder/handle-call`
- `/call-flow-builder/hangup-call`
- `/call-flow-builder/nodes`
- `/call-flow-builder/play-audio-or-tts`
- `/call-flow-builder/request`
- `/call-flow-builder/send-sms`
- `/call-flow-builder/set-variables`
- `/call-flow-builder/start-call-recording`
- `/call-flow-builder/stop-call-recording`
- `/call-flow-builder/unset-variables`
- `/call-flow-builder/variables`
- `/call-flow-builder/version`
- `/call-flow-builder/voicemail-recording`
- `/cantina/user-guide`
- `/cantina/user-guide-for-admin-rights`
- `/chat/faq`
- `/chat/getting-started`
- `/chat/getting-started/chat-first-steps`
- `/chat/getting-started/get-started-with-a-simple-chat-demo`
- `/chat/guides`
- ... and 968 more

## Output files

- `C:\Users\devon\projects\signalwire-fern-config\scripts\slug-reconciliation\reports\slug-reconciliation.csv` -- full reconciliation (1489 rows)
- `C:\Users\devon\projects\signalwire-fern-config\scripts\slug-reconciliation\reports\slug-reconciliation-unmatched.csv` -- unmatched only (998 rows)

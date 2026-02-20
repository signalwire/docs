# Slug Reconciliation Report

## Summary

| Metric | Count |
|--------|-------|
| Old sitemap URLs | 1489 |
| Current Fern pages (CSV) | 1320 |
| **Matched** | **645** |
| **Unmatched** | **844** |
| Match rate | 43.3% |

## Unmatched by section

| Prefix | Count |
|--------|-------|
| `/rest` | 418 |
| `/compatibility-api` | 196 |
| `/sdks` | 123 |
| `/platform` | 19 |
| `/call-flow-builder` | 16 |
| `/page` | 14 |
| `/swml` | 13 |
| `/demos` | 10 |
| `/internal` | 9 |
| `/messaging` | 5 |
| `/home` | 4 |
| `/ai` | 3 |
| `/fax` | 3 |
| `/cantina` | 2 |
| `/chat` | 2 |
| `/livewire` | 2 |
| `/voice` | 2 |
| `/cluecon-2024` | 1 |
| `/events` | 1 |
| `/video` | 1 |

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
- `/ai/guides/integrations/vapi` -> [platform] `/ai/guides/integrations/vapi` -> `/ai/vapi`
- `/ai/guides/integrations/vapi/inbound-calls` -> [platform] `/ai/guides/integrations/vapi/inbound-calls` -> `/ai/inbound-calls`
- `/ai/guides/integrations/vapi/outbound-calls` -> [platform] `/ai/guides/integrations/vapi/outbound-calls` -> `/ai/outbound-calls`
- `/ai/pom` -> [platform] `/ai/pom`
- `/ai/pom/technical-reference` -> [platform] `/ai/pom/technical-reference` -> `/ai/technical-reference`
- `/call-flow-builder` -> [call-flow-builder] `/`
- `/call-flow-builder/nodes` -> [call-flow-builder] `/nodes` -> `/reference/nodes`
- `/call-flow-builder/variables` -> [call-flow-builder] `/variables` -> `/guides/variables`
- `/call-flow-builder/version` -> [call-flow-builder] `/version` -> `/guides/version`
- `/chat` -> [platform] `/chat`
- `/chat/faq` -> [platform] `/chat/faq`
- ... and 625 more

## Unmatched samples

- `/ai/guides`
- `/ai/guides/integrations`
- `/ai/guides/integrations/livekit`
- `/call-flow-builder/ai-agent`
- `/call-flow-builder/answer-call`
- `/call-flow-builder/conditions`
- `/call-flow-builder/execute-swml`
- `/call-flow-builder/forward-to-phone`
- `/call-flow-builder/gather-input`
- `/call-flow-builder/handle-call`
- `/call-flow-builder/hangup-call`
- `/call-flow-builder/play-audio-or-tts`
- `/call-flow-builder/request`
- `/call-flow-builder/send-sms`
- `/call-flow-builder/set-variables`
- `/call-flow-builder/start-call-recording`
- `/call-flow-builder/stop-call-recording`
- `/call-flow-builder/unset-variables`
- `/call-flow-builder/voicemail-recording`
- `/cantina/user-guide`
- `/cantina/user-guide-for-admin-rights`
- `/chat/getting-started`
- `/chat/guides`
- `/cluecon-2024`
- `/compatibility-api`
- `/compatibility-api/api-reference/rest-client-sdks/methods`
- `/compatibility-api/client-sdks/api/available-phone-numbers`
- `/compatibility-api/client-sdks/api/available-phone-numbers/find-toll-free`
- `/compatibility-api/client-sdks/api/available-phone-numbers/list-resources`
- `/compatibility-api/client-sdks/api/available-phone-numbers/search-local`
- ... and 814 more

## Output files

- `C:\Users\devon\projects\signalwire-fern-config\scripts\slug-reconciliation\reports\slug-reconciliation.csv` -- full reconciliation (1489 rows)
- `C:\Users\devon\projects\signalwire-fern-config\scripts\slug-reconciliation\reports\slug-reconciliation-unmatched.csv` -- unmatched only (844 rows)

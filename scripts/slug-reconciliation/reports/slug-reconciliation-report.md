# Slug Reconciliation Report

## Summary

| Metric | Count |
|--------|-------|
| Old sitemap URLs | 1489 |
| Current Fern pages (CSV) | 1258 |
| **Matched** | **670** |
| **Unmatched** | **819** |
| Match rate | 45.0% |

## Unmatched by section

| Prefix | Count |
|--------|-------|
| `/rest` | 418 |
| `/compatibility-api` | 196 |
| `/sdks` | 113 |
| `/platform` | 19 |
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
| `/call-flow-builder` | 1 |
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
- `/call-flow-builder/ai-agent` -> [call-flow-builder] `/ai-agent` -> `/reference/ai-agent`
- `/call-flow-builder/answer-call` -> [call-flow-builder] `/answer-call` -> `/reference/answer-call`
- `/call-flow-builder/conditions` -> [call-flow-builder] `/conditions` -> `/reference/conditions`
- `/call-flow-builder/execute-swml` -> [call-flow-builder] `/execute-swml` -> `/reference/execute-swml`
- `/call-flow-builder/forward-to-phone` -> [call-flow-builder] `/forward-to-phone` -> `/reference/forward-to-phone`
- ... and 650 more

## Unmatched samples

- `/ai/guides`
- `/ai/guides/integrations`
- `/ai/guides/integrations/livekit`
- `/call-flow-builder/version`
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
- `/compatibility-api/client-sdks/applications`
- `/compatibility-api/client-sdks/applications/create`
- `/compatibility-api/client-sdks/applications/delete`
- `/compatibility-api/client-sdks/applications/retrieve`
- `/compatibility-api/client-sdks/applications/update`
- `/compatibility-api/client-sdks/methods/accounts`
- `/compatibility-api/client-sdks/methods/accounts/list`
- `/compatibility-api/client-sdks/methods/accounts/retrieve`
- `/compatibility-api/client-sdks/methods/accounts/update`
- `/compatibility-api/client-sdks/methods/calls`
- `/compatibility-api/client-sdks/methods/calls/create`
- `/compatibility-api/client-sdks/methods/calls/delete`
- `/compatibility-api/client-sdks/methods/calls/list`
- `/compatibility-api/client-sdks/methods/calls/retrieve`
- `/compatibility-api/client-sdks/methods/calls/update`
- ... and 789 more

## Output files

- `C:\Users\devon\projects\signalwire-fern-config\scripts\slug-reconciliation\reports\slug-reconciliation.csv` -- full reconciliation (1489 rows)
- `C:\Users\devon\projects\signalwire-fern-config\scripts\slug-reconciliation\reports\slug-reconciliation-unmatched.csv` -- unmatched only (819 rows)

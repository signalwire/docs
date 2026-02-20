# Slug Redirect Report

Unified report merging reconciliation and content-matching results.

## Summary

**Column definitions:**
- **Old URL** -- Docusaurus URL from the old sitemap
- **Current URL** -- live Fern URL based on current frontmatter slug
- **Proposed URL** -- Fern URL after slug standardization is applied

| Action | Count | Description |
|--------|-------|-------------|
| **redirect** | 856 | Old URL -> proposed Fern URL (needs 301 redirect) |
| **review** | 42 | Possible match, needs manual verification |
| **gone** | 581 | Content removed or auto-generated (410/404) |
| **no_action** | 10 | URL unchanged or already covered |
| **Total** | **1489** | |

### By category

| Category | Count |
|----------|-------|
| matched_changed | 660 |
| autogen | 401 |
| slug_changed | 196 |
| known_deleted | 98 |
| likely_deleted | 82 |
| uncertain | 42 |
| matched_same | 10 |

## Redirects (856)

These old URLs need 301 redirects to their proposed locations.

| Old URL | Current URL | Proposed URL | Category | Confidence |
|---------|-------------|--------------|----------|------------|
| `/ai` | `/platform/ai` | `/platform/ai` | matched_changed | 1.000 |
| `/ai/get-started` | `/platform/ai/get-started` | `/platform/ai/get-started` | matched_changed | 1.000 |
| `/ai/get-started/platform-capabilities` | `/platform/ai/get-started/platform-capabilities` | `/platform/ai/platform-capabilities` | matched_changed | 1.000 |
| `/ai/get-started/prompt-engineering` | `/platform/ai/get-started/prompt-engineering` | `/platform/ai/prompt-engineering` | matched_changed | 1.000 |
| `/ai/get-started/prompt-engineering/best-practices` | `/platform/ai/get-started/prompt-engineering/best-practices` | `/platform/ai/prompt-engineering-best-practices` | matched_changed | 1.000 |
| `/ai/get-started/prompt-engineering/where-to-apply` | `/platform/ai/get-started/prompt-engineering/where-to-apply` | `/platform/ai/where-to-apply` | matched_changed | 1.000 |
| `/ai/guides/best-practices` | `/platform/ai/guides/best-practices` | `/platform/ai/guides-best-practices` | matched_changed | 1.000 |
| `/ai/guides/integrations/livekit/inbound` | `/platform/ai/guides/integrations/livekit/inbound` | `/platform/ai/inbound` | matched_changed | 1.000 |
| `/ai/guides/integrations/livekit/outbound` | `/platform/ai/guides/integrations/livekit/outbound` | `/platform/ai/outbound` | matched_changed | 1.000 |
| `/ai/guides/integrations/vapi` | `/platform/ai/guides/integrations/vapi` | `/platform/ai/vapi` | matched_changed | 1.000 |
| `/ai/guides/integrations/vapi/inbound-calls` | `/platform/ai/guides/integrations/vapi/inbound-calls` | `/platform/ai/inbound-calls` | matched_changed | 1.000 |
| `/ai/guides/integrations/vapi/outbound-calls` | `/platform/ai/guides/integrations/vapi/outbound-calls` | `/platform/ai/outbound-calls` | matched_changed | 1.000 |
| `/ai/pom` | `/platform/ai/pom` | `/platform/ai/pom` | matched_changed | 1.000 |
| `/ai/pom/technical-reference` | `/platform/ai/pom/technical-reference` | `/platform/ai/technical-reference` | matched_changed | 1.000 |
| `/call-flow-builder/ai-agent` | `/call-flow-builder/ai-agent` | `/call-flow-builder/reference/ai-agent` | matched_changed | 1.000 |
| `/call-flow-builder/answer-call` | `/call-flow-builder/answer-call` | `/call-flow-builder/reference/answer-call` | matched_changed | 1.000 |
| `/call-flow-builder/conditions` | `/call-flow-builder/conditions` | `/call-flow-builder/reference/conditions` | matched_changed | 1.000 |
| `/call-flow-builder/execute-swml` | `/call-flow-builder/execute-swml` | `/call-flow-builder/reference/execute-swml` | matched_changed | 1.000 |
| `/call-flow-builder/forward-to-phone` | `/call-flow-builder/forward-to-phone` | `/call-flow-builder/reference/forward-to-phone` | matched_changed | 1.000 |
| `/call-flow-builder/gather-input` | `/call-flow-builder/gather-input` | `/call-flow-builder/reference/gather-input` | matched_changed | 1.000 |
| `/call-flow-builder/handle-call` | `/call-flow-builder/handle-call` | `/call-flow-builder/reference/handle-call` | matched_changed | 1.000 |
| `/call-flow-builder/hangup-call` | `/call-flow-builder/hangup-call` | `/call-flow-builder/reference/hangup-call` | matched_changed | 1.000 |
| `/call-flow-builder/nodes` | `/call-flow-builder/nodes` | `/call-flow-builder/reference/nodes` | matched_changed | 1.000 |
| `/call-flow-builder/play-audio-or-tts` | `/call-flow-builder/play-audio-or-tts` | `/call-flow-builder/reference/play-audio-or-tts` | matched_changed | 1.000 |
| `/call-flow-builder/request` | `/call-flow-builder/request` | `/call-flow-builder/reference/request` | matched_changed | 1.000 |
| `/call-flow-builder/send_sms` | `/call-flow-builder/send-sms` | `/call-flow-builder/reference/send-sms` | matched_changed | 1.000 |
| `/call-flow-builder/set-variables` | `/call-flow-builder/set-variables` | `/call-flow-builder/reference/set-variables` | matched_changed | 1.000 |
| `/call-flow-builder/start-call-recording` | `/call-flow-builder/start-call-recording` | `/call-flow-builder/reference/start-call-recording` | matched_changed | 1.000 |
| `/call-flow-builder/stop-call-recording` | `/call-flow-builder/stop-call-recording` | `/call-flow-builder/reference/stop-call-recording` | matched_changed | 1.000 |
| `/call-flow-builder/unset-variables` | `/call-flow-builder/unset-variables` | `/call-flow-builder/reference/unset-variables` | matched_changed | 1.000 |
| `/call-flow-builder/variables` | `/call-flow-builder/variables` | `/call-flow-builder/guides/variables` | matched_changed | 1.000 |
| `/call-flow-builder/version` | `/call-flow-builder/core/version` | `/call-flow-builder/guides/version` | slug_changed | 0.984 |
| `/call-flow-builder/voicemail-recording` | `/call-flow-builder/voicemail-recording` | `/call-flow-builder/reference/voicemail-recording` | matched_changed | 1.000 |
| `/chat` | `/platform/chat` | `/platform/chat` | matched_changed | 1.000 |
| `/chat/faq` | `/platform/chat/faq` | `/platform/chat/faq` | matched_changed | 1.000 |
| `/chat/getting-started/chat-first-steps` | `/platform/chat/getting-started/chat-first-steps` | `/platform/chat/chat-first-steps` | matched_changed | 1.000 |
| `/chat/getting-started/get-started-with-a-simple-chat-demo` | `/platform/chat/getting-started/get-started-with-a-simple-chat-demo` | `/platform/chat/get-started-with-a-simple-chat-demo` | matched_changed | 1.000 |
| `/chat/guides/build-a-react-chat-application` | `/platform/chat/guides/build-a-react-chat-application` | `/platform/chat/build-a-react-chat-application` | matched_changed | 1.000 |
| `/chat/guides/using-chat-to-send-sms-and-make-calls` | `/platform/chat/guides/using-chat-to-send-sms-and-make-calls` | `/platform/chat/using-chat-to-send-sms-and-make-calls` | matched_changed | 1.000 |
| `/compatibility-api/api-reference/rest-client-sdks/methods` | `/compatibility-api/sdks/methods` | `/compatibility-api/sdks/methods` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/api/available-phone-numbers` | `/compatibility-api/sdks/methods/available-phone-numbers` | `/compatibility-api/sdks/methods/available-phone-numbers` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/api/available-phone-numbers/list-resources` | `/compatibility-api/sdks/methods/available-phone-numbers/list-resources` | `/compatibility-api/sdks/methods/available-phone-numbers/list-resources` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/applications` | `/compatibility-api/sdks/methods/applications` | `/compatibility-api/sdks/methods/applications` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/applications/create` | `/compatibility-api/sdks/methods/applications/create` | `/compatibility-api/sdks/methods/applications/create` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/applications/delete` | `/compatibility-api/sdks/methods/applications/delete` | `/compatibility-api/sdks/methods/applications/delete` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/applications/retrieve` | `/compatibility-api/sdks/methods/applications/retrieve` | `/compatibility-api/sdks/methods/applications/retrieve` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/applications/update` | `/compatibility-api/sdks/methods/applications/update` | `/compatibility-api/sdks/methods/applications/update` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/accounts` | `/compatibility-api/sdks/methods/accounts` | `/compatibility-api/sdks/methods/accounts` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/accounts/list` | `/compatibility-api/sdks/methods/accounts/list` | `/compatibility-api/sdks/methods/accounts/list` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/accounts/retrieve` | `/compatibility-api/sdks/methods/accounts/retrieve` | `/compatibility-api/sdks/methods/accounts/retrieve` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/accounts/update` | `/compatibility-api/sdks/methods/accounts/update` | `/compatibility-api/sdks/methods/accounts/update` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/calls` | `/compatibility-api/sdks/methods/calls` | `/compatibility-api/sdks/methods/calls` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/calls/create` | `/compatibility-api/sdks/methods/calls/create` | `/compatibility-api/sdks/methods/calls/create` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/calls/delete` | `/compatibility-api/sdks/methods/calls/delete` | `/compatibility-api/sdks/methods/calls/delete` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/calls/list` | `/compatibility-api/sdks/methods/calls/list` | `/compatibility-api/sdks/methods/calls/list` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/calls/retrieve` | `/compatibility-api/sdks/methods/calls/retrieve` | `/compatibility-api/sdks/methods/calls/retrieve` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/calls/update` | `/compatibility-api/sdks/methods/calls/update` | `/compatibility-api/sdks/methods/calls/update` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/conference-participants` | `/compatibility-api/sdks/methods/conference-participants` | `/compatibility-api/sdks/methods/conference-participants` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/conference-participants/add` | `/compatibility-api/sdks/methods/conference-participants/add` | `/compatibility-api/sdks/methods/conference-participants/add` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/conference-participants/delete` | `/compatibility-api/sdks/methods/conference-participants/delete` | `/compatibility-api/sdks/methods/conference-participants/delete` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/conference-participants/list` | `/compatibility-api/sdks/methods/conference-participants/list` | `/compatibility-api/sdks/methods/conference-participants/list` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/conference-participants/retrieve` | `/compatibility-api/sdks/methods/conference-participants/retrieve` | `/compatibility-api/sdks/methods/conference-participants/retrieve` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/conference-participants/update` | `/compatibility-api/sdks/methods/conference-participants/update` | `/compatibility-api/sdks/methods/conference-participants/update` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/conferences` | `/compatibility-api/sdks/methods/conferences` | `/compatibility-api/sdks/methods/conferences` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/conferences/list` | `/compatibility-api/sdks/methods/conferences/list` | `/compatibility-api/sdks/methods/conferences/list` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/conferences/retrieve` | `/compatibility-api/sdks/methods/conferences/retrieve` | `/compatibility-api/sdks/methods/conferences/retrieve` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/conferences/update` | `/compatibility-api/sdks/methods/conferences/update` | `/compatibility-api/sdks/methods/conferences/update` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/cxml-applications` | `/compatibility-api/sdks/methods/cxml-applications` | `/compatibility-api/sdks/methods/cxml-applications` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/cxml-applications/create` | `/compatibility-api/sdks/methods/cxml-applications/create` | `/compatibility-api/sdks/methods/cxml-applications/create` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/cxml-applications/delete` | `/compatibility-api/sdks/methods/cxml-applications/delete` | `/compatibility-api/sdks/methods/cxml-applications/delete` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/cxml-applications/list` | `/compatibility-api/sdks/methods/cxml-applications/list` | `/compatibility-api/sdks/methods/cxml-applications/list` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/cxml-applications/retrieve` | `/compatibility-api/sdks/methods/cxml-applications/retrieve` | `/compatibility-api/sdks/methods/cxml-applications/retrieve` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/cxml-applications/update` | `/compatibility-api/sdks/methods/cxml-applications/update` | `/compatibility-api/sdks/methods/cxml-applications/update` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/fax-media` | `/compatibility-api/sdks/methods/fax-media` | `/compatibility-api/sdks/methods/fax-media` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/fax-media/delete` | `/compatibility-api/sdks/methods/fax-media/delete` | `/compatibility-api/sdks/methods/fax-media/delete` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/fax-media/retrieve` | `/compatibility-api/sdks/methods/fax-media/retrieve` | `/compatibility-api/sdks/methods/fax-media/retrieve` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/faxes` | `/compatibility-api/sdks/methods/faxes` | `/compatibility-api/sdks/methods/faxes` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/faxes/delete` | `/compatibility-api/sdks/methods/faxes/delete` | `/compatibility-api/sdks/methods/faxes/delete` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/faxes/list` | `/compatibility-api/sdks/methods/faxes/list` | `/compatibility-api/sdks/methods/faxes/list` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/faxes/retrieve` | `/compatibility-api/sdks/methods/faxes/retrieve` | `/compatibility-api/sdks/methods/faxes/retrieve` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/faxes/send` | `/compatibility-api/sdks/methods/faxes/send` | `/compatibility-api/sdks/methods/faxes/send` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/faxes/update` | `/compatibility-api/sdks/methods/faxes/update` | `/compatibility-api/sdks/methods/faxes/update` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/incoming-phone-numbers` | `/compatibility-api/sdks/methods/incoming-phone-numbers` | `/compatibility-api/sdks/methods/incoming-phone-numbers` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/incoming-phone-numbers/create` | `/compatibility-api/sdks/methods/incoming-phone-numbers/create` | `/compatibility-api/sdks/methods/incoming-phone-numbers/create` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/incoming-phone-numbers/delete` | `/compatibility-api/sdks/methods/incoming-phone-numbers/delete` | `/compatibility-api/sdks/methods/incoming-phone-numbers/delete` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/incoming-phone-numbers/list` | `/compatibility-api/sdks/methods/incoming-phone-numbers/list` | `/compatibility-api/sdks/methods/incoming-phone-numbers/list` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/incoming-phone-numbers/retrieve` | `/compatibility-api/sdks/methods/incoming-phone-numbers/retrieve` | `/compatibility-api/sdks/methods/incoming-phone-numbers/retrieve` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/incoming-phone-numbers/update` | `/compatibility-api/sdks/methods/incoming-phone-numbers/update` | `/compatibility-api/sdks/methods/incoming-phone-numbers/update` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/media` | `/compatibility-api/sdks/methods/media` | `/compatibility-api/sdks/methods/media` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/media/delete` | `/compatibility-api/sdks/methods/media/delete` | `/compatibility-api/sdks/methods/media/delete` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/media/list` | `/compatibility-api/sdks/methods/media/list` | `/compatibility-api/sdks/methods/media/list` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/media/retrieve` | `/compatibility-api/sdks/methods/media/retrieve` | `/compatibility-api/sdks/methods/media/retrieve` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/messaging` | `/compatibility-api/sdks/methods/messaging` | `/compatibility-api/sdks/methods/messaging` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/messaging/create` | `/compatibility-api/sdks/methods/messaging/create` | `/compatibility-api/sdks/methods/messaging/create` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/messaging/delete` | `/compatibility-api/sdks/methods/messaging/delete` | `/compatibility-api/sdks/methods/messaging/delete` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/messaging/list` | `/compatibility-api/sdks/methods/messaging/list` | `/compatibility-api/sdks/methods/messaging/list` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/messaging/retrieve` | `/compatibility-api/sdks/methods/messaging/retrieve` | `/compatibility-api/sdks/methods/messaging/retrieve` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/messaging/update` | `/compatibility-api/sdks/methods/messaging/update` | `/compatibility-api/sdks/methods/messaging/update` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/queue-members` | `/compatibility-api/sdks/methods/queue-members` | `/compatibility-api/sdks/methods/queue-members` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/queue-members/list` | `/compatibility-api/sdks/methods/queue-members/list` | `/compatibility-api/sdks/methods/queue-members/list` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/queue-members/retrieve` | `/compatibility-api/sdks/methods/queue-members/retrieve` | `/compatibility-api/sdks/methods/queue-members/retrieve` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/queue-members/update` | `/compatibility-api/sdks/methods/queue-members/update` | `/compatibility-api/sdks/methods/queue-members/update` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/queues` | `/compatibility-api/sdks/methods/queues` | `/compatibility-api/sdks/methods/queues` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/queues/create` | `/compatibility-api/sdks/methods/queues/create` | `/compatibility-api/sdks/methods/queues/create` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/queues/delete` | `/compatibility-api/sdks/methods/queues/delete` | `/compatibility-api/sdks/methods/queues/delete` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/queues/list` | `/compatibility-api/sdks/methods/queues/list` | `/compatibility-api/sdks/methods/queues/list` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/queues/retrieve` | `/compatibility-api/sdks/methods/queues/retrieve` | `/compatibility-api/sdks/methods/queues/retrieve` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/queues/retrieve-members-waiting-in-queue` | `/compatibility-api/sdks/methods/queues/retrieve-members-waiting-in-queue` | `/compatibility-api/sdks/methods/queues/retrieve-members-waiting-in-queue` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/queues/update` | `/compatibility-api/sdks/methods/queues/update` | `/compatibility-api/sdks/methods/queues/update` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/recording-transcriptions` | `/compatibility-api/sdks/methods/recording-transcriptions` | `/compatibility-api/sdks/methods/recording-transcriptions` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/recording-transcriptions/delete` | `/compatibility-api/sdks/methods/recording-transcriptions/delete` | `/compatibility-api/sdks/methods/recording-transcriptions/delete` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/recording-transcriptions/list` | `/compatibility-api/sdks/methods/recording-transcriptions/list` | `/compatibility-api/sdks/methods/recording-transcriptions/list` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/recording-transcriptions/retrieve` | `/compatibility-api/sdks/methods/recording-transcriptions/retrieve` | `/compatibility-api/sdks/methods/recording-transcriptions/retrieve` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/recordings` | `/compatibility-api/sdks/methods/recordings` | `/compatibility-api/sdks/methods/recordings` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/recordings/create` | `/compatibility-api/sdks/methods/recordings/create` | `/compatibility-api/sdks/methods/recordings/create` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/recordings/delete` | `/compatibility-api/sdks/methods/recordings/delete` | `/compatibility-api/sdks/methods/recordings/delete` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/recordings/list` | `/compatibility-api/sdks/methods/recordings/list` | `/compatibility-api/sdks/methods/recordings/list` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/recordings/retrieve` | `/compatibility-api/sdks/methods/recordings/retrieve` | `/compatibility-api/sdks/methods/recordings/retrieve` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/recordings/update` | `/compatibility-api/sdks/methods/recordings/update` | `/compatibility-api/sdks/methods/recordings/update` | slug_changed | 1.000 |
| `/compatibility-api/cxml/fax/reject` | `/compatibility-api/cxml/fax/reject` | `/compatibility-api/reference/cxml/fax/reject` | slug_changed | 0.904 |
| `/compatibility-api/cxml/messaging/redirect` | `/compatibility-api/cxml/messaging/redirect` | `/compatibility-api/reference/cxml/messaging/redirect` | slug_changed | 0.858 |
| `/compatibility-api/cxml/voice/connect` | `/compatibility-api/cxml/voice/connect` | `/compatibility-api/reference/cxml/voice/connect` | slug_changed | 0.878 |
| `/compatibility-api/cxml/voice/denoise` | `/compatibility-api/cxml/voice/denoise` | `/compatibility-api/reference/cxml/voice/denoise` | slug_changed | 0.987 |
| `/compatibility-api/cxml/voice/gather` | `/compatibility-api/cxml/voice/gather` | `/compatibility-api/reference/cxml/voice/gather` | slug_changed | 0.740 |
| `/compatibility-api/cxml/voice/hangup` | `/compatibility-api/cxml/voice/hangup` | `/compatibility-api/reference/cxml/voice/hangup` | slug_changed | 0.953 |
| `/compatibility-api/cxml/voice/leave` | `/compatibility-api/cxml/voice/leave` | `/compatibility-api/reference/cxml/voice/leave` | slug_changed | 0.957 |
| `/compatibility-api/cxml/voice/pause` | `/compatibility-api/cxml/voice/pause` | `/compatibility-api/reference/cxml/voice/pause` | slug_changed | 0.906 |
| `/compatibility-api/cxml/voice/pay/parameter` | `/compatibility-api/cxml/voice/pay/parameter` | `/compatibility-api/reference/cxml/voice/pay/parameter` | slug_changed | 0.986 |
| `/compatibility-api/cxml/voice/pay/prompt` | `/compatibility-api/cxml/voice/pay/prompt` | `/compatibility-api/reference/cxml/voice/pay/prompt` | slug_changed | 0.776 |
| `/compatibility-api/cxml/voice/play` | `/compatibility-api/cxml/voice/play` | `/compatibility-api/reference/cxml/voice/play` | slug_changed | 0.804 |
| `/compatibility-api/cxml/voice/queue-noun` | `/compatibility-api/cxml/voice/queue` | `/compatibility-api/reference/cxml/voice/queue` | slug_changed | 0.770 |
| `/compatibility-api/cxml/voice/redirect` | `/compatibility-api/cxml/voice/redirect` | `/compatibility-api/reference/cxml/voice/redirect` | slug_changed | 0.913 |
| `/compatibility-api/cxml/voice/refer` | `/compatibility-api/cxml/voice/refer` | `/compatibility-api/reference/cxml/voice/refer` | slug_changed | 0.745 |
| `/compatibility-api/cxml/voice/reject` | `/compatibility-api/cxml/voice/reject` | `/compatibility-api/reference/cxml/voice/reject` | slug_changed | 0.829 |
| `/compatibility-api/cxml/voice/room-noun` | `/compatibility-api/cxml/voice/room` | `/compatibility-api/reference/cxml/voice/room` | slug_changed | 0.886 |
| `/compatibility-api/cxml/voice/say` | `/compatibility-api/cxml/voice/say` | `/compatibility-api/reference/cxml/voice/say` | slug_changed | 0.729 |
| `/compatibility-api/cxml/voice/stream` | `/compatibility-api/cxml/voice/stream` | `/compatibility-api/reference/cxml/voice/stream` | slug_changed | 0.859 |
| `/compatibility-api/cxml/voice/verto-noun` | `/compatibility-api/cxml/voice/verto` | `/compatibility-api/reference/cxml/voice/verto` | slug_changed | 0.992 |
| `/compatibility-api/cxml/voice/virtualagent-noun` | `/compatibility-api/cxml/voice/virtualagent` | `/compatibility-api/reference/cxml/voice/virtualagent` | slug_changed | 0.802 |
| `/compatibility-api/sdks` | `/compatibility-api/sdks` | `/compatibility-api/sdks` | slug_changed | 1.000 |
| `/fax` | `/platform/fax` | `/platform/fax` | matched_changed | 1.000 |
| `/fax/getting-started/common-fax-errors` | `/platform/fax/getting-started/common-fax-errors` | `/platform/fax/common-fax-errors` | matched_changed | 1.000 |
| `/fax/getting-started/fax-to-email` | `/platform/fax/getting-started/fax-to-email` | `/platform/fax/fax-to-email` | matched_changed | 1.000 |
| `/fax/getting-started/fax-with-retries` | `/platform/fax/getting-started/fax-with-retries` | `/platform/fax/fax-with-retries` | matched_changed | 1.000 |
| `/fax/getting-started/filter-faxes-by-number-status-and-date` | `/platform/fax/getting-started/filter-faxes-by-number-status-and-date` | `/platform/fax/filter-faxes-by-number-status-and-date` | matched_changed | 1.000 |
| `/fax/getting-started/list-faxes-to-csv-in-all-languages` | `/platform/fax/getting-started/list-faxes-to-csv-in-all-languages` | `/platform/fax/list-faxes-to-csv-in-all-languages` | matched_changed | 1.000 |
| `/guides` | `/realtime-sdk/guides` | `/realtime-sdk/guides` | matched_changed | 1.000 |
| `/messaging` | `/platform/messaging` | `/platform/messaging` | matched_changed | 1.000 |
| `/messaging/faq` | `/platform/messaging/faq` | `/platform/messaging/messaging-faq` | matched_changed | 1.000 |
| `/messaging/get-started/campaign-registry` | `/platform/messaging/get-started/campaign-registry` | `/platform/messaging/campaign-registry` | matched_changed | 1.000 |
| `/messaging/getting-started/campaign-registry/campaign-service-providers` | `/platform/messaging/getting-started/campaign-registry/campaign-service-providers` | `/platform/messaging/campaign-service-providers` | matched_changed | 1.000 |
| `/messaging/getting-started/campaign-registry/faq` | `/platform/messaging/getting-started/campaign-registry/faq` | `/platform/messaging/campaign-registry-faq` | matched_changed | 1.000 |
| `/messaging/getting-started/campaign-registry/pricing` | `/platform/messaging/getting-started/campaign-registry/pricing` | `/platform/messaging/pricing` | matched_changed | 1.000 |
| `/messaging/getting-started/campaign-registry/registration` | `/platform/messaging/getting-started/campaign-registry/registration` | `/platform/messaging/registration` | matched_changed | 1.000 |
| `/messaging/getting-started/how-to-troubleshoot-common-messaging-issues` | `/platform/messaging/getting-started/how-to-troubleshoot-common-messaging-issues` | `/platform/messaging/how-to-troubleshoot-common-messaging-issues` | matched_changed | 1.000 |
| `/messaging/getting-started/platform-free-trial` | `/platform/messaging/getting-started/platform-free-trial` | `/platform/messaging/platform-free-trial` | matched_changed | 1.000 |
| `/messaging/getting-started/receiving-your-first-sms` | `/compatibility-api/cxml/guides/receiving-your-first-sms` | `/compatibility-api/guides/receiving-your-first-sms` | slug_changed | 0.914 |
| `/messaging/getting-started/sending-your-first-sms` | `/compatibility-api/cxml/guides/sending-your-first-sms` | `/compatibility-api/guides/sending-your-first-sms` | slug_changed | 0.966 |
| `/messaging/getting-started/sms-best-practices-how-to-ensure-message-delivery` | `/platform/messaging/getting-started/sms-best-practices-how-to-ensure-message-delivery` | `/platform/messaging/sms-best-practices-how-to-ensure-message-delivery` | matched_changed | 1.000 |
| `/messaging/guides/general/how-to-build-a-private-url-shortener` | `/platform/messaging/guides/general/how-to-build-a-private-url-shortener` | `/platform/messaging/how-to-build-a-private-url-shortener` | matched_changed | 1.000 |
| `/messaging/guides/general/how-to-find-unregistered-numbers-on-your-project` | `/platform/messaging/guides/general/how-to-find-unregistered-numbers-on-your-project` | `/platform/messaging/how-to-find-unregistered-numbers-on-your-project` | matched_changed | 1.000 |
| `/messaging/guides/general/messaging-character-limits` | `/platform/messaging/guides/general/messaging-character-limits` | `/platform/messaging/messaging-character-limits` | matched_changed | 1.000 |
| `/messaging/guides/general/messaging-mime-types` | `/platform/messaging/guides/general/messaging-mime-types` | `/platform/messaging/messaging-mime-types` | matched_changed | 1.000 |
| `/messaging/guides/general/toll-free-number-overview` | `/platform/messaging/guides/general/toll-free-number-overview` | `/platform/messaging/toll-free-number-overview` | matched_changed | 1.000 |
| `/messaging/guides/hosted-messaging` | `/platform/messaging/guides/hosted-messaging` | `/platform/messaging/hosted-messaging` | matched_changed | 1.000 |
| `/platform/basics/general/signalwire-rate-limits` | `/platform/basics/general/signalwire-rate-limits` | `/platform/basics/signalwire-rate-limits` | matched_changed | 1.000 |
| `/platform/basics/general/stir-shaken-all-you-need-to-know` | `/platform/basics/general/stir-shaken-all-you-need-to-know` | `/platform/basics/stir-shaken-all-you-need-to-know` | matched_changed | 1.000 |
| `/platform/basics/general/stun-vs-turn-vs-ice` | `/platform/basics/general/stun-vs-turn-vs-ice` | `/platform/basics/stun-vs-turn-vs-ice` | matched_changed | 1.000 |
| `/platform/basics/general/what-is-sip` | `/platform/basics/general/what-is-sip` | `/platform/basics/what-is-sip` | matched_changed | 1.000 |
| `/platform/basics/general/what-is-webrtc` | `/platform/basics/general/what-is-webrtc` | `/platform/basics/what-is-webrtc` | matched_changed | 1.000 |
| `/platform/basics/guides/getting-started-without-code` | `/platform/basics/guides/getting-started-without-code` | `/platform/basics/getting-started-without-code` | matched_changed | 1.000 |
| `/platform/basics/guides/how-to-test-api-requests-on-postman` | `/platform/basics/guides/how-to-test-api-requests-on-postman` | `/platform/basics/how-to-test-api-requests-on-postman` | matched_changed | 1.000 |
| `/platform/basics/guides/technical-troubleshooting/common-webhook-errors` | `/platform/basics/guides/technical-troubleshooting/common-webhook-errors` | `/platform/basics/common-webhook-errors` | matched_changed | 1.000 |
| `/platform/basics/guides/technical-troubleshooting/creating-a-publically-exposed-webhook` | `/platform/basics/guides/technical-troubleshooting/creating-a-publically-exposed-webhook` | `/platform/basics/creating-a-publically-exposed-webhook` | matched_changed | 1.000 |
| `/platform/basics/guides/technical-troubleshooting/how-to-test-webhooks-with-ngrok` | `/platform/basics/guides/technical-troubleshooting/how-to-test-webhooks-with-ngrok` | `/platform/basics/how-to-test-webhooks-with-ngrok` | matched_changed | 1.000 |
| `/platform/basics/guides/webrtc-with-sip-over-websockets` | `/platform/basics/guides/webrtc-with-sip-over-websockets` | `/platform/basics/webrtc-with-sip-over-websockets` | matched_changed | 1.000 |
| `/platform/basics/security-and-compliance/fraud` | `/platform/basics/security-and-compliance/fraud` | `/platform/basics/fraud` | matched_changed | 1.000 |
| `/platform/basics/security-and-compliance/hipaapci-compliance` | `/platform/basics/security-and-compliance/hipaapci-compliance` | `/platform/basics/hipaapci-compliance` | matched_changed | 1.000 |
| `/platform/basics/security-and-compliance/webhook-security` | `/platform/basics/security-and-compliance/webhook-security` | `/platform/basics/webhook-security` | matched_changed | 1.000 |
| `/platform/call-fabric/resources/ai-agents` | `/platform/call-fabric/resources/ai-agents` | `/platform/call-fabric/ai-agents` | matched_changed | 1.000 |
| `/platform/call-fabric/resources/cxml-scripts` | `/platform/call-fabric/resources/cxml-scripts` | `/platform/call-fabric/cxml-scripts` | matched_changed | 1.000 |
| `/platform/call-fabric/resources/dialogflow-agents` | `/platform/call-fabric/resources/dialogflow-agents` | `/platform/call-fabric/dialogflow-agents` | matched_changed | 1.000 |
| `/platform/call-fabric/resources/freeswitch-connectors` | `/platform/call-fabric/resources/freeswitch-connectors` | `/platform/call-fabric/freeswitch-connectors` | matched_changed | 1.000 |
| `/platform/call-fabric/resources/relay-applications` | `/platform/call-fabric/resources/relay-applications` | `/platform/call-fabric/relay-applications` | matched_changed | 1.000 |
| `/platform/call-fabric/resources/sip-gateways` | `/platform/call-fabric/resources/sip-gateways` | `/platform/call-fabric/sip-gateways` | matched_changed | 1.000 |
| `/platform/call-fabric/resources/subscribers` | `/platform/call-fabric/resources/subscribers` | `/platform/call-fabric/resources-subscribers` | matched_changed | 1.000 |
| `/platform/call-fabric/resources/swml-scripts` | `/platform/call-fabric/resources/swml-scripts` | `/platform/call-fabric/swml-scripts` | matched_changed | 1.000 |
| `/platform/call-fabric/resources/video-rooms` | `/platform/call-fabric/resources/video-rooms` | `/platform/call-fabric/video-rooms` | matched_changed | 1.000 |
| `/platform/call-fabric/subscribers` | `/platform/call-fabric/subscribers` | `/platform/call-fabric/call-fabric-subscribers` | matched_changed | 1.000 |
| `/platform/dashboard/get-started/phone-numbers` | `/platform/dashboard/get-started/phone-numbers` | `/platform/dashboard/phone-numbers` | matched_changed | 1.000 |
| `/platform/dashboard/getting-started/signing-up-for-a-space` | `/platform/dashboard/getting-started/signing-up-for-a-space` | `/platform/dashboard/signing-up-for-a-space` | matched_changed | 1.000 |
| `/platform/dashboard/getting-started/your-signalwire-api-space` | `/platform/dashboard/getting-started/your-signalwire-api-space` | `/platform/dashboard/your-signalwire-api-space` | matched_changed | 1.000 |
| `/platform/dashboard/guides/changing-settings-in-your-signalwire-space` | `/platform/dashboard/guides/changing-settings-in-your-signalwire-space` | `/platform/dashboard/changing-settings-in-your-signalwire-space` | matched_changed | 1.000 |
| `/platform/dashboard/guides/closing-a-signalwire-account` | `/platform/dashboard/guides/closing-a-signalwire-account` | `/platform/dashboard/closing-a-signalwire-account` | matched_changed | 1.000 |
| `/platform/dashboard/guides/export-logs-from-your-signalwire-space` | `/platform/dashboard/guides/export-logs-from-your-signalwire-space` | `/platform/dashboard/export-logs-from-your-signalwire-space` | matched_changed | 1.000 |
| `/platform/dashboard/guides/how-to-enable-international-outbound-dialing-sms` | `/platform/dashboard/guides/how-to-enable-international-outbound-dialing-sms` | `/platform/dashboard/how-to-enable-international-outbound-dialing-sms` | matched_changed | 1.000 |
| `/platform/dashboard/guides/how-to-request-an-increase-to-your-signalwire-space-limits` | `/platform/dashboard/guides/how-to-request-an-increase-to-your-signalwire-space-limits` | `/platform/dashboard/how-to-request-an-increase-to-your-signalwire-space-limits` | matched_changed | 1.000 |
| `/platform/dashboard/guides/media-protection` | `/platform/dashboard/guides/media-protection` | `/platform/dashboard/media-protection` | matched_changed | 1.000 |
| `/platform/dashboard/guides/subprojects` | `/platform/dashboard/guides/subprojects` | `/platform/dashboard/subprojects` | matched_changed | 1.000 |
| `/platform/dashboard/guides/suspended-signalwire-cloud-space` | `/platform/dashboard/guides/suspended-signalwire-cloud-space` | `/platform/dashboard/suspended-signalwire-cloud-space` | matched_changed | 1.000 |
| `/platform/dashboard/guides/user-management` | `/platform/dashboard/guides/user-management` | `/platform/dashboard/user-management` | matched_changed | 1.000 |
| `/platform/dashboard/guides/what-is-a-sid` | `/platform/dashboard/guides/what-is-a-sid` | `/platform/dashboard/what-is-a-sid` | matched_changed | 1.000 |
| `/platform/integrations/carriers/thinq` | `/platform/integrations/carriers/thinq` | `/platform/integrations/thinq` | matched_changed | 1.000 |
| `/platform/integrations/crm/zoho-crm-click-to-call` | `/platform/integrations/crm/zoho-crm-click-to-call` | `/platform/integrations/zoho-crm-click-to-call` | matched_changed | 1.000 |
| `/platform/integrations/dialogflow/dialogflow-agents` | `/platform/integrations/dialogflow/dialogflow-agents` | `/platform/integrations/dialogflow-agents` | matched_changed | 1.000 |
| `/platform/integrations/dialogflow/dialogflow-using-nodejs-to-get-caller-id-send-sms` | `/platform/integrations/dialogflow/dialogflow-using-nodejs-to-get-caller-id-send-sms` | `/platform/integrations/dialogflow-using-nodejs-to-get-caller-id-send-sms` | matched_changed | 1.000 |
| `/platform/integrations/freeswitch/add-ai-to-freeswitch` | `/platform/integrations/freeswitch/add-ai-to-freeswitch` | `/platform/integrations/add-ai-to-freeswitch` | matched_changed | 1.000 |
| `/platform/integrations/freeswitch/choosing-a-freeswitch-repository` | `/platform/integrations/freeswitch/choosing-a-freeswitch-repository` | `/platform/integrations/choosing-a-freeswitch-repository` | matched_changed | 1.000 |
| `/platform/integrations/freeswitch/freeswitch-crash-getting-a-backtrace-from-a-core-dump` | `/platform/integrations/freeswitch/freeswitch-crash-getting-a-backtrace-from-a-core-dump` | `/platform/integrations/freeswitch-crash-getting-a-backtrace-from-a-core-dump` | matched_changed | 1.000 |
| `/platform/integrations/freeswitch/freeswitch-memory-address-and-memory-pool-sanitizer` | `/platform/integrations/freeswitch/freeswitch-memory-address-and-memory-pool-sanitizer` | `/platform/integrations/freeswitch-memory-address-and-memory-pool-sanitizer` | matched_changed | 1.000 |
| `/platform/integrations/freeswitch/how-to-mod_signalwire-in-freeswitch-clean-and-reconfigure` | `/platform/integrations/freeswitch/how-to-mod-signalwire-in-freeswitch-clean-and-reconfigure` | `/platform/integrations/how-to-mod-signalwire-in-freeswitch-clean-and-reconfigure` | matched_changed | 1.000 |
| `/platform/integrations/freeswitch/installing-freeswitch-or-freeswitch-advantage` | `/platform/integrations/freeswitch/installing-freeswitch-or-freeswitch-advantage` | `/platform/integrations/installing-freeswitch-or-freeswitch-advantage` | matched_changed | 1.000 |
| `/platform/integrations/freeswitch/sending-an-sms-from-freeswitch-xml-dialplan-through-signalwire-cloud` | `/platform/integrations/freeswitch/sending-an-sms-from-freeswitch-xml-dialplan-through-signalwire-cloud` | `/platform/integrations/sending-an-sms-from-freeswitch-xml-dialplan-through-signalwire-cloud` | matched_changed | 1.000 |
| `/platform/integrations/messaging-services/textable` | `/platform/integrations/messaging-services/textable` | `/platform/integrations/textable` | matched_changed | 1.000 |
| `/platform/integrations/messaging-services/textit` | `/platform/integrations/messaging-services/textit` | `/platform/integrations/textit` | matched_changed | 1.000 |
| `/platform/integrations/pbx-systems/connect-fusionpbx-with-signalwire` | `/platform/integrations/pbx-systems/connect-fusionpbx-with-signalwire` | `/platform/integrations/connect-fusionpbx-with-signalwire` | matched_changed | 1.000 |
| `/platform/integrations/pbx-systems/set-up-chan_sip-freepbx-with-signalwire` | `/platform/integrations/pbx-systems/set-up-chan-sip-freepbx-with-signalwire` | `/platform/integrations/set-up-chan-sip-freepbx-with-signalwire` | matched_changed | 1.000 |
| `/platform/integrations/pbx-systems/set-up-freepbx-with-signalwire` | `/platform/integrations/pbx-systems/set-up-freepbx-with-signalwire` | `/platform/integrations/set-up-freepbx-with-signalwire` | matched_changed | 1.000 |
| `/platform/integrations/serverless-functions/google-cloud-functions` | `/platform/integrations/serverless-functions/google-cloud-functions` | `/platform/integrations/google-cloud-functions` | matched_changed | 1.000 |
| `/platform/integrations/serverless-functions/microsoft-azure-functions` | `/platform/integrations/serverless-functions/microsoft-azure-functions` | `/platform/integrations/microsoft-azure-functions` | matched_changed | 1.000 |
| `/platform/integrations/softphones/connect-signalwire-with-3cx` | `/platform/integrations/softphones/connect-signalwire-with-3cx` | `/platform/integrations/connect-signalwire-with-3cx` | matched_changed | 1.000 |
| `/platform/integrations/softphones/connect-signalwire-with-linphone` | `/platform/integrations/softphones/connect-signalwire-with-linphone` | `/platform/integrations/connect-signalwire-with-linphone` | matched_changed | 1.000 |
| `/platform/integrations/softphones/microsip-softphone` | `/platform/integrations/softphones/microsip-softphone` | `/platform/integrations/microsip-softphone` | matched_changed | 1.000 |
| `/platform/integrations/softphones/set-up-bria-softphone-with-signalwire` | `/platform/integrations/softphones/set-up-bria-softphone-with-signalwire` | `/platform/integrations/set-up-bria-softphone-with-signalwire` | matched_changed | 1.000 |
| `/platform/integrations/softphones/set-up-zoiper-softphone-with-signalwire` | `/platform/integrations/softphones/set-up-zoiper-softphone-with-signalwire` | `/platform/integrations/set-up-zoiper-softphone-with-signalwire` | matched_changed | 1.000 |
| `/platform/integrations/workflow-tools/how-to-integrate-signalwire-into-integromat` | `/platform/integrations/workflow-tools/how-to-integrate-signalwire-into-integromat` | `/platform/integrations/how-to-integrate-signalwire-into-integromat` | matched_changed | 1.000 |
| `/platform/integrations/workflow-tools/zapier/creating-a-zapier-zap` | `/platform/integrations/workflow-tools/zapier/creating-a-zapier-zap` | `/platform/integrations/creating-a-zapier-zap` | matched_changed | 1.000 |
| `/platform/integrations/workflow-tools/zapier/how-to-use-zapier-webhooks` | `/platform/integrations/workflow-tools/zapier/how-to-use-zapier-webhooks` | `/platform/integrations/how-to-use-zapier-webhooks` | matched_changed | 1.000 |
| `/platform/phone-numbers` | `/platform/dashboard/get-started/phone-numbers` | `/platform/dashboard/phone-numbers` | matched_changed | 1.000 |
| `/platform/phone-numbers/getting-started/buying-a-phone-number` | `/platform/phone-numbers/getting-started/buying-a-phone-number` | `/platform/phone-numbers/buying-a-phone-number` | matched_changed | 1.000 |
| `/platform/phone-numbers/getting-started/e911` | `/platform/phone-numbers/getting-started/e911` | `/platform/phone-numbers/e911` | matched_changed | 1.000 |
| `/platform/phone-numbers/getting-started/porting-into-signalwire` | `/platform/phone-numbers/getting-started/porting-into-signalwire` | `/platform/phone-numbers/porting-into-signalwire` | matched_changed | 1.000 |
| `/platform/phone-numbers/getting-started/what-is-e164` | `/platform/phone-numbers/getting-started/what-is-e164` | `/platform/phone-numbers/what-is-e164` | matched_changed | 1.000 |
| `/platform/phone-numbers/guides/caller-id` | `/platform/phone-numbers/guides/caller-id` | `/platform/phone-numbers/caller-id` | matched_changed | 1.000 |
| `/platform/phone-numbers/guides/how-to-configure-your-webhook` | `/platform/phone-numbers/guides/how-to-configure-your-webhook` | `/platform/phone-numbers/how-to-configure-your-webhook` | matched_changed | 1.000 |
| `/platform/phone-numbers/guides/number-groups` | `/platform/phone-numbers/guides/number-groups` | `/platform/phone-numbers/number-groups` | matched_changed | 1.000 |
| `/platform/phone-numbers/guides/porting-out-of-signalwire` | `/platform/phone-numbers/guides/porting-out-of-signalwire` | `/platform/phone-numbers/porting-out-of-signalwire` | matched_changed | 1.000 |
| `/platform/phone-numbers/guides/releasing-dids` | `/platform/phone-numbers/guides/releasing-dids` | `/platform/phone-numbers/releasing-dids` | matched_changed | 1.000 |
| `/platform/phone-numbers/guides/transferring-dids` | `/platform/phone-numbers/guides/transferring-dids` | `/platform/phone-numbers/transferring-dids` | matched_changed | 1.000 |
| `/sdks` | `/compatibility-api/sdks` | `/compatibility-api/reference/sdks` | matched_changed | 1.000 |
| `/sdks/agents-sdk` | `/agents-sdk` | `/agents-sdk` | matched_changed | 1.000 |
| `/sdks/agents-sdk/advanced/call-recording` | `/agents-sdk/advanced/call-recording` | `/agents-sdk/guides/call-recording` | matched_changed | 1.000 |
| `/sdks/agents-sdk/advanced/call-transfer` | `/agents-sdk/advanced/call-transfer` | `/agents-sdk/guides/call-transfer` | matched_changed | 1.000 |
| `/sdks/agents-sdk/advanced/contexts-workflows` | `/agents-sdk/advanced/contexts-workflows` | `/agents-sdk/guides/contexts-workflows` | matched_changed | 1.000 |
| `/sdks/agents-sdk/advanced/mcp-gateway` | `/agents-sdk/advanced/mcp-gateway` | `/agents-sdk/guides/mcp-gateway` | matched_changed | 1.000 |
| `/sdks/agents-sdk/advanced/multi-agent` | `/agents-sdk/advanced/multi-agent` | `/agents-sdk/guides/multi-agent` | matched_changed | 1.000 |
| `/sdks/agents-sdk/advanced/search-knowledge` | `/agents-sdk/advanced/search-knowledge` | `/agents-sdk/guides/search-knowledge` | matched_changed | 1.000 |
| `/sdks/agents-sdk/advanced/state-management` | `/agents-sdk/advanced/state-management` | `/agents-sdk/guides/state-management` | matched_changed | 1.000 |
| `/sdks/agents-sdk/api/agent-base` | `/agents-sdk/api/agent-base` | `/agents-sdk/reference/agent-base` | matched_changed | 1.000 |
| `/sdks/agents-sdk/api/cli-sw-agent-init` | `/agents-sdk/api/cli-sw-agent-init` | `/agents-sdk/reference/cli-sw-agent-init` | matched_changed | 1.000 |
| `/sdks/agents-sdk/api/cli-sw-search` | `/agents-sdk/api/cli-sw-search` | `/agents-sdk/reference/cli-sw-search` | matched_changed | 1.000 |
| `/sdks/agents-sdk/api/cli/swaig-test` | `/agents-sdk/api/cli/swaig-test` | `/agents-sdk/reference/cli-swaig-test` | matched_changed | 1.000 |
| `/sdks/agents-sdk/api/configuration` | `/agents-sdk/api/configuration` | `/agents-sdk/reference/configuration` | matched_changed | 1.000 |
| `/sdks/agents-sdk/api/contexts` | `/agents-sdk/api/contexts` | `/agents-sdk/reference/contexts` | matched_changed | 1.000 |
| `/sdks/agents-sdk/api/data-map` | `/agents-sdk/api/data-map` | `/agents-sdk/reference/data-map` | matched_changed | 1.000 |
| `/sdks/agents-sdk/api/environment-variables` | `/agents-sdk/api/environment-variables` | `/agents-sdk/reference/environment-variables` | matched_changed | 1.000 |
| `/sdks/agents-sdk/api/function-result` | `/agents-sdk/api/function-result` | `/agents-sdk/reference/function-result` | matched_changed | 1.000 |
| `/sdks/agents-sdk/api/skill-base` | `/agents-sdk/api/skill-base` | `/agents-sdk/reference/skill-base` | matched_changed | 1.000 |
| `/sdks/agents-sdk/api/swaig-function` | `/agents-sdk/api/swaig-function` | `/agents-sdk/reference/swaig-function` | matched_changed | 1.000 |
| `/sdks/agents-sdk/api/swml-schema` | `/agents-sdk/api/swml-schema` | `/agents-sdk/reference/swml-schema` | matched_changed | 1.000 |
| `/sdks/agents-sdk/api/swml-service` | `/agents-sdk/api/swml-service` | `/agents-sdk/reference/swml-service` | matched_changed | 1.000 |
| `/sdks/agents-sdk/appendix/ai-parameters-reference` | `/agents-sdk/appendix/ai-parameters-reference` | `/agents-sdk/reference/ai-parameters-reference` | matched_changed | 1.000 |
| `/sdks/agents-sdk/appendix/best-practices` | `/agents-sdk/appendix/best-practices` | `/agents-sdk/reference/best-practices` | matched_changed | 1.000 |
| `/sdks/agents-sdk/appendix/changelog` | `/agents-sdk/appendix/changelog` | `/agents-sdk/reference/changelog` | matched_changed | 1.000 |
| `/sdks/agents-sdk/appendix/migration` | `/agents-sdk/appendix/migration` | `/agents-sdk/reference/migration` | matched_changed | 1.000 |
| `/sdks/agents-sdk/appendix/patterns` | `/agents-sdk/appendix/patterns` | `/agents-sdk/reference/patterns` | matched_changed | 1.000 |
| `/sdks/agents-sdk/appendix/troubleshooting` | `/agents-sdk/appendix/troubleshooting` | `/agents-sdk/reference/troubleshooting` | matched_changed | 1.000 |
| `/sdks/agents-sdk/building-agents/agent-base` | `/agents-sdk/building-agents/agent-base` | `/agents-sdk/guides/agent-base` | matched_changed | 1.000 |
| `/sdks/agents-sdk/building-agents/ai-parameters` | `/agents-sdk/building-agents/ai-parameters` | `/agents-sdk/guides/ai-parameters` | matched_changed | 1.000 |
| `/sdks/agents-sdk/building-agents/call-flow` | `/agents-sdk/building-agents/call-flow` | `/agents-sdk/guides/call-flow` | matched_changed | 1.000 |
| `/sdks/agents-sdk/building-agents/hints` | `/agents-sdk/building-agents/hints` | `/agents-sdk/guides/hints` | matched_changed | 1.000 |
| `/sdks/agents-sdk/building-agents/prompts-pom` | `/agents-sdk/building-agents/prompts-pom` | `/agents-sdk/guides/prompts-pom` | matched_changed | 1.000 |
| `/sdks/agents-sdk/building-agents/static-vs-dynamic` | `/agents-sdk/building-agents/static-vs-dynamic` | `/agents-sdk/guides/static-vs-dynamic` | matched_changed | 1.000 |
| `/sdks/agents-sdk/building-agents/voice-language` | `/agents-sdk/building-agents/voice-language` | `/agents-sdk/guides/voice-language` | matched_changed | 1.000 |
| `/sdks/agents-sdk/core-concepts/architecture` | `/agents-sdk/core-concepts/architecture` | `/agents-sdk/guides/architecture` | matched_changed | 1.000 |
| `/sdks/agents-sdk/core-concepts/lifecycle` | `/agents-sdk/core-concepts/lifecycle` | `/agents-sdk/guides/lifecycle` | matched_changed | 1.000 |
| `/sdks/agents-sdk/core-concepts/security` | `/agents-sdk/core-concepts/security` | `/agents-sdk/guides/security` | matched_changed | 1.000 |
| `/sdks/agents-sdk/core-concepts/swaig` | `/agents-sdk/core-concepts/swaig` | `/agents-sdk/guides/swaig` | matched_changed | 1.000 |
| `/sdks/agents-sdk/core-concepts/swml` | `/agents-sdk/core-concepts/swml` | `/agents-sdk/guides/swml` | matched_changed | 1.000 |
| `/sdks/agents-sdk/deployment/cgi-mode` | `/agents-sdk/deployment/cgi-mode` | `/agents-sdk/guides/cgi-mode` | matched_changed | 1.000 |
| `/sdks/agents-sdk/deployment/docker-kubernetes` | `/agents-sdk/deployment/docker-kubernetes` | `/agents-sdk/guides/docker-kubernetes` | matched_changed | 1.000 |
| `/sdks/agents-sdk/deployment/local-development` | `/agents-sdk/deployment/local-development` | `/agents-sdk/guides/local-development` | matched_changed | 1.000 |
| `/sdks/agents-sdk/deployment/production` | `/agents-sdk/deployment/production` | `/agents-sdk/guides/production` | matched_changed | 1.000 |
| `/sdks/agents-sdk/deployment/serverless` | `/agents-sdk/deployment/serverless` | `/agents-sdk/guides/serverless` | matched_changed | 1.000 |
| `/sdks/agents-sdk/dev-environment` | `/agents-sdk/dev-environment` | `/agents-sdk/guides/dev-environment` | matched_changed | 1.000 |
| `/sdks/agents-sdk/examples/by-complexity` | `/agents-sdk/examples/by-complexity` | `/agents-sdk/guides/by-complexity` | matched_changed | 1.000 |
| `/sdks/agents-sdk/examples/by-feature` | `/agents-sdk/examples/by-feature` | `/agents-sdk/guides/by-feature` | matched_changed | 1.000 |
| `/sdks/agents-sdk/exposing-agents` | `/agents-sdk/exposing-agents` | `/agents-sdk/guides/exposing-agents` | matched_changed | 1.000 |
| `/sdks/agents-sdk/installation` | `/agents-sdk/installation` | `/agents-sdk/guides/installation` | matched_changed | 1.000 |
| `/sdks/agents-sdk/prefabs/concierge` | `/agents-sdk/prefabs/concierge` | `/agents-sdk/guides/concierge` | matched_changed | 1.000 |
| `/sdks/agents-sdk/prefabs/faq-bot` | `/agents-sdk/prefabs/faq-bot` | `/agents-sdk/guides/faq-bot` | matched_changed | 1.000 |
| `/sdks/agents-sdk/prefabs/info-gatherer` | `/agents-sdk/prefabs/info-gatherer` | `/agents-sdk/guides/info-gatherer` | matched_changed | 1.000 |
| `/sdks/agents-sdk/prefabs/receptionist` | `/agents-sdk/prefabs/receptionist` | `/agents-sdk/guides/receptionist` | matched_changed | 1.000 |
| `/sdks/agents-sdk/prefabs/survey` | `/agents-sdk/prefabs/survey` | `/agents-sdk/guides/survey` | matched_changed | 1.000 |
| `/sdks/agents-sdk/quickstart` | `/agents-sdk/quickstart` | `/agents-sdk/guides/quickstart` | matched_changed | 1.000 |
| `/sdks/agents-sdk/signalwire-integration/account-setup` | `/agents-sdk/signalwire-integration/account-setup` | `/agents-sdk/guides/account-setup` | matched_changed | 1.000 |
| `/sdks/agents-sdk/signalwire-integration/mapping-numbers` | `/agents-sdk/signalwire-integration/mapping-numbers` | `/agents-sdk/guides/mapping-numbers` | matched_changed | 1.000 |
| `/sdks/agents-sdk/signalwire-integration/phone-numbers` | `/agents-sdk/signalwire-integration/phone-numbers` | `/agents-sdk/guides/phone-numbers` | matched_changed | 1.000 |
| `/sdks/agents-sdk/signalwire-integration/testing` | `/agents-sdk/signalwire-integration/testing` | `/agents-sdk/guides/testing` | matched_changed | 1.000 |
| `/sdks/agents-sdk/signalwire-integration/troubleshooting` | `/agents-sdk/signalwire-integration/troubleshooting` | `/agents-sdk/guides/troubleshooting` | matched_changed | 1.000 |
| `/sdks/agents-sdk/skills/adding-skills` | `/agents-sdk/skills/adding-skills` | `/agents-sdk/guides/adding-skills` | matched_changed | 1.000 |
| `/sdks/agents-sdk/skills/builtin-skills` | `/agents-sdk/skills/builtin-skills` | `/agents-sdk/guides/builtin-skills` | matched_changed | 1.000 |
| `/sdks/agents-sdk/skills/custom` | `/agents-sdk/skills/custom` | `/agents-sdk/guides/custom` | matched_changed | 1.000 |
| `/sdks/agents-sdk/skills/skill-config` | `/agents-sdk/skills/skill-config` | `/agents-sdk/guides/skill-config` | matched_changed | 1.000 |
| `/sdks/agents-sdk/skills/understanding-skills` | `/agents-sdk/skills/understanding-skills` | `/agents-sdk/guides/understanding-skills` | matched_changed | 1.000 |
| `/sdks/agents-sdk/swaig-functions/datamap` | `/agents-sdk/swaig-functions/datamap` | `/agents-sdk/guides/datamap` | matched_changed | 1.000 |
| `/sdks/agents-sdk/swaig-functions/defining-functions` | `/agents-sdk/swaig-functions/defining-functions` | `/agents-sdk/guides/defining-functions` | matched_changed | 1.000 |
| `/sdks/agents-sdk/swaig-functions/native-functions` | `/agents-sdk/swaig-functions/native-functions` | `/agents-sdk/guides/native-functions` | matched_changed | 1.000 |
| `/sdks/agents-sdk/swaig-functions/parameters` | `/agents-sdk/swaig-functions/parameters` | `/agents-sdk/guides/parameters` | matched_changed | 1.000 |
| `/sdks/agents-sdk/swaig-functions/results-actions` | `/agents-sdk/swaig-functions/results-actions` | `/agents-sdk/guides/results-actions` | matched_changed | 1.000 |
| `/sdks/browser-sdk/chat` | `/browser-sdk/reference/chat` | `/browser-sdk/reference/chat` | slug_changed | 0.951 |
| `/sdks/browser-sdk/chat/member` | `/browser-sdk/reference/chat/chat-chatmember` | `/browser-sdk/reference/chat/chat-chatmember` | slug_changed | 0.900 |
| `/sdks/browser-sdk/chat/message` | `/browser-sdk/reference/chat/chat-chatmessage` | `/browser-sdk/reference/chat/chat-chatmessage` | slug_changed | 0.845 |
| `/sdks/browser-sdk/guides` | `/browser-sdk/guides` | `/browser-sdk/guides` | matched_changed | 1.000 |
| `/sdks/browser-sdk/guides/video/get-thumbnails-for-your-video-calls` | `/browser-sdk/guides/video/get-thumbnails-for-your-video-calls` | `/browser-sdk/guides/get-thumbnails-for-your-video-calls` | matched_changed | 1.000 |
| `/sdks/browser-sdk/guides/video/highlighting-whos-speaking` | `/browser-sdk/guides/video/highlighting-whos-speaking` | `/browser-sdk/guides/highlighting-whos-speaking` | matched_changed | 1.000 |
| `/sdks/browser-sdk/guides/video/interactive-live-streaming` | `/browser-sdk/guides/video/interactive-live-streaming` | `/browser-sdk/guides/interactive-live-streaming` | matched_changed | 1.000 |
| `/sdks/browser-sdk/guides/video/recording-video` | `/browser-sdk/guides/video/recording-video` | `/browser-sdk/guides/recording-video` | matched_changed | 1.000 |
| `/sdks/browser-sdk/guides/video/sharing-your-screen` | `/browser-sdk/guides/video/sharing-your-screen-with-the-signalwire-video-sdk` | `/browser-sdk/guides/sharing-your-screen-with-the-signalwire-video-sdk` | slug_changed | 0.775 |
| `/sdks/browser-sdk/guides/video/streaming-to-youtube-and-other-platforms` | `/browser-sdk/guides/video/streaming-to-youtube-and-other-platforms` | `/browser-sdk/guides/streaming-to-youtube-and-other-platforms` | matched_changed | 1.000 |
| `/sdks/browser-sdk/guides/video/switch-webcam-or-microphone` | `/browser-sdk/guides/video/switch-webcam-or-microphone-with-signalwire-video-api` | `/browser-sdk/guides/switch-webcam-or-microphone-with-signalwire-video-api` | slug_changed | 0.900 |
| `/sdks/browser-sdk/guides/video/video-overlays` | `/browser-sdk/guides/video/video-overlays` | `/browser-sdk/guides/video-overlays` | matched_changed | 1.000 |
| `/sdks/browser-sdk/pubsub` | `/browser-sdk/reference/pubsub` | `/browser-sdk/reference/pubsub` | slug_changed | 0.962 |
| `/sdks/browser-sdk/pubsub/message` | `/browser-sdk/pubsub/message` | `/browser-sdk/reference/pubsub/message` | matched_changed | 1.000 |
| `/sdks/browser-sdk/signalwire-client` | `/browser-sdk/reference/signalwire-client` | `/browser-sdk/reference/signalwire-client` | slug_changed | 0.951 |
| `/sdks/browser-sdk/signalwire-client/client` | `/browser-sdk/reference/signalwire-client/client` | `/browser-sdk/reference/signalwire-client/client` | slug_changed | 0.987 |
| `/sdks/browser-sdk/signalwire-client/client/address` | `/browser-sdk/reference/signalwire-client/client/address` | `/browser-sdk/reference/signalwire-client/client/address` | slug_changed | 1.000 |
| `/sdks/browser-sdk/signalwire-client/client/chat` | `/browser-sdk/reference/signalwire-client/client/chat` | `/browser-sdk/reference/signalwire-client/client/chat` | slug_changed | 0.999 |
| `/sdks/browser-sdk/signalwire-client/client/conversation` | `/browser-sdk/reference/signalwire-client/client/conversation` | `/browser-sdk/reference/signalwire-client/client/conversation` | slug_changed | 1.000 |
| `/sdks/browser-sdk/signalwire-client/notifications` | `/browser-sdk/reference/signalwire-client/notifications` | `/browser-sdk/reference/signalwire-client/notifications` | slug_changed | 1.000 |
| `/sdks/browser-sdk/signalwire-client/utils` | `/browser-sdk/reference/signalwire-client/utils` | `/browser-sdk/reference/signalwire-client/utils` | slug_changed | 0.996 |
| `/sdks/browser-sdk/technical-reference` | `/browser-sdk/reference` | `/browser-sdk/reference` | slug_changed | 0.729 |
| `/sdks/browser-sdk/v2` | `/browser-sdk/v2` | `/browser-sdk/v2` | matched_changed | 1.000 |
| `/sdks/browser-sdk/v2/call` | `/browser-sdk/v2/reference/call` | `/browser-sdk/v2/reference/call` | slug_changed | 1.000 |
| `/sdks/browser-sdk/v2/client` | `/browser-sdk/v2/reference/relay-client` | `/browser-sdk/v2/reference/relay-client` | slug_changed | 0.900 |
| `/sdks/browser-sdk/v2/guides/v2-vs-v3` | `/browser-sdk/v2/reference/v2-vs-v3` | `/browser-sdk/v2/reference/v2-vs-v3` | slug_changed | 0.999 |
| `/sdks/browser-sdk/v2/notification` | `/browser-sdk/v2/reference/notification` | `/browser-sdk/v2/reference/notification` | slug_changed | 1.000 |
| `/sdks/browser-sdk/video/local-overlay` | `/browser-sdk/video/local-overlay` | `/browser-sdk/reference/video/local-overlay` | matched_changed | 1.000 |
| `/sdks/browser-sdk/video/room-device` | `/browser-sdk/video/room-device` | `/browser-sdk/reference/video/room-device` | matched_changed | 1.000 |
| `/sdks/browser-sdk/video/room-screenshare` | `/browser-sdk/video/room-screenshare` | `/browser-sdk/reference/video/room-screenshare` | matched_changed | 1.000 |
| `/sdks/browser-sdk/video/room-session-device` | `/browser-sdk/video/room-session-device` | `/browser-sdk/reference/video/room-session-device` | matched_changed | 1.000 |
| `/sdks/browser-sdk/video/room-session-playback` | `/browser-sdk/video/room-session-playback` | `/browser-sdk/reference/video/room-session-playback` | matched_changed | 1.000 |
| `/sdks/browser-sdk/video/room-session-recording` | `/browser-sdk/video/room-session-recording` | `/browser-sdk/reference/video/room-session-recording` | matched_changed | 1.000 |
| `/sdks/browser-sdk/video/room-session-screenshare` | `/browser-sdk/video/room-session-screenshare` | `/browser-sdk/reference/video/room-session-screenshare` | matched_changed | 1.000 |
| `/sdks/browser-sdk/webrtc` | `/browser-sdk/reference/webrtc` | `/browser-sdk/reference/webrtc` | slug_changed | 0.891 |
| `/sdks/realtime-sdk` | `/realtime-sdk` | `/realtime-sdk` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/chat` | `/realtime-sdk/reference/chat` | `/realtime-sdk/reference/chat` | slug_changed | 0.805 |
| `/sdks/realtime-sdk/chat/chat-member` | `/realtime-sdk/reference/chat/chatmember` | `/realtime-sdk/reference/chat/chatmember` | slug_changed | 0.937 |
| `/sdks/realtime-sdk/chat/chat-message` | `/realtime-sdk/reference/chat/chatmessage` | `/realtime-sdk/reference/chat/chatmessage` | slug_changed | 0.925 |
| `/sdks/realtime-sdk/chat/client` | `/realtime-sdk/reference/chat/client` | `/realtime-sdk/reference/chat-client [COLLISION]` | slug_changed | 0.788 |
| `/sdks/realtime-sdk/guides` | `/realtime-sdk/guides` | `/realtime-sdk/guides` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/guides/messaging/first-steps-with-messaging` | `/realtime-sdk/guides/messaging/first-steps-with-messaging` | `/realtime-sdk/guides/first-steps-with-messaging` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/guides/messaging/forwarding-texts-to-email` | `/realtime-sdk/guides/messaging/forwarding-texts-to-email-nodejs` | `/realtime-sdk/guides/forwarding-texts-to-email-nodejs` | slug_changed | 0.881 |
| `/sdks/realtime-sdk/guides/messaging/send-sms-from-the-browser` | `/realtime-sdk/guides/messaging/send-sms-from-the-browser-using-node-js` | `/realtime-sdk/guides/send-sms-from-the-browser-using-node-js` | slug_changed | 0.887 |
| `/sdks/realtime-sdk/guides/voice/first-steps-with-voice` | `/realtime-sdk/guides/voice/first-steps-with-voice` | `/realtime-sdk/guides/first-steps-with-voice` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/guides/voice/setting-up-voicemail` | `/realtime-sdk/guides/voice/setting-up-voicemail` | `/realtime-sdk/guides/setting-up-voicemail` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/guides/voice/stop-robocalls` | `/realtime-sdk/guides/voice/stop-robocalls-with-signalwires-communication-api` | `/realtime-sdk/guides/stop-robocalls-with-signalwires-communication-api` | slug_changed | 0.896 |
| `/sdks/realtime-sdk/guides/voice/weather-phone` | `/realtime-sdk/guides/voice/weather-phone-with-signalwire-realtime-api` | `/realtime-sdk/guides/weather-phone-with-signalwire-realtime-api` | slug_changed | 0.898 |
| `/sdks/realtime-sdk/messaging` | `/realtime-sdk/reference/messaging` | `/realtime-sdk/reference/messaging` | slug_changed | 0.792 |
| `/sdks/realtime-sdk/messaging/client` | `/realtime-sdk/reference/messaging/client` | `/realtime-sdk/reference/messaging-client [COLLISION]` | slug_changed | 0.856 |
| `/sdks/realtime-sdk/messaging/message-contract` | `/realtime-sdk/reference/messaging/messagecontract` | `/realtime-sdk/reference/messaging/messagecontract` | slug_changed | 0.908 |
| `/sdks/realtime-sdk/messaging/messaging-sendresult` | `/realtime-sdk/reference/messaging/messagingsendresult` | `/realtime-sdk/reference/messaging/messagingsendresult` | slug_changed | 0.901 |
| `/sdks/realtime-sdk/pubsub` | `/realtime-sdk/reference/pubsub` | `/realtime-sdk/reference/pubsub` | slug_changed | 0.786 |
| `/sdks/realtime-sdk/pubsub/client` | `/realtime-sdk/reference/pubsub/client` | `/realtime-sdk/reference/pubsub-client [COLLISION]` | slug_changed | 0.790 |
| `/sdks/realtime-sdk/pubsub/pubsubmessage` | `/realtime-sdk/reference/pubsub/pubsubmessage` | `/realtime-sdk/reference/pubsub/pubsubmessage` | slug_changed | 0.828 |
| `/sdks/realtime-sdk/task` | `/realtime-sdk/reference/task` | `/realtime-sdk/reference/task` | slug_changed | 0.862 |
| `/sdks/realtime-sdk/task/client` | `/realtime-sdk/reference/task/client` | `/realtime-sdk/reference/task-client [COLLISION]` | slug_changed | 0.768 |
| `/sdks/realtime-sdk/v2/guides` | `/realtime-sdk/v2/guides` | `/realtime-sdk/v2/guides` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/guides/v2-vs-v3` | `/realtime-sdk/v2/guides/v2-vs-v3` | `/realtime-sdk/v2/guides/v2-vs-v3` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/guides/voice/stop-robocalls` | `/realtime-sdk/v2/guides/stop-robocalls` | `/realtime-sdk/v2/guides/stop-robocalls` | slug_changed | 0.897 |
| `/sdks/realtime-sdk/v2/language/dotnet` | `/realtime-sdk/v2/reference/dotnet` | `/realtime-sdk/v2/reference/dotnet` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/dotnet/calling` | `/realtime-sdk/v2/reference/dotnet/calling` | `/realtime-sdk/v2/reference/dotnet/calling` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/dotnet/calling/actions` | `/realtime-sdk/v2/reference/dotnet/calling/actions` | `/realtime-sdk/v2/reference/dotnet/calling/actions` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/dotnet/calling/actions/connect` | `/realtime-sdk/v2/reference/dotnet/calling/actions/connect` | `/realtime-sdk/v2/reference/dotnet/calling/actions/connect` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/dotnet/calling/actions/detect` | `/realtime-sdk/v2/reference/dotnet/calling/actions/detect` | `/realtime-sdk/v2/reference/dotnet/calling/actions/detect` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/dotnet/calling/actions/fax` | `/realtime-sdk/v2/reference/dotnet/calling/actions/fax` | `/realtime-sdk/v2/reference/dotnet/calling/actions/fax` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/dotnet/calling/actions/play` | `/realtime-sdk/v2/reference/dotnet/calling/actions/play` | `/realtime-sdk/v2/reference/dotnet/calling/actions/play` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/dotnet/calling/actions/prompt` | `/realtime-sdk/v2/reference/dotnet/calling/actions/prompt` | `/realtime-sdk/v2/reference/dotnet/calling/actions/prompt` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/dotnet/calling/actions/record` | `/realtime-sdk/v2/reference/dotnet/calling/actions/record` | `/realtime-sdk/v2/reference/dotnet/calling/actions/record` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/dotnet/calling/actions/send-digits` | `/realtime-sdk/v2/reference/dotnet/calling/actions/send-digits` | `/realtime-sdk/v2/reference/dotnet/calling/actions/send-digits` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/dotnet/calling/actions/tap` | `/realtime-sdk/v2/reference/dotnet/calling/actions/tap` | `/realtime-sdk/v2/reference/dotnet/calling/actions/tap` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/dotnet/calling/call` | `/realtime-sdk/v2/reference/dotnet/calling/call` | `/realtime-sdk/v2/reference/dotnet/calling/call` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/dotnet/calling/call-collect` | `/realtime-sdk/v2/reference/dotnet/calling/call-collect` | `/realtime-sdk/v2/reference/dotnet/calling/call-collect` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/dotnet/calling/call-collect-digits-params` | `/realtime-sdk/v2/reference/dotnet/calling/call-collect-digits-params` | `/realtime-sdk/v2/reference/dotnet/calling/call-collect-digits-params` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/dotnet/calling/call-collect-speech-params` | `/realtime-sdk/v2/reference/dotnet/calling/call-collect-speech-params` | `/realtime-sdk/v2/reference/dotnet/calling/call-collect-speech-params` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/dotnet/calling/call-collect-type` | `/realtime-sdk/v2/reference/dotnet/calling/call-collect-type` | `/realtime-sdk/v2/reference/dotnet/calling/call-collect-type` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/dotnet/calling/call-connect-state` | `/realtime-sdk/v2/reference/dotnet/calling/call-connect-state` | `/realtime-sdk/v2/reference/dotnet/calling/call-connect-state` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/dotnet/calling/call-detect` | `/realtime-sdk/v2/reference/dotnet/calling/call-detect` | `/realtime-sdk/v2/reference/dotnet/calling/call-detect` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/dotnet/calling/call-detect-digit-params` | `/realtime-sdk/v2/reference/dotnet/calling/call-detect-digit-params` | `/realtime-sdk/v2/reference/dotnet/calling/call-detect-digit-params` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/dotnet/calling/call-detect-fax-params` | `/realtime-sdk/v2/reference/dotnet/calling/call-detect-fax-params` | `/realtime-sdk/v2/reference/dotnet/calling/call-detect-fax-params` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/dotnet/calling/call-detect-fax-tone` | `/realtime-sdk/v2/reference/dotnet/calling/call-detect-fax-tone` | `/realtime-sdk/v2/reference/dotnet/calling/call-detect-fax-tone` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/dotnet/calling/call-detect-machine-params` | `/realtime-sdk/v2/reference/dotnet/calling/call-detect-machine-params` | `/realtime-sdk/v2/reference/dotnet/calling/call-detect-machine-params` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/dotnet/calling/call-detect-type` | `/realtime-sdk/v2/reference/dotnet/calling/call-detect-type` | `/realtime-sdk/v2/reference/dotnet/calling/call-detect-type` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/dotnet/calling/call-device` | `/realtime-sdk/v2/reference/dotnet/calling/call-device` | `/realtime-sdk/v2/reference/dotnet/calling/call-device` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/dotnet/calling/call-device-phone-params` | `/realtime-sdk/v2/reference/dotnet/calling/call-device-phone-params` | `/realtime-sdk/v2/reference/dotnet/calling/call-device-phone-params` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/dotnet/calling/call-device-type` | `/realtime-sdk/v2/reference/dotnet/calling/call-device-type` | `/realtime-sdk/v2/reference/dotnet/calling/call-device-type` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/dotnet/calling/call-media` | `/realtime-sdk/v2/reference/dotnet/calling/call-media` | `/realtime-sdk/v2/reference/dotnet/calling/call-media` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/dotnet/calling/call-media-audio-params` | `/realtime-sdk/v2/reference/dotnet/calling/call-media-audio-params` | `/realtime-sdk/v2/reference/dotnet/calling/call-media-audio-params` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/dotnet/calling/call-media-ringtone-params` | `/realtime-sdk/v2/reference/dotnet/calling/call-media-ringtone-params` | `/realtime-sdk/v2/reference/dotnet/calling/call-media-ringtone-params` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/dotnet/calling/call-media-silence-params` | `/realtime-sdk/v2/reference/dotnet/calling/call-media-silence-params` | `/realtime-sdk/v2/reference/dotnet/calling/call-media-silence-params` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/dotnet/calling/call-media-tts-params` | `/realtime-sdk/v2/reference/dotnet/calling/call-media-tts-params` | `/realtime-sdk/v2/reference/dotnet/calling/call-media-tts-params` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/dotnet/calling/call-media-type` | `/realtime-sdk/v2/reference/dotnet/calling/call-media-type` | `/realtime-sdk/v2/reference/dotnet/calling/call-media-type` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/dotnet/calling/call-play-state` | `/realtime-sdk/v2/reference/dotnet/calling/call-play-state` | `/realtime-sdk/v2/reference/dotnet/calling/call-play-state` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/dotnet/calling/call-record` | `/realtime-sdk/v2/reference/dotnet/calling/call-record` | `/realtime-sdk/v2/reference/dotnet/calling/call-record` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/dotnet/calling/call-record-audio-direction` | `/realtime-sdk/v2/reference/dotnet/calling/call-record-audio-direction` | `/realtime-sdk/v2/reference/dotnet/calling/call-record-audio-direction` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/dotnet/calling/call-record-audio-format` | `/realtime-sdk/v2/reference/dotnet/calling/call-record-audio-format` | `/realtime-sdk/v2/reference/dotnet/calling/call-record-audio-format` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/dotnet/calling/call-record-audio-params` | `/realtime-sdk/v2/reference/dotnet/calling/call-record-audio-params` | `/realtime-sdk/v2/reference/dotnet/calling/call-record-audio-params` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/dotnet/calling/call-record-state` | `/realtime-sdk/v2/reference/dotnet/calling/call-record-state` | `/realtime-sdk/v2/reference/dotnet/calling/call-record-state` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/dotnet/calling/call-ringback` | `/realtime-sdk/v2/reference/dotnet/calling/call-ringback` | `/realtime-sdk/v2/reference/dotnet/calling/call-ringback` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/dotnet/calling/call-ringback-audio-params` | `/realtime-sdk/v2/reference/dotnet/calling/call-ringback-audio-params` | `/realtime-sdk/v2/reference/dotnet/calling/call-ringback-audio-params` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/dotnet/calling/call-ringback-ringtone-params` | `/realtime-sdk/v2/reference/dotnet/calling/call-ringback-ringtone-params` | `/realtime-sdk/v2/reference/dotnet/calling/call-ringback-ringtone-params` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/dotnet/calling/call-ringback-silence-params` | `/realtime-sdk/v2/reference/dotnet/calling/call-ringback-silence-params` | `/realtime-sdk/v2/reference/dotnet/calling/call-ringback-silence-params` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/dotnet/calling/call-ringback-tts-params` | `/realtime-sdk/v2/reference/dotnet/calling/call-ringback-tts-params` | `/realtime-sdk/v2/reference/dotnet/calling/call-ringback-tts-params` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/dotnet/calling/call-ringback-type` | `/realtime-sdk/v2/reference/dotnet/calling/call-ringback-type` | `/realtime-sdk/v2/reference/dotnet/calling/call-ringback-type` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/dotnet/calling/call-send-digits-state` | `/realtime-sdk/v2/reference/dotnet/calling/call-send-digits-state` | `/realtime-sdk/v2/reference/dotnet/calling/call-send-digits-state` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/dotnet/calling/call-state` | `/realtime-sdk/v2/reference/dotnet/calling/call-state` | `/realtime-sdk/v2/reference/dotnet/calling/call-state` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/dotnet/calling/call-tap` | `/realtime-sdk/v2/reference/dotnet/calling/call-tap` | `/realtime-sdk/v2/reference/dotnet/calling/call-tap` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/dotnet/calling/call-tap-audio-direction` | `/realtime-sdk/v2/reference/dotnet/calling/call-tap-audio-direction` | `/realtime-sdk/v2/reference/dotnet/calling/call-tap-audio-direction` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/dotnet/calling/call-tap-audio-params` | `/realtime-sdk/v2/reference/dotnet/calling/call-tap-audio-params` | `/realtime-sdk/v2/reference/dotnet/calling/call-tap-audio-params` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/dotnet/calling/call-tap-device` | `/realtime-sdk/v2/reference/dotnet/calling/call-tap-device` | `/realtime-sdk/v2/reference/dotnet/calling/call-tap-device` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/dotnet/calling/call-tap-device-rtp-params` | `/realtime-sdk/v2/reference/dotnet/calling/call-tap-device-rtp-params` | `/realtime-sdk/v2/reference/dotnet/calling/call-tap-device-rtp-params` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/dotnet/calling/call-tap-device-type` | `/realtime-sdk/v2/reference/dotnet/calling/call-tap-device-type` | `/realtime-sdk/v2/reference/dotnet/calling/call-tap-device-type` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/dotnet/calling/call-tap-state` | `/realtime-sdk/v2/reference/dotnet/calling/call-tap-state` | `/realtime-sdk/v2/reference/dotnet/calling/call-tap-state` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/dotnet/calling/call-tap-type` | `/realtime-sdk/v2/reference/dotnet/calling/call-tap-type` | `/realtime-sdk/v2/reference/dotnet/calling/call-tap-type` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/dotnet/calling/detect-result-type` | `/realtime-sdk/v2/reference/dotnet/calling/detect-result-type` | `/realtime-sdk/v2/reference/dotnet/calling/detect-result-type` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/dotnet/calling/direction` | `/realtime-sdk/v2/reference/dotnet/calling/direction` | `/realtime-sdk/v2/reference/dotnet/calling/direction` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/dotnet/calling/disconnect-reason` | `/realtime-sdk/v2/reference/dotnet/calling/disconnect-reason` | `/realtime-sdk/v2/reference/dotnet/calling/disconnect-reason` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/dotnet/calling/phonecall` | `/realtime-sdk/v2/reference/dotnet/calling/phonecall` | `/realtime-sdk/v2/reference/dotnet/calling/phonecall` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/dotnet/calling/results` | `/realtime-sdk/v2/reference/dotnet/calling/results` | `/realtime-sdk/v2/reference/dotnet/calling/results` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/dotnet/calling/results/answer-result` | `/realtime-sdk/v2/reference/dotnet/calling/results/answer` | `/realtime-sdk/v2/reference/dotnet/calling/results/answer` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/dotnet/calling/results/connect-result` | `/realtime-sdk/v2/reference/dotnet/calling/results/connect` | `/realtime-sdk/v2/reference/dotnet/calling/results/connect` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/dotnet/calling/results/detect-result` | `/realtime-sdk/v2/reference/dotnet/calling/results/detect` | `/realtime-sdk/v2/reference/dotnet/calling/results/detect` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/dotnet/calling/results/dial-result` | `/realtime-sdk/v2/reference/dotnet/calling/results/dial` | `/realtime-sdk/v2/reference/dotnet/calling/results/dial` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/dotnet/calling/results/fax-result` | `/realtime-sdk/v2/reference/dotnet/calling/results/fax` | `/realtime-sdk/v2/reference/dotnet/calling/results/fax` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/dotnet/calling/results/hangup-result` | `/realtime-sdk/v2/reference/dotnet/calling/results/hangup` | `/realtime-sdk/v2/reference/dotnet/calling/results/hangup` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/dotnet/calling/results/play-pause-result` | `/realtime-sdk/v2/reference/dotnet/calling/results/play-pause` | `/realtime-sdk/v2/reference/dotnet/calling/results/play-pause` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/dotnet/calling/results/play-result` | `/realtime-sdk/v2/reference/dotnet/calling/results/play` | `/realtime-sdk/v2/reference/dotnet/calling/results/play` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/dotnet/calling/results/play-resume-result` | `/realtime-sdk/v2/reference/dotnet/calling/results/play-resume` | `/realtime-sdk/v2/reference/dotnet/calling/results/play-resume` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/dotnet/calling/results/play-volume-result` | `/realtime-sdk/v2/reference/dotnet/calling/results/play-volume` | `/realtime-sdk/v2/reference/dotnet/calling/results/play-volume` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/dotnet/calling/results/prompt-result` | `/realtime-sdk/v2/reference/dotnet/calling/results/prompt` | `/realtime-sdk/v2/reference/dotnet/calling/results/prompt` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/dotnet/calling/results/prompt-volume-result` | `/realtime-sdk/v2/reference/dotnet/calling/results/prompt-volume` | `/realtime-sdk/v2/reference/dotnet/calling/results/prompt-volume` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/dotnet/calling/results/record-result` | `/realtime-sdk/v2/reference/dotnet/calling/results/record` | `/realtime-sdk/v2/reference/dotnet/calling/results/record` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/dotnet/calling/results/send-digits-result` | `/realtime-sdk/v2/reference/dotnet/calling/results/send-digits` | `/realtime-sdk/v2/reference/dotnet/calling/results/send-digits` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/dotnet/calling/results/stop-result` | `/realtime-sdk/v2/reference/dotnet/calling/results/stop` | `/realtime-sdk/v2/reference/dotnet/calling/results/stop` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/dotnet/calling/results/tap-result` | `/realtime-sdk/v2/reference/dotnet/calling/results/tap` | `/realtime-sdk/v2/reference/dotnet/calling/results/tap` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/dotnet/calling/send-fax-payload` | `/realtime-sdk/v2/reference/dotnet/calling/send-fax-payload` | `/realtime-sdk/v2/reference/dotnet/calling/send-fax-payload` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/dotnet/consumer` | `/realtime-sdk/v2/reference/dotnet/consumer` | `/realtime-sdk/v2/reference/dotnet/consumer` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/dotnet/event` | `/realtime-sdk/v2/reference/dotnet/event` | `/realtime-sdk/v2/reference/dotnet/event` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/dotnet/examples` | `/realtime-sdk/v2/reference/dotnet/examples` | `/realtime-sdk/v2/reference/dotnet/examples` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/dotnet/messaging` | `/realtime-sdk/v2/reference/dotnet/messaging` | `/realtime-sdk/v2/reference/dotnet/messaging` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/dotnet/messaging/direction` | `/realtime-sdk/v2/reference/dotnet/messaging/direction` | `/realtime-sdk/v2/reference/dotnet/messaging/direction` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/dotnet/messaging/message` | `/realtime-sdk/v2/reference/dotnet/messaging/message` | `/realtime-sdk/v2/reference/dotnet/messaging/message` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/dotnet/messaging/message-state` | `/realtime-sdk/v2/reference/dotnet/messaging/message-state` | `/realtime-sdk/v2/reference/dotnet/messaging/message-state` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/dotnet/messaging/send-result` | `/realtime-sdk/v2/reference/dotnet/messaging/send-result` | `/realtime-sdk/v2/reference/dotnet/messaging/send-result` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/dotnet/messaging/send-source` | `/realtime-sdk/v2/reference/dotnet/messaging/send-source` | `/realtime-sdk/v2/reference/dotnet/messaging/send-source` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/dotnet/relay-client` | `/realtime-sdk/v2/reference/dotnet/relay-client` | `/realtime-sdk/v2/reference/dotnet/relay-client` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/dotnet/task` | `/realtime-sdk/v2/reference/dotnet/task` | `/realtime-sdk/v2/reference/dotnet/task` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/golang` | `/realtime-sdk/v2/reference/go` | `/realtime-sdk/v2/reference/go` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/golang/calling` | `/realtime-sdk/v2/reference/go/calling` | `/realtime-sdk/v2/reference/go/calling` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/golang/calling/actions` | `/realtime-sdk/v2/reference/go/calling/actions` | `/realtime-sdk/v2/reference/go/calling/actions` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/golang/calling/actions/detect` | `/realtime-sdk/v2/reference/go/calling/actions/detect` | `/realtime-sdk/v2/reference/go/calling/actions/detect` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/golang/calling/actions/fax` | `/realtime-sdk/v2/reference/go/calling/actions/fax` | `/realtime-sdk/v2/reference/go/calling/actions/fax` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/golang/calling/actions/play` | `/realtime-sdk/v2/reference/go/calling/actions/play` | `/realtime-sdk/v2/reference/go/calling/actions/play` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/golang/calling/actions/play-audio` | `/realtime-sdk/v2/reference/go/calling/actions/play-audio` | `/realtime-sdk/v2/reference/go/calling/actions/play-audio` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/golang/calling/actions/play-media` | `/realtime-sdk/v2/reference/go/calling/actions/play-media` | `/realtime-sdk/v2/reference/go/calling/actions/play-media` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/golang/calling/actions/play-silence` | `/realtime-sdk/v2/reference/go/calling/actions/play-silence` | `/realtime-sdk/v2/reference/go/calling/actions/play-silence` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/golang/calling/actions/play-tts` | `/realtime-sdk/v2/reference/go/calling/actions/play-tts` | `/realtime-sdk/v2/reference/go/calling/actions/play-tts` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/golang/calling/actions/prompt` | `/realtime-sdk/v2/reference/go/calling/actions/prompt` | `/realtime-sdk/v2/reference/go/calling/actions/prompt` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/golang/calling/actions/record` | `/realtime-sdk/v2/reference/go/calling/actions/record` | `/realtime-sdk/v2/reference/go/calling/actions/record` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/golang/calling/actions/send-digits` | `/realtime-sdk/v2/reference/go/calling/actions/send-digits` | `/realtime-sdk/v2/reference/go/calling/actions/send-digits` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/golang/calling/actions/tap` | `/realtime-sdk/v2/reference/go/calling/actions/tap` | `/realtime-sdk/v2/reference/go/calling/actions/tap` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/golang/calling/call` | `/realtime-sdk/v2/reference/go/calling/call` | `/realtime-sdk/v2/reference/go/calling/call` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/golang/calling/results` | `/realtime-sdk/v2/reference/go/calling/results` | `/realtime-sdk/v2/reference/go/calling/results` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/golang/calling/results/answer-result` | `/realtime-sdk/v2/reference/go/calling/results/answer` | `/realtime-sdk/v2/reference/go/calling/results/answer` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/golang/calling/results/detect-result` | `/realtime-sdk/v2/reference/go/calling/results/detect` | `/realtime-sdk/v2/reference/go/calling/results/detect` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/golang/calling/results/dial-result` | `/realtime-sdk/v2/reference/go/calling/results/dial` | `/realtime-sdk/v2/reference/go/calling/results/dial` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/golang/calling/results/fax-result` | `/realtime-sdk/v2/reference/go/calling/results/fax` | `/realtime-sdk/v2/reference/go/calling/results/fax` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/golang/calling/results/hangup-result` | `/realtime-sdk/v2/reference/go/calling/results/hangup` | `/realtime-sdk/v2/reference/go/calling/results/hangup` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/golang/calling/results/play-result` | `/realtime-sdk/v2/reference/go/calling/results/play` | `/realtime-sdk/v2/reference/go/calling/results/play` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/golang/calling/results/play-resume-result` | `/realtime-sdk/v2/reference/go/calling/results/play-resume` | `/realtime-sdk/v2/reference/go/calling/results/play-resume` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/golang/calling/results/play-volume-result` | `/realtime-sdk/v2/reference/go/calling/results/play-volume` | `/realtime-sdk/v2/reference/go/calling/results/play-volume` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/golang/calling/results/prompt-result` | `/realtime-sdk/v2/reference/go/calling/results/prompt` | `/realtime-sdk/v2/reference/go/calling/results/prompt` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/golang/calling/results/prompt-volume-result` | `/realtime-sdk/v2/reference/go/calling/results/prompt-volume` | `/realtime-sdk/v2/reference/go/calling/results/prompt-volume` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/golang/calling/results/record-result` | `/realtime-sdk/v2/reference/go/calling/results/record` | `/realtime-sdk/v2/reference/go/calling/results/record` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/golang/calling/results/send-digits-result` | `/realtime-sdk/v2/reference/go/calling/results/send-digits` | `/realtime-sdk/v2/reference/go/calling/results/send-digits` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/golang/calling/results/stop-result` | `/realtime-sdk/v2/reference/go/calling/results/stop` | `/realtime-sdk/v2/reference/go/calling/results/stop` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/golang/calling/results/tap-result` | `/realtime-sdk/v2/reference/go/calling/results/tap` | `/realtime-sdk/v2/reference/go/calling/results/tap` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/golang/consumer` | `/realtime-sdk/v2/reference/go/consumer` | `/realtime-sdk/v2/reference/go/consumer` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/golang/event` | `/realtime-sdk/v2/reference/go/event` | `/realtime-sdk/v2/reference/go/event` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/golang/messaging` | `/realtime-sdk/v2/reference/go/messaging` | `/realtime-sdk/v2/reference/go/messaging` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/golang/messaging/message` | `/realtime-sdk/v2/reference/go/messaging/message` | `/realtime-sdk/v2/reference/go/messaging/message` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/golang/messaging/send-result` | `/realtime-sdk/v2/reference/go/messaging/send-result` | `/realtime-sdk/v2/reference/go/messaging/send-result` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/golang/relay-client` | `/realtime-sdk/v2/reference/go/relay-client` | `/realtime-sdk/v2/reference/go/relay-client` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/golang/task` | `/realtime-sdk/v2/reference/go/task` | `/realtime-sdk/v2/reference/go/task` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/nodejs` | `/realtime-sdk/v2/reference/nodejs` | `/realtime-sdk/v2/reference/nodejs` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/nodejs/calling` | `/realtime-sdk/v2/reference/nodejs/calling` | `/realtime-sdk/v2/reference/nodejs/calling` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/nodejs/calling/actions` | `/realtime-sdk/v2/reference/nodejs/calling/actions` | `/realtime-sdk/v2/reference/nodejs/calling/actions` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/nodejs/calling/actions/connect` | `/realtime-sdk/v2/reference/nodejs/calling/actions/connect` | `/realtime-sdk/v2/reference/nodejs/calling/actions/connect` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/nodejs/calling/actions/detect` | `/realtime-sdk/v2/reference/nodejs/calling/actions/detect` | `/realtime-sdk/v2/reference/nodejs/calling/actions/detect` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/nodejs/calling/actions/fax` | `/realtime-sdk/v2/reference/nodejs/calling/actions/fax` | `/realtime-sdk/v2/reference/nodejs/calling/actions/fax` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/nodejs/calling/actions/play` | `/realtime-sdk/v2/reference/nodejs/calling/actions/play` | `/realtime-sdk/v2/reference/nodejs/calling/actions/play` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/nodejs/calling/actions/prompt` | `/realtime-sdk/v2/reference/nodejs/calling/actions/prompt` | `/realtime-sdk/v2/reference/nodejs/calling/actions/prompt` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/nodejs/calling/actions/record` | `/realtime-sdk/v2/reference/nodejs/calling/actions/record` | `/realtime-sdk/v2/reference/nodejs/calling/actions/record` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/nodejs/calling/actions/refer` | `/realtime-sdk/v2/reference/nodejs/calling/actions/refer` | `/realtime-sdk/v2/reference/nodejs/calling/actions/refer` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/nodejs/calling/actions/send-digits` | `/realtime-sdk/v2/reference/nodejs/calling/actions/send-digits` | `/realtime-sdk/v2/reference/nodejs/calling/actions/send-digits` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/nodejs/calling/actions/tap` | `/realtime-sdk/v2/reference/nodejs/calling/actions/tap` | `/realtime-sdk/v2/reference/nodejs/calling/actions/tap` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/nodejs/calling/call` | `/realtime-sdk/v2/reference/nodejs/calling/call` | `/realtime-sdk/v2/reference/nodejs/calling/call` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/nodejs/calling/event` | `/realtime-sdk/v2/reference/nodejs/calling/event` | `/realtime-sdk/v2/reference/nodejs/calling/event` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/nodejs/calling/results` | `/realtime-sdk/v2/reference/nodejs/calling/results` | `/realtime-sdk/v2/reference/nodejs/calling/results` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/nodejs/calling/results/answer-result` | `/realtime-sdk/v2/reference/nodejs/calling/results/answer` | `/realtime-sdk/v2/reference/nodejs/calling/results/answer` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/nodejs/calling/results/connect-result` | `/realtime-sdk/v2/reference/nodejs/calling/results/connect` | `/realtime-sdk/v2/reference/nodejs/calling/results/connect` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/nodejs/calling/results/detect-result` | `/realtime-sdk/v2/reference/nodejs/calling/results/detect` | `/realtime-sdk/v2/reference/nodejs/calling/results/detect` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/nodejs/calling/results/dial-result` | `/realtime-sdk/v2/reference/nodejs/calling/results/dial` | `/realtime-sdk/v2/reference/nodejs/calling/results/dial` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/nodejs/calling/results/fax-result` | `/realtime-sdk/v2/reference/nodejs/calling/results/fax` | `/realtime-sdk/v2/reference/nodejs/calling/results/fax` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/nodejs/calling/results/hangup-result` | `/realtime-sdk/v2/reference/nodejs/calling/results/hangup` | `/realtime-sdk/v2/reference/nodejs/calling/results/hangup` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/nodejs/calling/results/pass-result` | `/realtime-sdk/v2/reference/nodejs/calling/results/pass` | `/realtime-sdk/v2/reference/nodejs/calling/results/pass` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/nodejs/calling/results/play-pause-result` | `/realtime-sdk/v2/reference/nodejs/calling/results/play-pause` | `/realtime-sdk/v2/reference/nodejs/calling/results/play-pause` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/nodejs/calling/results/play-result` | `/realtime-sdk/v2/reference/nodejs/calling/results/play` | `/realtime-sdk/v2/reference/nodejs/calling/results/play` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/nodejs/calling/results/play-resume-result` | `/realtime-sdk/v2/reference/nodejs/calling/results/play-resume` | `/realtime-sdk/v2/reference/nodejs/calling/results/play-resume` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/nodejs/calling/results/play-volume-result` | `/realtime-sdk/v2/reference/nodejs/calling/results/play-volume` | `/realtime-sdk/v2/reference/nodejs/calling/results/play-volume` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/nodejs/calling/results/prompt-result` | `/realtime-sdk/v2/reference/nodejs/calling/results/prompt` | `/realtime-sdk/v2/reference/nodejs/calling/results/prompt` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/nodejs/calling/results/prompt-volume-result` | `/realtime-sdk/v2/reference/nodejs/calling/results/prompt-volume` | `/realtime-sdk/v2/reference/nodejs/calling/results/prompt-volume` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/nodejs/calling/results/record-result` | `/realtime-sdk/v2/reference/nodejs/calling/results/record` | `/realtime-sdk/v2/reference/nodejs/calling/results/record` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/nodejs/calling/results/refer-result` | `/realtime-sdk/v2/reference/nodejs/calling/results/refer` | `/realtime-sdk/v2/reference/nodejs/calling/results/refer` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/nodejs/calling/results/send-digits-result` | `/realtime-sdk/v2/reference/nodejs/calling/results/send-digits` | `/realtime-sdk/v2/reference/nodejs/calling/results/send-digits` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/nodejs/calling/results/stop-result` | `/realtime-sdk/v2/reference/nodejs/calling/results/stop` | `/realtime-sdk/v2/reference/nodejs/calling/results/stop` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/nodejs/calling/results/tap-result` | `/realtime-sdk/v2/reference/nodejs/calling/results/tap` | `/realtime-sdk/v2/reference/nodejs/calling/results/tap` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/nodejs/consumer` | `/realtime-sdk/v2/reference/nodejs/consumer` | `/realtime-sdk/v2/reference/nodejs/consumer` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/nodejs/event` | `/realtime-sdk/v2/reference/nodejs/event` | `/realtime-sdk/v2/reference/nodejs/event` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/nodejs/examples` | `/realtime-sdk/v2/reference/nodejs/examples` | `/realtime-sdk/v2/reference/nodejs/examples` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/nodejs/messaging` | `/realtime-sdk/v2/reference/nodejs/messaging` | `/realtime-sdk/v2/reference/nodejs/messaging` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/nodejs/messaging/message` | `/realtime-sdk/v2/reference/nodejs/messaging/message` | `/realtime-sdk/v2/reference/nodejs/messaging/message` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/nodejs/messaging/send-result` | `/realtime-sdk/v2/reference/nodejs/messaging/send-result` | `/realtime-sdk/v2/reference/nodejs/messaging/send-result` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/nodejs/relay-client` | `/realtime-sdk/v2/reference/nodejs/relay-client` | `/realtime-sdk/v2/reference/nodejs/relay-client` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/nodejs/task` | `/realtime-sdk/v2/reference/nodejs/task` | `/realtime-sdk/v2/reference/nodejs/task` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/php` | `/realtime-sdk/v2/reference/php` | `/realtime-sdk/v2/reference/php` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/php/calling` | `/realtime-sdk/v2/reference/php/calling` | `/realtime-sdk/v2/reference/php/calling` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/php/calling/actions` | `/realtime-sdk/v2/reference/php/calling/actions` | `/realtime-sdk/v2/reference/php/calling/actions` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/php/calling/actions/connect` | `/realtime-sdk/v2/reference/php/calling/actions/connect` | `/realtime-sdk/v2/reference/php/calling/actions/connect` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/php/calling/actions/detect` | `/realtime-sdk/v2/reference/php/calling/actions/detect` | `/realtime-sdk/v2/reference/php/calling/actions/detect` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/php/calling/actions/fax` | `/realtime-sdk/v2/reference/php/calling/actions/fax` | `/realtime-sdk/v2/reference/php/calling/actions/fax` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/php/calling/actions/play` | `/realtime-sdk/v2/reference/php/calling/actions/play` | `/realtime-sdk/v2/reference/php/calling/actions/play` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/php/calling/actions/prompt` | `/realtime-sdk/v2/reference/php/calling/actions/prompt` | `/realtime-sdk/v2/reference/php/calling/actions/prompt` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/php/calling/actions/record` | `/realtime-sdk/v2/reference/php/calling/actions/record` | `/realtime-sdk/v2/reference/php/calling/actions/record` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/php/calling/actions/send-digits` | `/realtime-sdk/v2/reference/php/calling/actions/send-digits` | `/realtime-sdk/v2/reference/php/calling/actions/send-digits` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/php/calling/actions/tap` | `/realtime-sdk/v2/reference/php/calling/actions/tap` | `/realtime-sdk/v2/reference/php/calling/actions/tap` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/php/calling/call` | `/realtime-sdk/v2/reference/php/calling/call` | `/realtime-sdk/v2/reference/php/calling/call` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/php/calling/results` | `/realtime-sdk/v2/reference/php/calling/results` | `/realtime-sdk/v2/reference/php/calling/results` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/php/calling/results/answer-result` | `/realtime-sdk/v2/reference/php/calling/results/answer` | `/realtime-sdk/v2/reference/php/calling/results/answer` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/php/calling/results/connect-result` | `/realtime-sdk/v2/reference/php/calling/results/connect` | `/realtime-sdk/v2/reference/php/calling/results/connect` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/php/calling/results/detect-result` | `/realtime-sdk/v2/reference/php/calling/results/detect` | `/realtime-sdk/v2/reference/php/calling/results/detect` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/php/calling/results/dial-result` | `/realtime-sdk/v2/reference/php/calling/results/dial` | `/realtime-sdk/v2/reference/php/calling/results/dial` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/php/calling/results/fax-result` | `/realtime-sdk/v2/reference/php/calling/results/fax` | `/realtime-sdk/v2/reference/php/calling/results/fax` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/php/calling/results/hangup-result` | `/realtime-sdk/v2/reference/php/calling/results/hangup` | `/realtime-sdk/v2/reference/php/calling/results/hangup` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/php/calling/results/play-pause-result` | `/realtime-sdk/v2/reference/php/calling/results/play-pause` | `/realtime-sdk/v2/reference/php/calling/results/play-pause` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/php/calling/results/play-result` | `/realtime-sdk/v2/reference/php/calling/results/play` | `/realtime-sdk/v2/reference/php/calling/results/play` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/php/calling/results/play-resume-result` | `/realtime-sdk/v2/reference/php/calling/results/play-resume` | `/realtime-sdk/v2/reference/php/calling/results/play-resume` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/php/calling/results/play-volume-result` | `/realtime-sdk/v2/reference/php/calling/results/play-volume` | `/realtime-sdk/v2/reference/php/calling/results/play-volume` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/php/calling/results/prompt-result` | `/realtime-sdk/v2/reference/php/calling/results/prompt` | `/realtime-sdk/v2/reference/php/calling/results/prompt` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/php/calling/results/prompt-volume-result` | `/realtime-sdk/v2/reference/php/calling/results/prompt-volume` | `/realtime-sdk/v2/reference/php/calling/results/prompt-volume` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/php/calling/results/record-result` | `/realtime-sdk/v2/reference/php/calling/results/record` | `/realtime-sdk/v2/reference/php/calling/results/record` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/php/calling/results/send-digits-result` | `/realtime-sdk/v2/reference/php/calling/results/send-digits` | `/realtime-sdk/v2/reference/php/calling/results/send-digits` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/php/calling/results/stop-result` | `/realtime-sdk/v2/reference/php/calling/results/stop` | `/realtime-sdk/v2/reference/php/calling/results/stop` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/php/calling/results/tap-result` | `/realtime-sdk/v2/reference/php/calling/results/tap` | `/realtime-sdk/v2/reference/php/calling/results/tap` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/php/consumer` | `/realtime-sdk/v2/reference/php/consumer` | `/realtime-sdk/v2/reference/php/consumer` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/php/event` | `/realtime-sdk/v2/reference/php/event` | `/realtime-sdk/v2/reference/php/event` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/php/examples` | `/realtime-sdk/v2/reference/php/examples` | `/realtime-sdk/v2/reference/php/examples` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/php/messaging` | `/realtime-sdk/v2/reference/php/messaging` | `/realtime-sdk/v2/reference/php/messaging` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/php/messaging/message` | `/realtime-sdk/v2/reference/php/messaging/message` | `/realtime-sdk/v2/reference/php/messaging/message` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/php/messaging/results/send-result` | `/realtime-sdk/v2/reference/php/messaging/send-result` | `/realtime-sdk/v2/reference/php/messaging/send-result` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/php/relay-client` | `/realtime-sdk/v2/reference/php/relay-client` | `/realtime-sdk/v2/reference/php/relay-client` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/php/task` | `/realtime-sdk/v2/reference/php/task` | `/realtime-sdk/v2/reference/php/task` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/python` | `/realtime-sdk/v2/reference/python` | `/realtime-sdk/v2/reference/python` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/python/calling` | `/realtime-sdk/v2/reference/python/calling` | `/realtime-sdk/v2/reference/python/calling` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/python/calling/actions` | `/realtime-sdk/v2/reference/python/calling/actions` | `/realtime-sdk/v2/reference/python/calling/actions` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/python/calling/actions/connect` | `/realtime-sdk/v2/reference/python/calling/actions/connect` | `/realtime-sdk/v2/reference/python/calling/actions/connect` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/python/calling/actions/detect` | `/realtime-sdk/v2/reference/python/calling/actions/detect` | `/realtime-sdk/v2/reference/python/calling/actions/detect` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/python/calling/actions/fax` | `/realtime-sdk/v2/reference/python/calling/actions/fax` | `/realtime-sdk/v2/reference/python/calling/actions/fax` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/python/calling/actions/play` | `/realtime-sdk/v2/reference/python/calling/actions/play` | `/realtime-sdk/v2/reference/python/calling/actions/play` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/python/calling/actions/prompt` | `/realtime-sdk/v2/reference/python/calling/actions/prompt` | `/realtime-sdk/v2/reference/python/calling/actions/prompt` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/python/calling/actions/record` | `/realtime-sdk/v2/reference/python/calling/actions/record` | `/realtime-sdk/v2/reference/python/calling/actions/record` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/python/calling/actions/send-digits` | `/realtime-sdk/v2/reference/python/calling/actions/send-digits` | `/realtime-sdk/v2/reference/python/calling/actions/send-digits` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/python/calling/actions/tap` | `/realtime-sdk/v2/reference/python/calling/actions/tap` | `/realtime-sdk/v2/reference/python/calling/actions/tap` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/python/calling/call` | `/realtime-sdk/v2/reference/python/calling/call` | `/realtime-sdk/v2/reference/python/calling/call` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/python/calling/results` | `/realtime-sdk/v2/reference/python/calling/results` | `/realtime-sdk/v2/reference/python/calling/results` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/python/calling/results/answer-result` | `/realtime-sdk/v2/reference/python/calling/results/answer` | `/realtime-sdk/v2/reference/python/calling/results/answer` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/python/calling/results/connect-result` | `/realtime-sdk/v2/reference/python/calling/results/connect` | `/realtime-sdk/v2/reference/python/calling/results/connect` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/python/calling/results/detect-result` | `/realtime-sdk/v2/reference/python/calling/results/detect` | `/realtime-sdk/v2/reference/python/calling/results/detect` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/python/calling/results/dial-result` | `/realtime-sdk/v2/reference/python/calling/results/dial` | `/realtime-sdk/v2/reference/python/calling/results/dial` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/python/calling/results/fax-result` | `/realtime-sdk/v2/reference/python/calling/results/fax` | `/realtime-sdk/v2/reference/python/calling/results/fax` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/python/calling/results/hangup-result` | `/realtime-sdk/v2/reference/python/calling/results/hangup` | `/realtime-sdk/v2/reference/python/calling/results/hangup` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/python/calling/results/play-pause-result` | `/realtime-sdk/v2/reference/python/calling/results/play-pause` | `/realtime-sdk/v2/reference/python/calling/results/play-pause` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/python/calling/results/play-result` | `/realtime-sdk/v2/reference/python/calling/results/play` | `/realtime-sdk/v2/reference/python/calling/results/play` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/python/calling/results/play-resume-result` | `/realtime-sdk/v2/reference/python/calling/results/play-resume` | `/realtime-sdk/v2/reference/python/calling/results/play-resume` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/python/calling/results/play-volume-result` | `/realtime-sdk/v2/reference/python/calling/results/play-volume` | `/realtime-sdk/v2/reference/python/calling/results/play-volume` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/python/calling/results/prompt-result` | `/realtime-sdk/v2/reference/python/calling/results/prompt` | `/realtime-sdk/v2/reference/python/calling/results/prompt` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/python/calling/results/prompt-volume-result` | `/realtime-sdk/v2/reference/python/calling/results/prompt-volume` | `/realtime-sdk/v2/reference/python/calling/results/prompt-volume` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/python/calling/results/record-result` | `/realtime-sdk/v2/reference/python/calling/results/record` | `/realtime-sdk/v2/reference/python/calling/results/record` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/python/calling/results/send-digits-result` | `/realtime-sdk/v2/reference/python/calling/results/send-digits` | `/realtime-sdk/v2/reference/python/calling/results/send-digits` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/python/calling/results/stop-result` | `/realtime-sdk/v2/reference/python/calling/results/stop` | `/realtime-sdk/v2/reference/python/calling/results/stop` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/python/calling/results/tap-result` | `/realtime-sdk/v2/reference/python/calling/results/tap` | `/realtime-sdk/v2/reference/python/calling/results/tap` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/python/consumer` | `/realtime-sdk/v2/reference/python/consumer` | `/realtime-sdk/v2/reference/python/consumer` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/python/event` | `/realtime-sdk/v2/reference/python/event` | `/realtime-sdk/v2/reference/python/event` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/python/examples` | `/realtime-sdk/v2/reference/python/examples` | `/realtime-sdk/v2/reference/python/examples` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/python/messaging` | `/realtime-sdk/v2/reference/python/messaging` | `/realtime-sdk/v2/reference/python/messaging` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/python/messaging/message` | `/realtime-sdk/v2/reference/python/messaging/message` | `/realtime-sdk/v2/reference/python/messaging/message` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/python/messaging/send-result` | `/realtime-sdk/v2/reference/python/messaging/send-result` | `/realtime-sdk/v2/reference/python/messaging/send-result` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/python/relay-client` | `/realtime-sdk/v2/reference/python/relay-client` | `/realtime-sdk/v2/reference/python/relay-client` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/python/task` | `/realtime-sdk/v2/reference/python/task` | `/realtime-sdk/v2/reference/python/task` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/ruby` | `/realtime-sdk/v2/reference/ruby` | `/realtime-sdk/v2/reference/ruby` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/ruby/calling` | `/realtime-sdk/v2/reference/ruby/calling` | `/realtime-sdk/v2/reference/ruby/calling` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/ruby/calling/actions` | `/realtime-sdk/v2/reference/ruby/calling/actions` | `/realtime-sdk/v2/reference/ruby/calling/actions` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/ruby/calling/actions/connect` | `/realtime-sdk/v2/reference/ruby/calling/actions/connect` | `/realtime-sdk/v2/reference/ruby/calling/actions/connect` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/ruby/calling/actions/detect` | `/realtime-sdk/v2/reference/ruby/calling/actions/detect` | `/realtime-sdk/v2/reference/ruby/calling/actions/detect` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/ruby/calling/actions/fax` | `/realtime-sdk/v2/reference/ruby/calling/actions/fax` | `/realtime-sdk/v2/reference/ruby/calling/actions/fax` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/ruby/calling/actions/play` | `/realtime-sdk/v2/reference/ruby/calling/actions/play` | `/realtime-sdk/v2/reference/ruby/calling/actions/play` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/ruby/calling/actions/prompt` | `/realtime-sdk/v2/reference/ruby/calling/actions/prompt` | `/realtime-sdk/v2/reference/ruby/calling/actions/prompt` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/ruby/calling/actions/record` | `/realtime-sdk/v2/reference/ruby/calling/actions/record` | `/realtime-sdk/v2/reference/ruby/calling/actions/record` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/ruby/calling/actions/send-digits` | `/realtime-sdk/v2/reference/ruby/calling/actions/send-digits` | `/realtime-sdk/v2/reference/ruby/calling/actions/send-digits` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/ruby/calling/actions/tap` | `/realtime-sdk/v2/reference/ruby/calling/actions/tap` | `/realtime-sdk/v2/reference/ruby/calling/actions/tap` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/ruby/calling/call` | `/realtime-sdk/v2/reference/ruby/calling/call` | `/realtime-sdk/v2/reference/ruby/calling/call` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/ruby/calling/results` | `/realtime-sdk/v2/reference/ruby/calling/results` | `/realtime-sdk/v2/reference/ruby/calling/results` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/ruby/calling/results/answer-result` | `/realtime-sdk/v2/reference/ruby/calling/results/answer` | `/realtime-sdk/v2/reference/ruby/calling/results/answer` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/ruby/calling/results/connect-result` | `/realtime-sdk/v2/reference/ruby/calling/results/connect` | `/realtime-sdk/v2/reference/ruby/calling/results/connect` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/ruby/calling/results/detect-result` | `/realtime-sdk/v2/reference/ruby/calling/results/detect` | `/realtime-sdk/v2/reference/ruby/calling/results/detect` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/ruby/calling/results/dial-result` | `/realtime-sdk/v2/reference/ruby/calling/results/dial` | `/realtime-sdk/v2/reference/ruby/calling/results/dial` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/ruby/calling/results/fax-result` | `/realtime-sdk/v2/reference/ruby/calling/results/fax` | `/realtime-sdk/v2/reference/ruby/calling/results/fax` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/ruby/calling/results/hangup-result` | `/realtime-sdk/v2/reference/ruby/calling/results/hangup` | `/realtime-sdk/v2/reference/ruby/calling/results/hangup` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/ruby/calling/results/play-pause-result` | `/realtime-sdk/v2/reference/ruby/calling/results/play-pause` | `/realtime-sdk/v2/reference/ruby/calling/results/play-pause` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/ruby/calling/results/play-result` | `/realtime-sdk/v2/reference/ruby/calling/results/play` | `/realtime-sdk/v2/reference/ruby/calling/results/play` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/ruby/calling/results/play-resume-result` | `/realtime-sdk/v2/reference/ruby/calling/results/play-resume` | `/realtime-sdk/v2/reference/ruby/calling/results/play-resume` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/ruby/calling/results/play-volume-result` | `/realtime-sdk/v2/reference/ruby/calling/results/play-volume` | `/realtime-sdk/v2/reference/ruby/calling/results/play-volume` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/ruby/calling/results/prompt-result` | `/realtime-sdk/v2/reference/ruby/calling/results/prompt` | `/realtime-sdk/v2/reference/ruby/calling/results/prompt` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/ruby/calling/results/prompt-volume-result` | `/realtime-sdk/v2/reference/ruby/calling/results/prompt-volume` | `/realtime-sdk/v2/reference/ruby/calling/results/prompt-volume` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/ruby/calling/results/record-result` | `/realtime-sdk/v2/reference/ruby/calling/results/record` | `/realtime-sdk/v2/reference/ruby/calling/results/record` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/ruby/calling/results/send-digits-result` | `/realtime-sdk/v2/reference/ruby/calling/results/send-digits` | `/realtime-sdk/v2/reference/ruby/calling/results/send-digits` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/ruby/calling/results/stop-result` | `/realtime-sdk/v2/reference/ruby/calling/results/stop` | `/realtime-sdk/v2/reference/ruby/calling/results/stop` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/ruby/calling/results/tap-result` | `/realtime-sdk/v2/reference/ruby/calling/results/tap` | `/realtime-sdk/v2/reference/ruby/calling/results/tap` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/ruby/consumer` | `/realtime-sdk/v2/reference/ruby/consumer` | `/realtime-sdk/v2/reference/ruby/consumer` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/ruby/event` | `/realtime-sdk/v2/reference/ruby/event` | `/realtime-sdk/v2/reference/ruby/event` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/ruby/messaging` | `/realtime-sdk/v2/reference/ruby/messaging` | `/realtime-sdk/v2/reference/ruby/messaging` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/ruby/messaging/message` | `/realtime-sdk/v2/reference/ruby/messaging/message` | `/realtime-sdk/v2/reference/ruby/messaging/message` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/ruby/messaging/send-result` | `/realtime-sdk/v2/reference/ruby/messaging/send-result` | `/realtime-sdk/v2/reference/ruby/messaging/send-result` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/ruby/relay-client` | `/realtime-sdk/v2/reference/ruby/relay-client` | `/realtime-sdk/v2/reference/ruby/relay-client` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v2/language/ruby/task` | `/realtime-sdk/v2/reference/ruby/task` | `/realtime-sdk/v2/reference/ruby/task` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v3` | `/realtime-sdk/v3` | `/realtime-sdk/v3` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v3/chat` | `/realtime-sdk/v3/reference/chat` | `/realtime-sdk/v3/reference/chat` | slug_changed | 0.732 |
| `/sdks/realtime-sdk/v3/chat/client` | `/realtime-sdk/v3/reference/chat/client` | `/realtime-sdk/v3/reference/chat-client [COLLISION]` | slug_changed | 0.840 |
| `/sdks/realtime-sdk/v3/chat/member` | `/realtime-sdk/v3/reference/chat/chatmember` | `/realtime-sdk/v3/reference/chat/chatmember` | slug_changed | 0.900 |
| `/sdks/realtime-sdk/v3/chat/message` | `/realtime-sdk/v3/reference/chat/chatmessage` | `/realtime-sdk/v3/reference/chat/chatmessage` | slug_changed | 0.900 |
| `/sdks/realtime-sdk/v3/guides` | `/realtime-sdk/v3/guides` | `/realtime-sdk/v3/guides` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v3/guides/messaging/first-steps-with-messaging` | `/realtime-sdk/v3/guides/messaging/first-steps-with-messaging` | `/realtime-sdk/v3/guides/first-steps-with-messaging` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v3/guides/messaging/forwarding-texts-to-email` | `/realtime-sdk/v3/guides/messaging/forwarding-texts-to-email-nodejs` | `/realtime-sdk/v3/guides/forwarding-texts-to-email-nodejs` | slug_changed | 0.842 |
| `/sdks/realtime-sdk/v3/guides/messaging/send-sms-from-the-browser` | `/realtime-sdk/v3/guides/messaging/send-sms-from-the-browser-using-node-js` | `/realtime-sdk/v3/guides/send-sms-from-the-browser-using-node-js` | slug_changed | 0.871 |
| `/sdks/realtime-sdk/v3/guides/realtime-relay-v4-vs-v3` | `/realtime-sdk/v3/guides/realtime-relay-v4-vs-v3` | `/realtime-sdk/v3/guides/realtime-relay-v4-vs-v3` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v3/guides/voice/first-steps-with-voice` | `/realtime-sdk/v3/guides/voice/first-steps-with-voice` | `/realtime-sdk/v3/guides/first-steps-with-voice` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v3/guides/voice/setting-up-voicemail` | `/realtime-sdk/v3/guides/voice/setting-up-voicemail` | `/realtime-sdk/v3/guides/setting-up-voicemail` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v3/guides/voice/weather-phone` | `/realtime-sdk/v3/guides/voice/weather-phone-with-signalwire-realtime-api` | `/realtime-sdk/v3/guides/weather-phone-with-signalwire-realtime-api` | slug_changed | 0.884 |
| `/sdks/realtime-sdk/v3/messaging` | `/realtime-sdk/v3/reference/messaging` | `/realtime-sdk/v3/reference/messaging` | slug_changed | 0.795 |
| `/sdks/realtime-sdk/v3/messaging/client` | `/realtime-sdk/v3/reference/messaging/client` | `/realtime-sdk/v3/reference/messaging-client [COLLISION]` | slug_changed | 0.822 |
| `/sdks/realtime-sdk/v3/messaging/message-contract` | `/realtime-sdk/v3/reference/messaging/messagecontract` | `/realtime-sdk/v3/reference/messaging/messagecontract` | slug_changed | 0.946 |
| `/sdks/realtime-sdk/v3/messaging/messaging-sendresult` | `/realtime-sdk/v3/reference/messaging/messagingsendresult` | `/realtime-sdk/v3/reference/messaging/messagingsendresult` | slug_changed | 0.963 |
| `/sdks/realtime-sdk/v3/pubsub` | `/realtime-sdk/v3/reference/pubsub` | `/realtime-sdk/v3/reference/pubsub` | slug_changed | 0.781 |
| `/sdks/realtime-sdk/v3/pubsub/client` | `/realtime-sdk/v3/reference/pubsub/client` | `/realtime-sdk/v3/reference/pubsub-client [COLLISION]` | slug_changed | 0.811 |
| `/sdks/realtime-sdk/v3/realtime-client` | `/realtime-sdk/v3/reference/realtime-client` | `/realtime-sdk/v3/reference/realtime-client` | slug_changed | 0.792 |
| `/sdks/realtime-sdk/v3/task` | `/realtime-sdk/v3/reference/task` | `/realtime-sdk/v3/reference/task` | slug_changed | 0.940 |
| `/sdks/realtime-sdk/v3/task/client` | `/realtime-sdk/v3/reference/task/client` | `/realtime-sdk/v3/reference/task-client [COLLISION]` | slug_changed | 0.789 |
| `/sdks/realtime-sdk/v3/tech-ref/pubsub/pubsub-pubsubmessage` | `/realtime-sdk/v3/reference/pubsub/pubsubmessage` | `/realtime-sdk/v3/reference/pubsub/pubsubmessage` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v3/video` | `/realtime-sdk/v3/reference/video` | `/realtime-sdk/v3/reference/video` | slug_changed | 0.702 |
| `/sdks/realtime-sdk/v3/video/room-session` | `/realtime-sdk/v3/reference/video/roomsession` | `/realtime-sdk/v3/reference/video-roomsession [COLLISION]` | slug_changed | 0.939 |
| `/sdks/realtime-sdk/v3/video/roomsession-fullstate` | `/realtime-sdk/v3/reference/video/roomsessionfullstate` | `/realtime-sdk/v3/reference/video/roomsessionfullstate` | slug_changed | 0.932 |
| `/sdks/realtime-sdk/v3/video/roomsession-member` | `/realtime-sdk/v3/reference/video/roomsessionmember` | `/realtime-sdk/v3/reference/video/roomsessionmember` | slug_changed | 0.958 |
| `/sdks/realtime-sdk/v3/video/roomsession-playback` | `/realtime-sdk/v3/reference/video/roomsessionplayback` | `/realtime-sdk/v3/reference/video/roomsessionplayback` | slug_changed | 0.965 |
| `/sdks/realtime-sdk/v3/video/roomsession-recording` | `/realtime-sdk/v3/reference/video/roomsessionrecording` | `/realtime-sdk/v3/reference/video/roomsessionrecording` | slug_changed | 0.970 |
| `/sdks/realtime-sdk/v3/video/roomsession-stream` | `/realtime-sdk/v3/reference/video/roomsessionstream` | `/realtime-sdk/v3/reference/video/roomsessionstream` | slug_changed | 0.966 |
| `/sdks/realtime-sdk/v3/voice/call` | `/realtime-sdk/v3/reference/voice/call` | `/realtime-sdk/v3/reference/voice-call [COLLISION]` | slug_changed | 0.868 |
| `/sdks/realtime-sdk/v3/voice/call-collect` | `/realtime-sdk/v3/reference/voice/callcollect` | `/realtime-sdk/v3/reference/voice/callcollect` | slug_changed | 0.991 |
| `/sdks/realtime-sdk/v3/voice/call-detect` | `/realtime-sdk/v3/reference/voice/calldetect` | `/realtime-sdk/v3/reference/voice/calldetect` | slug_changed | 0.981 |
| `/sdks/realtime-sdk/v3/voice/call-playback` | `/realtime-sdk/v3/reference/voice/callplayback` | `/realtime-sdk/v3/reference/voice/callplayback` | slug_changed | 0.983 |
| `/sdks/realtime-sdk/v3/voice/call-prompt` | `/realtime-sdk/v3/reference/voice/callprompt` | `/realtime-sdk/v3/reference/voice/callprompt` | slug_changed | 0.981 |
| `/sdks/realtime-sdk/v3/voice/call-recording` | `/realtime-sdk/v3/reference/voice/callrecording` | `/realtime-sdk/v3/reference/voice/callrecording` | slug_changed | 0.982 |
| `/sdks/realtime-sdk/v3/voice/call-state` | `/realtime-sdk/v3/reference/voice/callstate` | `/realtime-sdk/v3/reference/voice/callstate` | slug_changed | 0.950 |
| `/sdks/realtime-sdk/v3/voice/call-tap` | `/realtime-sdk/v3/reference/voice/calltap` | `/realtime-sdk/v3/reference/voice/calltap` | slug_changed | 0.984 |
| `/sdks/realtime-sdk/v3/voice/client` | `/realtime-sdk/v3/reference/voice/client` | `/realtime-sdk/v3/reference/voice-client [COLLISION]` | slug_changed | 0.856 |
| `/sdks/realtime-sdk/v3/voice/device-builder` | `/realtime-sdk/v3/reference/voice/devicebuilder` | `/realtime-sdk/v3/reference/voice/devicebuilder` | slug_changed | 0.948 |
| `/sdks/realtime-sdk/v3/voice/playlist` | `/realtime-sdk/v3/reference/voice/playlist` | `/realtime-sdk/v3/reference/voice/playlist` | slug_changed | 0.840 |
| `/sdks/realtime-sdk/v3/voice/types` | `/realtime-sdk/v3/reference/voice/types` | `/realtime-sdk/v3/reference/voice/types` | slug_changed | 0.981 |
| `/sdks/realtime-sdk/video` | `/realtime-sdk/reference/video` | `/realtime-sdk/reference/video` | slug_changed | 0.782 |
| `/sdks/realtime-sdk/video/room-session-member` | `/realtime-sdk/reference/video/roomsessionmember` | `/realtime-sdk/reference/video/roomsessionmember` | slug_changed | 0.936 |
| `/sdks/realtime-sdk/video/room-session-playback` | `/realtime-sdk/reference/video/roomsessionplayback` | `/realtime-sdk/reference/video/roomsessionplayback` | slug_changed | 0.943 |
| `/sdks/realtime-sdk/video/roomsession` | `/realtime-sdk/reference/video/roomsession` | `/realtime-sdk/reference/video-roomsession [COLLISION]` | slug_changed | 0.868 |
| `/sdks/realtime-sdk/video/roomsession-fullstate` | `/realtime-sdk/reference/video/roomsessionfullstate` | `/realtime-sdk/reference/video/roomsessionfullstate` | slug_changed | 0.904 |
| `/sdks/realtime-sdk/video/roomsession-recording` | `/realtime-sdk/reference/video/roomsessionrecording` | `/realtime-sdk/reference/video/roomsessionrecording` | slug_changed | 0.954 |
| `/sdks/realtime-sdk/video/roomsession-stream` | `/realtime-sdk/reference/video/roomsessionstream` | `/realtime-sdk/reference/video/roomsessionstream` | slug_changed | 0.935 |
| `/sdks/realtime-sdk/voice/call` | `/realtime-sdk/reference/voice/call` | `/realtime-sdk/reference/voice-call [COLLISION]` | slug_changed | 0.830 |
| `/sdks/realtime-sdk/voice/call-collect` | `/realtime-sdk/reference/voice/callcollect` | `/realtime-sdk/reference/voice/callcollect` | slug_changed | 0.955 |
| `/sdks/realtime-sdk/voice/call-detect` | `/realtime-sdk/reference/voice/calldetect` | `/realtime-sdk/reference/voice/calldetect` | slug_changed | 0.968 |
| `/sdks/realtime-sdk/voice/call-playback` | `/realtime-sdk/reference/voice/callplayback` | `/realtime-sdk/reference/voice/callplayback` | slug_changed | 0.974 |
| `/sdks/realtime-sdk/voice/call-prompt` | `/realtime-sdk/reference/voice/callprompt` | `/realtime-sdk/reference/voice/callprompt` | slug_changed | 0.961 |
| `/sdks/realtime-sdk/voice/call-recording` | `/realtime-sdk/reference/voice/callrecording` | `/realtime-sdk/reference/voice/callrecording` | slug_changed | 0.976 |
| `/sdks/realtime-sdk/voice/call-state` | `/realtime-sdk/reference/voice/callstate` | `/realtime-sdk/reference/voice/callstate` | slug_changed | 0.945 |
| `/sdks/realtime-sdk/voice/call-tap` | `/realtime-sdk/reference/voice/calltap` | `/realtime-sdk/reference/voice/calltap` | slug_changed | 0.974 |
| `/sdks/realtime-sdk/voice/client` | `/realtime-sdk/reference/voice/client` | `/realtime-sdk/reference/voice-client [COLLISION]` | slug_changed | 0.798 |
| `/sdks/realtime-sdk/voice/device-builder` | `/realtime-sdk/reference/voice/devicebuilder` | `/realtime-sdk/reference/voice/devicebuilder` | slug_changed | 0.927 |
| `/sdks/realtime-sdk/voice/playlist` | `/realtime-sdk/reference/voice/playlist` | `/realtime-sdk/reference/voice/playlist` | slug_changed | 0.790 |
| `/sdks/realtime-sdk/voice/types` | `/realtime-sdk/reference/voice/types` | `/realtime-sdk/reference/voice/types` | slug_changed | 0.864 |
| `/sms/carrier-fees` | `/platform/sms/carrier-fees` | `/platform/sms/carrier-fees` | matched_changed | 1.000 |
| `/swml/expressions` | `/swml/expressions` | `/swml/reference/expressions` | matched_changed | 1.000 |
| `/swml/guides/ai/context_switch` | `/swml/guides/ai/context-switch` | `/swml/guides/context-switch` | matched_changed | 1.000 |
| `/swml/guides/ai/executing_swml` | `/swml/guides/ai/executing-swml` | `/swml/guides/executing-swml` | matched_changed | 1.000 |
| `/swml/guides/ai/set_meta_data` | `/swml/guides/ai/set-meta-data` | `/swml/guides/set-meta-data` | matched_changed | 1.000 |
| `/swml/guides/ai/swaig` | `/swml/guides/ai/swaig` | `/swml/guides/swaig` | matched_changed | 1.000 |
| `/swml/guides/ai/swaig/functions/data_map` | `/swml/guides/ai/swaig/functions/data-map` | `/swml/guides/data-map` | matched_changed | 1.000 |
| `/swml/guides/ai/toggle_functions` | `/swml/guides/ai/toggle-functions` | `/swml/guides/toggle-functions` | matched_changed | 1.000 |
| `/swml/guides/creating_ivr` | `/swml/guides/creating-ivr` | `/swml/guides/creating-ivr` | matched_changed | 1.000 |
| `/swml/guides/methods/goto_execute_transfer_disambiguation` | `/swml/guides/methods/goto-execute-transfer-disambiguation` | `/swml/guides/goto-execute-transfer-disambiguation` | matched_changed | 1.000 |
| `/swml/guides/methods/request` | `/swml/guides/methods/request` | `/swml/guides/request` | matched_changed | 1.000 |
| `/swml/guides/remote_server` | `/swml/guides/remote-server` | `/swml/guides/remote-server` | matched_changed | 1.000 |
| `/swml/methods` | `/swml/methods` | `/swml/reference` | matched_changed | 1.000 |
| `/swml/methods/ai` | `/swml/methods/ai` | `/swml/reference/ai` | matched_changed | 1.000 |
| `/swml/methods/ai/hints` | `/swml/methods/ai/hints` | `/swml/reference/ai/hints` | matched_changed | 1.000 |
| `/swml/methods/ai/languages` | `/swml/methods/ai/languages` | `/swml/reference/ai/languages` | matched_changed | 1.000 |
| `/swml/methods/ai/params` | `/swml/methods/ai/params` | `/swml/reference/ai/params` | matched_changed | 1.000 |
| `/swml/methods/ai/post_prompt` | `/swml/methods/ai/post-prompt` | `/swml/reference/ai/post-prompt` | matched_changed | 1.000 |
| `/swml/methods/ai/post_prompt_url` | `/swml/methods/ai/post-prompt-url` | `/swml/reference/ai/post-prompt-url` | matched_changed | 1.000 |
| `/swml/methods/ai/prompt` | `/swml/methods/ai/prompt` | `/swml/reference/ai/prompt` | matched_changed | 1.000 |
| `/swml/methods/ai/prompt/contexts` | `/swml/methods/ai/prompt/contexts` | `/swml/reference/ai/prompt/contexts` | matched_changed | 1.000 |
| `/swml/methods/ai/prompt/contexts/steps` | `/swml/methods/ai/prompt/contexts/steps` | `/swml/reference/ai/prompt/contexts-steps` | matched_changed | 1.000 |
| `/swml/methods/ai/prompt/pom` | `/swml/methods/ai/prompt/pom` | `/swml/reference/ai/prompt/pom` | matched_changed | 1.000 |
| `/swml/methods/ai/pronounce` | `/swml/methods/ai/pronounce` | `/swml/reference/ai/pronounce` | matched_changed | 1.000 |
| `/swml/methods/ai/swaig` | `/swml/methods/ai/swaig` | `/swml/reference/ai/swaig` | matched_changed | 1.000 |
| `/swml/methods/ai/swaig/defaults` | `/swml/methods/ai/swaig/defaults` | `/swml/reference/ai/swaig/defaults` | matched_changed | 1.000 |
| `/swml/methods/ai/swaig/functions` | `/swml/methods/ai/swaig/functions` | `/swml/reference/ai/swaig/functions` | matched_changed | 1.000 |
| `/swml/methods/ai/swaig/functions/data_map` | `/swml/methods/ai/swaig/functions/data-map` | `/swml/reference/ai/swaig/functions-data-map` | matched_changed | 1.000 |
| `/swml/methods/ai/swaig/functions/data_map/expressions` | `/swml/methods/ai/swaig/functions/data-map/expressions` | `/swml/reference/ai/swaig/functions-data-map-expressions` | matched_changed | 1.000 |
| `/swml/methods/ai/swaig/functions/data_map/output` | `/swml/methods/ai/swaig/functions/data-map/output` | `/swml/reference/ai/swaig/functions-data-map-output` | matched_changed | 1.000 |
| `/swml/methods/ai/swaig/functions/data_map/webhooks` | `/swml/methods/ai/swaig/functions/data-map/webhooks` | `/swml/reference/ai/swaig/functions-data-map-webhooks` | matched_changed | 1.000 |
| `/swml/methods/ai/swaig/functions/data_map/webhooks/foreach` | `/swml/methods/ai/swaig/functions/data-map/webhooks/foreach` | `/swml/reference/ai/swaig/functions-data-map-webhooks-foreach` | matched_changed | 1.000 |
| `/swml/methods/ai/swaig/functions/fillers` | `/swml/methods/ai/swaig/functions/fillers` | `/swml/reference/ai/swaig/functions-fillers` | matched_changed | 1.000 |
| `/swml/methods/ai/swaig/functions/parameters` | `/swml/methods/ai/swaig/functions/parameters` | `/swml/reference/ai/swaig/functions-parameters` | matched_changed | 1.000 |
| `/swml/methods/ai/swaig/functions/web_hook_url` | `/swml/methods/ai/swaig/functions/web-hook-url` | `/swml/reference/ai/swaig/functions-web-hook-url` | matched_changed | 1.000 |
| `/swml/methods/ai/swaig/includes` | `/swml/methods/ai/swaig/includes` | `/swml/reference/ai/swaig/includes` | matched_changed | 1.000 |
| `/swml/methods/ai/swaig/internal_fillers` | `/swml/methods/ai/swaig/internal-fillers` | `/swml/reference/ai/swaig/internal-fillers` | matched_changed | 1.000 |
| `/swml/methods/ai/swaig/native_functions` | `/swml/methods/ai/swaig/native-functions` | `/swml/reference/ai/swaig/native-functions` | matched_changed | 1.000 |
| `/swml/methods/amazon_bedrock` | `/swml/methods/amazon-bedrock` | `/swml/reference/amazon-bedrock` | matched_changed | 1.000 |
| `/swml/methods/amazon_bedrock/params` | `/swml/methods/amazon-bedrock/params` | `/swml/reference/amazon-bedrock/params` | matched_changed | 1.000 |
| `/swml/methods/amazon_bedrock/post_prompt` | `/swml/methods/amazon-bedrock/post-prompt` | `/swml/reference/amazon-bedrock/post-prompt` | matched_changed | 1.000 |
| `/swml/methods/amazon_bedrock/post_prompt_url` | `/swml/methods/amazon-bedrock/post-prompt-url` | `/swml/reference/amazon-bedrock/post-prompt-url` | matched_changed | 1.000 |
| `/swml/methods/amazon_bedrock/prompt` | `/swml/methods/amazon-bedrock/prompt` | `/swml/reference/amazon-bedrock/prompt` | matched_changed | 1.000 |
| `/swml/methods/amazon_bedrock/prompt/pom` | `/swml/methods/amazon-bedrock/prompt/pom` | `/swml/reference/amazon-bedrock/prompt/pom` | matched_changed | 1.000 |
| `/swml/methods/amazon_bedrock/swaig` | `/swml/methods/amazon-bedrock/swaig` | `/swml/reference/amazon-bedrock/swaig` | matched_changed | 1.000 |
| `/swml/methods/amazon_bedrock/swaig/defaults` | `/swml/methods/amazon-bedrock/swaig/defaults` | `/swml/reference/amazon-bedrock/swaig/defaults` | matched_changed | 1.000 |
| `/swml/methods/amazon_bedrock/swaig/functions` | `/swml/methods/amazon-bedrock/swaig/functions` | `/swml/reference/amazon-bedrock/swaig/functions` | matched_changed | 1.000 |
| `/swml/methods/amazon_bedrock/swaig/functions/data_map` | `/swml/methods/amazon-bedrock/swaig/functions/data-map` | `/swml/reference/amazon-bedrock/swaig/functions-data-map` | matched_changed | 1.000 |
| `/swml/methods/amazon_bedrock/swaig/functions/data_map/expressions` | `/swml/methods/amazon-bedrock/swaig/functions/data-map/expressions` | `/swml/reference/amazon-bedrock/swaig/functions-data-map-expressions` | matched_changed | 1.000 |
| `/swml/methods/amazon_bedrock/swaig/functions/data_map/output` | `/swml/methods/amazon-bedrock/swaig/functions/data-map/output` | `/swml/reference/amazon-bedrock/swaig/functions-data-map-output` | matched_changed | 1.000 |
| `/swml/methods/amazon_bedrock/swaig/functions/data_map/webhooks` | `/swml/methods/amazon-bedrock/swaig/functions/data-map/webhooks` | `/swml/reference/amazon-bedrock/swaig/functions-data-map-webhooks` | matched_changed | 1.000 |
| `/swml/methods/amazon_bedrock/swaig/functions/data_map/webhooks/foreach` | `/swml/methods/amazon-bedrock/swaig/functions/data-map/webhooks/foreach` | `/swml/reference/amazon-bedrock/swaig/functions-data-map-webhooks-foreach` | matched_changed | 1.000 |
| `/swml/methods/amazon_bedrock/swaig/functions/parameters` | `/swml/methods/amazon-bedrock/swaig/functions/parameters` | `/swml/reference/amazon-bedrock/swaig/functions-parameters` | matched_changed | 1.000 |
| `/swml/methods/amazon_bedrock/swaig/functions/web_hook_url` | `/swml/methods/amazon-bedrock/swaig/functions/web-hook-url` | `/swml/reference/amazon-bedrock/swaig/functions-web-hook-url` | matched_changed | 1.000 |
| `/swml/methods/amazon_bedrock/swaig/includes` | `/swml/methods/amazon-bedrock/swaig/includes` | `/swml/reference/amazon-bedrock/swaig/includes` | matched_changed | 1.000 |
| `/swml/methods/amazon_bedrock/swaig/native_functions` | `/swml/methods/amazon-bedrock/swaig/native-functions` | `/swml/reference/amazon-bedrock/swaig/native-functions` | matched_changed | 1.000 |
| `/swml/methods/answer` | `/swml/methods/answer` | `/swml/reference/answer` | matched_changed | 1.000 |
| `/swml/methods/cond` | `/swml/methods/cond` | `/swml/reference/cond` | matched_changed | 1.000 |
| `/swml/methods/connect` | `/swml/methods/connect` | `/swml/reference/connect` | matched_changed | 1.000 |
| `/swml/methods/connect/headers` | `/swml/methods/connect/headers` | `/swml/reference/connect/headers` | matched_changed | 1.000 |
| `/swml/methods/denoise` | `/swml/methods/denoise` | `/swml/reference/denoise` | matched_changed | 1.000 |
| `/swml/methods/detect_machine` | `/swml/methods/detect-machine` | `/swml/reference/detect-machine` | matched_changed | 1.000 |
| `/swml/methods/enter_queue` | `/swml/methods/enter-queue` | `/swml/reference/enter-queue` | matched_changed | 1.000 |
| `/swml/methods/execute` | `/swml/methods/execute` | `/swml/reference/execute` | matched_changed | 1.000 |
| `/swml/methods/goto` | `/swml/methods/goto` | `/swml/reference/goto` | matched_changed | 1.000 |
| `/swml/methods/hangup` | `/swml/methods/hangup` | `/swml/reference/hangup` | matched_changed | 1.000 |
| `/swml/methods/join_conference` | `/swml/methods/join-conference` | `/swml/reference/join-conference` | matched_changed | 1.000 |
| `/swml/methods/join_room` | `/swml/methods/join-room` | `/swml/reference/join-room` | matched_changed | 1.000 |
| `/swml/methods/label` | `/swml/methods/label` | `/swml/reference/label` | matched_changed | 1.000 |
| `/swml/methods/live_transcribe` | `/swml/methods/live-transcribe` | `/swml/reference/live-transcribe` | matched_changed | 1.000 |
| `/swml/methods/live_transcribe/action` | `/swml/methods/live-transcribe/action` | `/swml/reference/live-transcribe/action` | matched_changed | 1.000 |
| `/swml/methods/live_transcribe/action/start` | `/swml/methods/live-transcribe/action/start` | `/swml/reference/live-transcribe/action/start` | matched_changed | 1.000 |
| `/swml/methods/live_transcribe/action/stop` | `/swml/methods/live-transcribe/action/stop` | `/swml/reference/live-transcribe/action/stop` | matched_changed | 1.000 |
| `/swml/methods/live_transcribe/action/summarize` | `/swml/methods/live-transcribe/action/summarize` | `/swml/reference/live-transcribe/action/summarize` | matched_changed | 1.000 |
| `/swml/methods/live_translate` | `/swml/methods/live-translate` | `/swml/reference/live-translate` | matched_changed | 1.000 |
| `/swml/methods/live_translate/action` | `/swml/methods/live-translate/action` | `/swml/reference/live-translate/action` | matched_changed | 1.000 |
| `/swml/methods/live_translate/action/inject` | `/swml/methods/live-translate/action/inject` | `/swml/reference/live-translate/action/inject` | matched_changed | 1.000 |
| `/swml/methods/live_translate/action/start` | `/swml/methods/live-translate/action/start` | `/swml/reference/live-translate/action/start` | matched_changed | 1.000 |
| `/swml/methods/live_translate/action/stop` | `/swml/methods/live-translate/action/stop` | `/swml/reference/live-translate/action/stop` | matched_changed | 1.000 |
| `/swml/methods/live_translate/action/summarize` | `/swml/methods/live-translate/action/summarize` | `/swml/reference/live-translate/action/summarize` | matched_changed | 1.000 |
| `/swml/methods/pay` | `/swml/methods/pay` | `/swml/reference/pay` | matched_changed | 1.000 |
| `/swml/methods/pay/parameters` | `/swml/methods/pay/parameters` | `/swml/reference/pay/parameters` | matched_changed | 1.000 |
| `/swml/methods/pay/payment_connector_url` | `/swml/methods/pay/payment-connector-url` | `/swml/reference/pay/payment-connector-url` | matched_changed | 1.000 |
| `/swml/methods/pay/prompts` | `/swml/methods/pay/prompts` | `/swml/reference/pay/prompts` | matched_changed | 1.000 |
| `/swml/methods/pay/prompts/actions` | `/swml/methods/pay/prompts/actions` | `/swml/reference/pay/prompts/actions` | matched_changed | 1.000 |
| `/swml/methods/play` | `/swml/methods/play` | `/swml/reference/play` | matched_changed | 1.000 |
| `/swml/methods/prompt` | `/swml/methods/prompt` | `/swml/reference/prompt` | matched_changed | 1.000 |
| `/swml/methods/receive_fax` | `/swml/methods/receive-fax` | `/swml/reference/receive-fax` | matched_changed | 1.000 |
| `/swml/methods/record` | `/swml/methods/record` | `/swml/reference/record` | matched_changed | 1.000 |
| `/swml/methods/record_call` | `/swml/methods/record-call` | `/swml/reference/record-call` | matched_changed | 1.000 |
| `/swml/methods/request` | `/swml/methods/request` | `/swml/reference/request` | matched_changed | 1.000 |
| `/swml/methods/return` | `/swml/methods/return` | `/swml/reference/return` | matched_changed | 1.000 |
| `/swml/methods/send_digits` | `/swml/methods/send-digits` | `/swml/reference/send-digits` | matched_changed | 1.000 |
| `/swml/methods/send_fax` | `/swml/methods/send-fax` | `/swml/reference/send-fax` | matched_changed | 1.000 |
| `/swml/methods/send_sms` | `/swml/methods/send-sms` | `/swml/reference/send-sms` | matched_changed | 1.000 |
| `/swml/methods/set` | `/swml/methods/set` | `/swml/reference/set` | matched_changed | 1.000 |
| `/swml/methods/sip_refer` | `/swml/methods/sip-refer` | `/swml/reference/sip-refer` | matched_changed | 1.000 |
| `/swml/methods/sleep` | `/swml/methods/sleep` | `/swml/reference/sleep` | matched_changed | 1.000 |
| `/swml/methods/stop_denoise` | `/swml/methods/stop-denoise` | `/swml/reference/stop-denoise` | matched_changed | 1.000 |
| `/swml/methods/stop_record_call` | `/swml/methods/stop-record-call` | `/swml/reference/stop-record-call` | matched_changed | 1.000 |
| `/swml/methods/stop_tap` | `/swml/methods/stop-tap` | `/swml/reference/stop-tap` | matched_changed | 1.000 |
| `/swml/methods/switch` | `/swml/methods/switch` | `/swml/reference/switch` | matched_changed | 1.000 |
| `/swml/methods/tap` | `/swml/methods/tap` | `/swml/reference/tap` | matched_changed | 1.000 |
| `/swml/methods/transfer` | `/swml/methods/transfer` | `/swml/reference/transfer` | matched_changed | 1.000 |
| `/swml/methods/unset` | `/swml/methods/unset` | `/swml/reference/unset` | matched_changed | 1.000 |
| `/swml/methods/user_event` | `/swml/methods/user-event` | `/swml/reference/user-event` | matched_changed | 1.000 |
| `/swml/quickstart` | `/swml/quickstart` | `/swml/guides/quickstart` | matched_changed | 1.000 |
| `/swml/variables` | `/swml/variables` | `/swml/reference/variables` | matched_changed | 1.000 |
| `/tools` | `/platform/tools` | `/platform/tools` | matched_changed | 1.000 |
| `/tools/c2c` | `/platform/tools/c2c` | `/platform/tools/c2c` | matched_changed | 1.000 |
| `/tools/c2c/technical-reference` | `/platform/tools/c2c/technical-reference` | `/platform/tools/technical-reference` | matched_changed | 1.000 |
| `/tools/swsh` | `/platform/tools/swsh` | `/platform/tools/swsh` | matched_changed | 1.000 |
| `/tools/wirestarter` | `/platform/tools/wirestarter` | `/platform/tools/wirestarter` | matched_changed | 1.000 |
| `/video` | `/platform/video` | `/platform/video` | matched_changed | 1.000 |
| `/video/conference` | `/platform/video/conference` | `/platform/video/conference` | matched_changed | 1.000 |
| `/video/conference/technical-reference` | `/platform/video/conference/technical-reference` | `/platform/video/technical-reference` | matched_changed | 1.000 |
| `/video/faq` | `/platform/video/faq` | `/platform/video/faq` | matched_changed | 1.000 |
| `/video/getting-started` | `/platform/video/getting-started` | `/platform/video/getting-started` | matched_changed | 1.000 |
| `/video/getting-started/extending-rooms-with-custom-code` | `/platform/video/getting-started/extending-rooms-with-custom-code` | `/platform/video/extending-rooms-with-custom-code` | matched_changed | 1.000 |
| `/video/getting-started/managing-rooms-with-apis` | `/platform/video/getting-started/managing-rooms-with-apis` | `/platform/video/managing-rooms-with-apis` | matched_changed | 1.000 |
| `/video/getting-started/simple-video-demo` | `/platform/video/getting-started/simple-video-demo` | `/platform/video/simple-video-demo` | matched_changed | 1.000 |
| `/video/getting-started/video-first-steps` | `/platform/video/getting-started/video-first-steps` | `/platform/video/video-first-steps` | matched_changed | 1.000 |
| `/video/guides/layout-positions` | `/browser-sdk/video/guides/layout-positions` | `/browser-sdk/guides/layout-positions` | matched_changed | 1.000 |
| `/video/guides/layouts` | `/browser-sdk/video/guides/layouts` | `/browser-sdk/guides/layouts` | matched_changed | 1.000 |
| `/video/guides/making-a-clubhouse-clone` | `/platform/video/guides/making-a-clubhouse-clone` | `/platform/video/making-a-clubhouse-clone` | matched_changed | 1.000 |
| `/video/guides/making-a-zoom-clone` | `/platform/video/guides/making-a-zoom-clone` | `/platform/video/making-a-zoom-clone` | matched_changed | 1.000 |
| `/video/guides/setting-the-layout-of-your-signalwire-video-calls` | `/platform/video/guides/setting-the-layout-of-your-signalwire-video-calls` | `/platform/video/setting-the-layout-of-your-signalwire-video-calls` | matched_changed | 1.000 |
| `/voice` | `/platform/voice` | `/platform/voice` | matched_changed | 1.000 |
| `/voice/faq` | `/platform/voice/faq` | `/platform/voice/faq` | matched_changed | 1.000 |
| `/voice/getting-started/how-to-forward-calls` | `/platform/voice/getting-started/how-to-forward-calls` | `/platform/voice/how-to-forward-calls` | matched_changed | 1.000 |
| `/voice/getting-started/how-to-gather-keypad-input-from-user` | `/compatibility-api/cxml/guides/gathering-user-input` | `/compatibility-api/guides/gathering-user-input` | slug_changed | 0.702 |
| `/voice/getting-started/how-to-set-up-voicemail` | `/platform/voice/getting-started/how-to-set-up-voicemail` | `/platform/voice/how-to-set-up-voicemail` | matched_changed | 1.000 |
| `/voice/getting-started/making-and-receiving-phone-calls` | `/platform/voice/getting-started/making-and-receiving-phone-calls` | `/platform/voice/making-and-receiving-phone-calls` | matched_changed | 1.000 |
| `/voice/getting-started/recording-calls` | `/platform/voice/getting-started/recording-calls` | `/platform/voice/recording-calls` | matched_changed | 1.000 |
| `/voice/getting-started/sip/allowing-signalwire-ips-through-your-firewall` | `/platform/voice/getting-started/sip/allowing-signalwire-ips-through-your-firewall` | `/platform/voice/allowing-signalwire-ips-through-your-firewall` | matched_changed | 1.000 |
| `/voice/getting-started/sip/sip-byoc-bring-your-own-carrier` | `/platform/voice/getting-started/sip/sip-byoc-bring-your-own-carrier` | `/platform/voice/sip-byoc-bring-your-own-carrier` | matched_changed | 1.000 |
| `/voice/getting-started/sip/sip-domain-applications` | `/platform/voice/getting-started/sip/sip-domain-applications` | `/platform/voice/sip-domain-applications` | matched_changed | 1.000 |
| `/voice/getting-started/sip/sip-gateways` | `/platform/voice/getting-started/sip/sip-gateways` | `/platform/voice/sip-gateways` | matched_changed | 1.000 |
| `/voice/getting-started/sip/sip-trunking` | `/platform/voice/getting-started/sip/sip-trunking` | `/platform/voice/sip-trunking` | matched_changed | 1.000 |
| `/voice/getting-started/voice-and-languages` | `/platform/voice/getting-started/voice-and-languages` | `/platform/voice/voice-and-languages` | matched_changed | 1.000 |
| `/voice/sip` | `/platform/voice/sip` | `/platform/voice/sip` | matched_changed | 1.000 |
| `/voice/sip/get-started` | `/platform/voice/sip/get-started` | `/platform/voice/get-started` | matched_changed | 1.000 |
| `/voice/tts/amazon-polly` | `/platform/voice/tts/amazon-polly` | `/platform/voice/amazon-polly` | matched_changed | 1.000 |
| `/voice/tts/azure` | `/platform/voice/tts/azure` | `/platform/voice/azure` | matched_changed | 1.000 |
| `/voice/tts/cartesia` | `/platform/voice/tts/cartesia` | `/platform/voice/cartesia` | matched_changed | 1.000 |
| `/voice/tts/deepgram` | `/platform/voice/tts/deepgram` | `/platform/voice/deepgram` | matched_changed | 1.000 |
| `/voice/tts/elevenlabs` | `/platform/voice/tts/elevenlabs` | `/platform/voice/elevenlabs` | matched_changed | 1.000 |
| `/voice/tts/gcloud` | `/platform/voice/tts/gcloud` | `/platform/voice/gcloud` | matched_changed | 1.000 |
| `/voice/tts/openai` | `/platform/voice/tts/openai` | `/platform/voice/openai` | matched_changed | 1.000 |
| `/voice/tts/rime` | `/platform/voice/tts/rime` | `/platform/voice/rime` | matched_changed | 1.000 |

## Needs review (42)

Possible matches with low confidence. Verify manually before redirecting.

| Old URL | Current URL | Proposed URL | Confidence | Notes |
|---------|-------------|--------------|------------|-------|
| `/chat/getting-started` | `/platform/video/getting-started` | `/platform/video/getting-started` | 0.350 | body=0.226 fname=0.846 |
| `/chat/guides` | `/realtime-sdk/v2/guides` | `/realtime-sdk/v2/guides` | 0.357 | body=0.196 fname=1.000 |
| `/compatibility-api/client-sdks/api/available-phone-numbers/find-toll-free` | `/compatibility-api/sdks/methods/available-phone-numbers/find-toll-free` | `/compatibility-api/reference/available-phone-numbers/find-toll-free` | 0.685 | body=0.731 fname=0.500 |
| `/compatibility-api/client-sdks/api/available-phone-numbers/search-local` | `/compatibility-api/sdks/methods/available-phone-numbers/search-local` | `/compatibility-api/reference/available-phone-numbers/search-local` | 0.464 | body=0.455 fname=0.500 |
| `/compatibility-api/client-sdks/methods/fax-media/list-all` | `/compatibility-api/sdks/methods/fax-media/list-all` | `/compatibility-api/reference/fax-media/list-all` | 0.592 | body=0.615 fname=0.500 |
| `/compatibility-api/cxml` | `/compatibility-api/cxml` | `/compatibility-api/reference/cxml` | 0.458 | body=0.447 fname=0.500 |
| `/compatibility-api/cxml/fax` | `/compatibility-api/cxml/fax` | `/compatibility-api/reference/cxml/fax` | 0.489 | body=0.611 fname=0.000 |
| `/compatibility-api/cxml/fax/receive` | `/compatibility-api/cxml/fax/receive` | `/compatibility-api/reference/cxml/fax/receive` | 0.700 | body=0.625 fname=1.000 |
| `/compatibility-api/cxml/messaging` | `/compatibility-api/cxml/fax` | `/compatibility-api/reference/cxml/fax` | 0.311 | body=0.330 fname=0.235 |
| `/compatibility-api/cxml/messaging/message` | `/compatibility-api/cxml/messaging/message` | `/compatibility-api/reference/cxml/messaging/message` | 0.533 | body=0.416 fname=1.000 |
| `/compatibility-api/cxml/voice` | `/compatibility-api/cxml/voice` | `/compatibility-api/reference/cxml/voice` | 0.427 | body=0.418 fname=0.462 |
| `/compatibility-api/cxml/voice/conference-noun` | `/compatibility-api/cxml/voice/conference` | `/compatibility-api/reference/cxml/voice/conference` | 0.561 | body=0.451 fname=1.000 |
| `/compatibility-api/cxml/voice/dial` | `/compatibility-api/cxml/voice/dial` | `/compatibility-api/reference/cxml/voice/dial` | 0.578 | body=0.472 fname=1.000 |
| `/compatibility-api/cxml/voice/echo` | `/compatibility-api/cxml/voice/echo` | `/compatibility-api/reference/cxml/voice/echo` | 0.656 | body=0.570 fname=1.000 |
| `/compatibility-api/cxml/voice/enqueue` | `/compatibility-api/cxml/voice/enqueue` | `/compatibility-api/reference/cxml/voice/enqueue` | 0.477 | body=0.346 fname=1.000 |
| `/compatibility-api/cxml/voice/number-noun` | `/compatibility-api/cxml/voice/number` | `/compatibility-api/reference/cxml/voice/number` | 0.559 | body=0.448 fname=1.000 |
| `/compatibility-api/cxml/voice/pay` | `/compatibility-api/cxml/voice/pay` | `/compatibility-api/reference/cxml/voice/pay` | 0.694 | body=0.617 fname=1.000 |
| `/compatibility-api/cxml/voice/record` | `/compatibility-api/cxml/voice/record` | `/compatibility-api/reference/cxml/voice/record` | 0.625 | body=0.531 fname=1.000 |
| `/compatibility-api/cxml/voice/sip-noun` | `/compatibility-api/cxml/voice/sip` | `/compatibility-api/reference/cxml/voice/sip` | 0.671 | body=0.588 fname=1.000 |
| `/compatibility-api/cxml/voice/sms` | `/compatibility-api/cxml/voice/sms` | `/compatibility-api/reference/cxml/voice/sms` | 0.587 | body=0.484 fname=1.000 |
| `/fax/get-started` | `/platform/video/getting-started` | `/platform/video/getting-started` | 0.381 | body=0.227 fname=1.000 |
| `/fax/getting-started/first-steps-with-fax` | `/platform/fax` | `/platform/fax` | 0.499 | body=0.570 fname=0.214 |
| `/fax/getting-started/securing-callback-for-inbound-fax-with-cxml` | `/compatibility-api/cxml/guides/securing-callback-for-inbound-fax` | `/compatibility-api/guides/securing-callback-for-inbound-fax` | 0.367 | body=0.333 fname=0.500 |
| `/messaging/get-started` | `/platform/video/getting-started` | `/platform/video/getting-started` | 0.380 | body=0.225 fname=1.000 |
| `/platform/phone-numbers/getting-started` | `/platform/video/getting-started` | `/platform/video/getting-started` | 0.311 | body=0.177 fname=0.846 |
| `/sdks/browser-sdk/chat/client` | `/browser-sdk/reference/pubsub/pubsub-client` | `/browser-sdk/reference/pubsub/pubsub-client` | 0.332 | body=0.289 fname=0.500 |
| `/sdks/browser-sdk/chat/member-entity` | `/browser-sdk/reference/chat/chatmemberentity` | `/browser-sdk/reference/chat/chatmemberentity` | 0.482 | body=0.396 fname=0.828 |
| `/sdks/browser-sdk/chat/message-entity` | `/browser-sdk/reference/chat/chatmessageentity` | `/browser-sdk/reference/chat/chatmessageentity` | 0.462 | body=0.368 fname=0.839 |
| `/sdks/browser-sdk/pubsub/client` | `/browser-sdk/reference/pubsub/pubsub-client` | `/browser-sdk/reference/pubsub/pubsub-client` | 0.511 | body=0.514 fname=0.500 |
| `/sdks/browser-sdk/v2/guides` | `/browser-sdk/reference/video/RoomSession/methods/destroy` | `/browser-sdk/reference/video/roomsession/methods/destroy` | 0.301 | body=0.261 fname=0.462 |
| `/sdks/browser-sdk/video` | `/browser-sdk/reference/video` | `/browser-sdk/reference/video` | 0.516 | body=0.395 fname=1.000 |
| `/sdks/browser-sdk/video/room-session-stream` | `/browser-sdk/reference/video/video-roomsessionstream` | `/browser-sdk/reference/video/video-roomsessionstream` | 0.592 | body=0.537 fname=0.810 |
| `/sdks/realtime-sdk/realtime-client` | `/realtime-sdk/reference/realtime-client` | `/realtime-sdk/reference/realtime-client` | 0.411 | body=0.264 fname=1.000 |
| `/sdks/realtime-sdk/v3/guides/voice` | `/realtime-sdk/v3/v3/reference/video/client/methods/once` | `/realtime-sdk/v3/reference/video/client/methods/once` | 0.301 | body=0.210 fname=0.667 |
| `/sdks/realtime-sdk/v3/video/client` | `/realtime-sdk/v3/reference/task/client` | `/realtime-sdk/v3/reference/task-client [COLLISION]` | 0.391 | body=0.363 fname=0.500 |
| `/sdks/realtime-sdk/v3/voice` | `/realtime-sdk/v3/reference/voice` | `/realtime-sdk/v3/reference/voice` | 0.679 | body=0.599 fname=1.000 |
| `/sdks/realtime-sdk/video/client` | `/realtime-sdk/reference/video/client/methods/listen` | `/realtime-sdk/reference/video/client/methods/listen` | 0.396 | body=0.329 fname=0.667 |
| `/sdks/realtime-sdk/voice` | `/realtime-sdk/reference/voice` | `/realtime-sdk/reference/voice` | 0.562 | body=0.452 fname=1.000 |
| `/swml/methods/ai/swaig/defaults/web_hook_url` | `/swml/methods/ai/swaig/functions/web_hook_url` | `/swml/reference/ai/swaig/functions-web-hook-url` | 0.494 | body=0.492 fname=0.500 |
| `/swml/methods/amazon_bedrock/swaig/defaults/web_hook_url` | `/swml/methods/ai/swaig/functions/web_hook_url` | `/swml/reference/ai/swaig/functions-web-hook-url` | 0.495 | body=0.494 fname=0.500 |
| `/video/guides` | `/realtime-sdk/v2/guides` | `/realtime-sdk/v2/guides` | 0.334 | body=0.167 fname=1.000 |
| `/voice/guides/general/how-to-set-caller-id-or-cnam` | `/platform/basics/general/how-to-set-caller-id-or-cnam` | `/platform/basics/how-to-set-caller-id-or-cnam` | 0.437 | body=0.296 fname=1.000 |

## Gone (581)

Content removed, auto-generated, or not migrated. Return 410 or let 404.

### autogen (401)

- `/rest` -- OpenAPI-generated endpoint (no MDX source in docs/main/rest/)
- `/rest/compatibility-api` -- OpenAPI-generated endpoint (no MDX source in docs/main/rest/)
- `/rest/compatibility-api/endpoints` -- OpenAPI-generated endpoint (no MDX source in docs/main/rest/)
- `/rest/compatibility-api/endpoints/accounts` -- OpenAPI-generated endpoint (no MDX source in docs/main/rest/)
- `/rest/compatibility-api/endpoints/applications` -- OpenAPI-generated endpoint (no MDX source in docs/main/rest/)
- `/rest/compatibility-api/endpoints/available-phone-numbers` -- OpenAPI-generated endpoint (no MDX source in docs/main/rest/)
- `/rest/compatibility-api/endpoints/c-xml-bins` -- OpenAPI-generated endpoint (no MDX source in docs/main/rest/)
- `/rest/compatibility-api/endpoints/calls` -- OpenAPI-generated endpoint (no MDX source in docs/main/rest/)
- `/rest/compatibility-api/endpoints/conference-participants` -- OpenAPI-generated endpoint (no MDX source in docs/main/rest/)
- `/rest/compatibility-api/endpoints/conference-streams` -- OpenAPI-generated endpoint (no MDX source in docs/main/rest/)
- `/rest/compatibility-api/endpoints/conferences` -- OpenAPI-generated endpoint (no MDX source in docs/main/rest/)
- `/rest/compatibility-api/endpoints/create-a-call` -- OpenAPI-generated endpoint (no MDX source in docs/main/rest/)
- `/rest/compatibility-api/endpoints/create-application` -- OpenAPI-generated endpoint (no MDX source in docs/main/rest/)
- `/rest/compatibility-api/endpoints/create-conference-stream` -- OpenAPI-generated endpoint (no MDX source in docs/main/rest/)
- `/rest/compatibility-api/endpoints/create-cxml-application` -- OpenAPI-generated endpoint (no MDX source in docs/main/rest/)
- `/rest/compatibility-api/endpoints/create-imported-phone-number` -- OpenAPI-generated endpoint (no MDX source in docs/main/rest/)
- `/rest/compatibility-api/endpoints/create-incoming-phone-number` -- OpenAPI-generated endpoint (no MDX source in docs/main/rest/)
- `/rest/compatibility-api/endpoints/create-message` -- OpenAPI-generated endpoint (no MDX source in docs/main/rest/)
- `/rest/compatibility-api/endpoints/create-queue` -- OpenAPI-generated endpoint (no MDX source in docs/main/rest/)
- `/rest/compatibility-api/endpoints/create-recording` -- OpenAPI-generated endpoint (no MDX source in docs/main/rest/)
- `/rest/compatibility-api/endpoints/create-stream` -- OpenAPI-generated endpoint (no MDX source in docs/main/rest/)
- `/rest/compatibility-api/endpoints/create-subprojects` -- OpenAPI-generated endpoint (no MDX source in docs/main/rest/)
- `/rest/compatibility-api/endpoints/create-token` -- OpenAPI-generated endpoint (no MDX source in docs/main/rest/)
- `/rest/compatibility-api/endpoints/cxml-api` -- OpenAPI-generated endpoint (no MDX source in docs/main/rest/)
- `/rest/compatibility-api/endpoints/delete-a-call` -- OpenAPI-generated endpoint (no MDX source in docs/main/rest/)
- `/rest/compatibility-api/endpoints/delete-application` -- OpenAPI-generated endpoint (no MDX source in docs/main/rest/)
- `/rest/compatibility-api/endpoints/delete-cxml-application` -- OpenAPI-generated endpoint (no MDX source in docs/main/rest/)
- `/rest/compatibility-api/endpoints/delete-fax` -- OpenAPI-generated endpoint (no MDX source in docs/main/rest/)
- `/rest/compatibility-api/endpoints/delete-fax-media` -- OpenAPI-generated endpoint (no MDX source in docs/main/rest/)
- `/rest/compatibility-api/endpoints/delete-incoming-phone-number` -- OpenAPI-generated endpoint (no MDX source in docs/main/rest/)
- ... and 371 more

### known_deleted (98)

- `/compatibility-api/guides` -- Section not migrated to Fern
- `/compatibility-api/guides/general` -- Section not migrated to Fern
- `/compatibility-api/guides/general/calltext-by-proxy` -- Section not migrated to Fern
- `/compatibility-api/guides/general/creating-and-using-cxml-scripts` -- Section not migrated to Fern
- `/compatibility-api/guides/general/phone-numbers` -- Section not migrated to Fern
- `/compatibility-api/guides/general/phone-numbers/how-to-purchase-numbers-in-bulk` -- Section not migrated to Fern
- `/compatibility-api/guides/general/phone-numbers/how-to-update-webhooks-in-bulk` -- Section not migrated to Fern
- `/compatibility-api/guides/general/phone-numbers/list-numbers-to-csv` -- Section not migrated to Fern
- `/compatibility-api/guides/general/phone-numbers/release-numbers` -- Section not migrated to Fern
- `/compatibility-api/guides/general/phone-numbers/release-project-numbers-based-off-csv` -- Section not migrated to Fern
- `/compatibility-api/guides/general/phone-numbers/remove-all-landlines-from-your-recipient-list` -- Section not migrated to Fern
- `/compatibility-api/guides/general/utilizing-mustache-templates` -- Section not migrated to Fern
- `/compatibility-api/guides/messaging` -- Section not migrated to Fern
- `/compatibility-api/guides/messaging/general` -- Section not migrated to Fern
- `/compatibility-api/guides/messaging/general/handling-incoming-messages-from-code` -- Section not migrated to Fern
- `/compatibility-api/guides/messaging/general/how-to-list-messages-filtered-by-multiple-from-numbers` -- Section not migrated to Fern
- `/compatibility-api/guides/messaging/general/how-to-list-messages-with-a-specific-error-code-to-csv` -- Section not migrated to Fern
- `/compatibility-api/guides/messaging/general/how-to-pull-undelivered-messages` -- Section not migrated to Fern
- `/compatibility-api/guides/messaging/general/how-to-redact-messages-for-hippa-compliancy` -- Section not migrated to Fern
- `/compatibility-api/guides/messaging/general/how-to-send-sms-from-google-sheets` -- Section not migrated to Fern
- `/compatibility-api/guides/messaging/general/how-to-use-list-messages-api-to-get-pricing-for-a-date-range` -- Section not migrated to Fern
- `/compatibility-api/guides/messaging/general/list-messages-to-csv-all-languages` -- Section not migrated to Fern
- `/compatibility-api/guides/messaging/general/sms-status-callbacks` -- Section not migrated to Fern
- `/compatibility-api/guides/messaging/python` -- Section not migrated to Fern
- `/compatibility-api/guides/messaging/python/how-to-get-reply-statistics-with-python` -- Section not migrated to Fern
- `/compatibility-api/guides/messaging/python/how-to-send-bulk-sms-from-customer-csv-with-python` -- Section not migrated to Fern
- `/compatibility-api/guides/messaging/python/send-sms-from-the-browser-with-python-flask-and-html` -- Section not migrated to Fern
- `/compatibility-api/guides/messaging/python/text-subscription` -- Section not migrated to Fern
- `/compatibility-api/guides/messaging/python/text-to-email` -- Section not migrated to Fern
- `/compatibility-api/guides/signalwire-status-callbacks` -- Section not migrated to Fern
- ... and 68 more

### likely_deleted (82)

- `/ai/guides` -- No Fern page above similarity threshold
- `/ai/guides/integrations` -- No Fern page above similarity threshold
- `/ai/guides/integrations/livekit` -- No Fern page above similarity threshold
- `/cantina/user-guide` -- No Fern page above similarity threshold
- `/cantina/user-guide-for-admin-rights` -- No Fern page above similarity threshold
- `/cluecon-2024` -- No Fern page above similarity threshold
- `/compatibility-api` -- No Fern page above similarity threshold
- `/compatibility-api/cxml/stream-openai-realtime` -- No Fern page above similarity threshold
- `/demos/admin-assistant` -- No Fern page above similarity threshold
- `/demos/ai-cal` -- No Fern page above similarity threshold
- `/demos/bobbys-table` -- No Fern page above similarity threshold
- `/demos/esp8266-sensor-bot` -- No Fern page above similarity threshold
- `/demos/flos-flowers` -- No Fern page above similarity threshold
- `/demos/flos-flowers-2` -- No Fern page above similarity threshold
- `/demos/mfa` -- No Fern page above similarity threshold
- `/demos/roomieserve` -- No Fern page above similarity threshold
- `/demos/tier-1` -- No Fern page above similarity threshold
- `/demos/weather-bot` -- No Fern page above similarity threshold
- `/events/demos/server/room-service/menu` -- No Fern page above similarity threshold
- `/home/calling/voice/getting-started` -- No Fern page above similarity threshold
- `/home/calling/voice/guides` -- No Fern page above similarity threshold
- `/home/messaging/sms/guides` -- No Fern page above similarity threshold
- `/home/platform/dashboard/administration` -- No Fern page above similarity threshold
- `/livewire/integrate-zendesk-signalwire-ai` -- No Fern page above similarity threshold
- `/livewire/smart-biz-ai` -- No Fern page above similarity threshold
- `/messaging/guides/campaign-registry` -- No Fern page above similarity threshold
- `/messaging/guides/general` -- No Fern page above similarity threshold
- `/platform/basics` -- No Fern page above similarity threshold
- `/platform/basics/general` -- No Fern page above similarity threshold
- `/platform/basics/guides` -- No Fern page above similarity threshold
- ... and 52 more


## No action needed (10)

URLs that haven't changed or are already covered.

- `/call-flow-builder` -> `/call-flow-builder`
- `/platform/call-fabric` -> `/platform/call-fabric`
- `/platform/call-fabric/addresses` -> `/platform/call-fabric/addresses`
- `/platform/call-fabric/resources` -> `/platform/call-fabric/resources`
- `/platform/dashboard` -> `/platform/dashboard`
- `/platform/dashboard/billing` -> `/platform/dashboard/billing`
- `/swml` -> `/swml`
- `/swml/guides/call-whisper` -> `/swml/guides/call-whisper`
- `/swml/guides/deployment` -> `/swml/guides/deployment`
- `/swml/reference/template-functions` -> `/swml/reference/template-functions`

## Output files

- `C:\Users\devon\projects\signalwire-fern-config\scripts\slug-reconciliation\reports\slug-final-report.csv` -- full report (1489 rows)
- `C:\Users\devon\projects\signalwire-fern-config\scripts\slug-reconciliation\reports\slug-final-report.md` -- this report

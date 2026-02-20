# Slug Redirect Report

Unified report merging reconciliation and content-matching results.

## Summary

**Column definitions:**
- **Old URL** -- Docusaurus URL from the old sitemap
- **Current full URL** -- live Fern URL based on current frontmatter slug
- **Proposed full URL** -- Fern URL after slug standardization is applied
- **Decomposed columns** (CSV only): product_slug, version_slug, tab_slug, page_slug, full_url

| Action | Count | Description |
|--------|-------|-------------|
| **redirect** | 859 | Old URL -> proposed Fern URL (needs 301 redirect) |
| **review** | 43 | Possible match, needs manual verification |
| **gone** | 586 | Content removed or auto-generated (410/404) |
| **no_action** | 1 | URL unchanged or already covered |
| **Total** | **1489** | |

### By category

| Category | Count |
|----------|-------|
| matched_changed | 660 |
| autogen | 401 |
| slug_changed | 199 |
| known_deleted | 98 |
| likely_deleted | 82 |
| uncertain | 43 |
| no_source | 5 |
| already_mapped | 1 |

## Redirects (859)

These old URLs need 301 redirects to their proposed locations.

| Old URL | Current full URL | Proposed full URL | Category | Confidence |
|---------|------------------|-------------------|----------|------------|
| `/ai` | `/platform/calling/ai` | `/platform/calling/ai` | matched_changed | 1.000 |
| `/ai/get-started` | `/platform/calling/ai/get-started` | `/platform/calling/ai/get-started` | matched_changed | 1.000 |
| `/ai/get-started/platform-capabilities` | `/platform/calling/ai/get-started/platform-capabilities` | `/platform/calling/ai/platform-capabilities` | matched_changed | 1.000 |
| `/ai/get-started/prompt-engineering` | `/platform/calling/ai/get-started/prompt-engineering` | `/platform/calling/ai/prompt-engineering` | matched_changed | 1.000 |
| `/ai/get-started/prompt-engineering/best-practices` | `/platform/calling/ai/get-started/prompt-engineering/best-practices` | `/platform/calling/ai/prompt-engineering-best-practices` | matched_changed | 1.000 |
| `/ai/get-started/prompt-engineering/where-to-apply` | `/platform/calling/ai/get-started/prompt-engineering/where-to-apply` | `/platform/calling/ai/where-to-apply` | matched_changed | 1.000 |
| `/ai/guides/best-practices` | `/platform/calling/ai/guides/best-practices` | `/platform/calling/ai/guides-best-practices` | matched_changed | 1.000 |
| `/ai/guides/integrations/livekit/inbound` | `/platform/calling/ai/guides/integrations/livekit/inbound` | `/platform/calling/ai/inbound` | matched_changed | 1.000 |
| `/ai/guides/integrations/livekit/outbound` | `/platform/calling/ai/guides/integrations/livekit/outbound` | `/platform/calling/ai/outbound` | matched_changed | 1.000 |
| `/ai/guides/integrations/vapi` | `/platform/calling/ai/guides/integrations/vapi` | `/platform/calling/ai/vapi` | matched_changed | 1.000 |
| `/ai/guides/integrations/vapi/inbound-calls` | `/platform/calling/ai/guides/integrations/vapi/inbound-calls` | `/platform/calling/ai/inbound-calls` | matched_changed | 1.000 |
| `/ai/guides/integrations/vapi/outbound-calls` | `/platform/calling/ai/guides/integrations/vapi/outbound-calls` | `/platform/calling/ai/outbound-calls` | matched_changed | 1.000 |
| `/ai/pom` | `/platform/calling/ai/pom` | `/platform/calling/ai/pom` | matched_changed | 1.000 |
| `/ai/pom/technical-reference` | `/platform/calling/ai/pom/technical-reference` | `/platform/calling/ai/technical-reference` | matched_changed | 1.000 |
| `/call-flow-builder` | `/call-flow-builder/core` | `/call-flow-builder/core` | matched_changed | 1.000 |
| `/call-flow-builder/ai-agent` | `/call-flow-builder/nodes/ai-agent` | `/call-flow-builder/nodes/reference/ai-agent` | matched_changed | 1.000 |
| `/call-flow-builder/answer-call` | `/call-flow-builder/nodes/answer-call` | `/call-flow-builder/nodes/reference/answer-call` | matched_changed | 1.000 |
| `/call-flow-builder/conditions` | `/call-flow-builder/nodes/conditions` | `/call-flow-builder/nodes/reference/conditions` | matched_changed | 1.000 |
| `/call-flow-builder/execute-swml` | `/call-flow-builder/nodes/execute-swml` | `/call-flow-builder/nodes/reference/execute-swml` | matched_changed | 1.000 |
| `/call-flow-builder/forward-to-phone` | `/call-flow-builder/nodes/forward-to-phone` | `/call-flow-builder/nodes/reference/forward-to-phone` | matched_changed | 1.000 |
| `/call-flow-builder/gather-input` | `/call-flow-builder/nodes/gather-input` | `/call-flow-builder/nodes/reference/gather-input` | matched_changed | 1.000 |
| `/call-flow-builder/handle-call` | `/call-flow-builder/nodes/handle-call` | `/call-flow-builder/nodes/reference/handle-call` | matched_changed | 1.000 |
| `/call-flow-builder/hangup-call` | `/call-flow-builder/nodes/hangup-call` | `/call-flow-builder/nodes/reference/hangup-call` | matched_changed | 1.000 |
| `/call-flow-builder/nodes` | `/call-flow-builder/nodes/nodes` | `/call-flow-builder/nodes/reference/nodes` | matched_changed | 1.000 |
| `/call-flow-builder/play-audio-or-tts` | `/call-flow-builder/nodes/play-audio-or-tts` | `/call-flow-builder/nodes/reference/play-audio-or-tts` | matched_changed | 1.000 |
| `/call-flow-builder/request` | `/call-flow-builder/nodes/request` | `/call-flow-builder/nodes/reference/request` | matched_changed | 1.000 |
| `/call-flow-builder/send-sms` | `/call-flow-builder/nodes/send-sms` | `/call-flow-builder/nodes/reference/send-sms` | matched_changed | 1.000 |
| `/call-flow-builder/set-variables` | `/call-flow-builder/nodes/set-variables` | `/call-flow-builder/nodes/reference/set-variables` | matched_changed | 1.000 |
| `/call-flow-builder/start-call-recording` | `/call-flow-builder/nodes/start-call-recording` | `/call-flow-builder/nodes/reference/start-call-recording` | matched_changed | 1.000 |
| `/call-flow-builder/stop-call-recording` | `/call-flow-builder/nodes/stop-call-recording` | `/call-flow-builder/nodes/reference/stop-call-recording` | matched_changed | 1.000 |
| `/call-flow-builder/unset-variables` | `/call-flow-builder/nodes/unset-variables` | `/call-flow-builder/nodes/reference/unset-variables` | matched_changed | 1.000 |
| `/call-flow-builder/variables` | `/call-flow-builder/core/variables` | `/call-flow-builder/core/guides/variables` | matched_changed | 1.000 |
| `/call-flow-builder/version` | `/call-flow-builder/core/core/version` | `/call-flow-builder/core/guides/version` | slug_changed | 0.984 |
| `/call-flow-builder/voicemail-recording` | `/call-flow-builder/nodes/voicemail-recording` | `/call-flow-builder/nodes/reference/voicemail-recording` | matched_changed | 1.000 |
| `/chat` | `/platform/messaging/chat` | `/platform/messaging/chat` | matched_changed | 1.000 |
| `/chat/faq` | `/platform/messaging/chat/faq` | `/platform/messaging/chat/faq` | matched_changed | 1.000 |
| `/chat/getting-started/chat-first-steps` | `/platform/messaging/chat/getting-started/chat-first-steps` | `/platform/messaging/chat/chat-first-steps` | matched_changed | 1.000 |
| `/chat/getting-started/get-started-with-a-simple-chat-demo` | `/platform/messaging/chat/getting-started/get-started-with-a-simple-chat-demo` | `/platform/messaging/chat/get-started-with-a-simple-chat-demo` | matched_changed | 1.000 |
| `/chat/guides/build-a-react-chat-application` | `/platform/messaging/chat/guides/build-a-react-chat-application` | `/platform/messaging/chat/build-a-react-chat-application` | matched_changed | 1.000 |
| `/chat/guides/using-chat-to-send-sms-and-make-calls` | `/platform/messaging/chat/guides/using-chat-to-send-sms-and-make-calls` | `/platform/messaging/chat/using-chat-to-send-sms-and-make-calls` | matched_changed | 1.000 |
| `/compatibility-api/api-reference/rest-client-sdks/methods` | `/compatibility-api/sdks/sdks/methods` | `/compatibility-api/sdks/sdks/methods` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/api/available-phone-numbers` | `/compatibility-api/sdks/sdks/methods/available-phone-numbers` | `/compatibility-api/sdks/sdks/methods/available-phone-numbers` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/api/available-phone-numbers/list-resources` | `/compatibility-api/sdks/sdks/methods/available-phone-numbers/list-resources` | `/compatibility-api/sdks/sdks/methods/available-phone-numbers/list-resources` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/applications` | `/compatibility-api/sdks/sdks/methods/applications` | `/compatibility-api/sdks/sdks/methods/applications` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/applications/create` | `/compatibility-api/sdks/sdks/methods/applications/create` | `/compatibility-api/sdks/sdks/methods/applications/create` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/applications/delete` | `/compatibility-api/sdks/sdks/methods/applications/delete` | `/compatibility-api/sdks/sdks/methods/applications/delete` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/applications/retrieve` | `/compatibility-api/sdks/sdks/methods/applications/retrieve` | `/compatibility-api/sdks/sdks/methods/applications/retrieve` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/applications/update` | `/compatibility-api/sdks/sdks/methods/applications/update` | `/compatibility-api/sdks/sdks/methods/applications/update` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/accounts` | `/compatibility-api/sdks/sdks/methods/accounts` | `/compatibility-api/sdks/sdks/methods/accounts` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/accounts/list` | `/compatibility-api/sdks/sdks/methods/accounts/list` | `/compatibility-api/sdks/sdks/methods/accounts/list` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/accounts/retrieve` | `/compatibility-api/sdks/sdks/methods/accounts/retrieve` | `/compatibility-api/sdks/sdks/methods/accounts/retrieve` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/accounts/update` | `/compatibility-api/sdks/sdks/methods/accounts/update` | `/compatibility-api/sdks/sdks/methods/accounts/update` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/calls` | `/compatibility-api/sdks/sdks/methods/calls` | `/compatibility-api/sdks/sdks/methods/calls` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/calls/create` | `/compatibility-api/sdks/sdks/methods/calls/create` | `/compatibility-api/sdks/sdks/methods/calls/create` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/calls/delete` | `/compatibility-api/sdks/sdks/methods/calls/delete` | `/compatibility-api/sdks/sdks/methods/calls/delete` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/calls/list` | `/compatibility-api/sdks/sdks/methods/calls/list` | `/compatibility-api/sdks/sdks/methods/calls/list` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/calls/retrieve` | `/compatibility-api/sdks/sdks/methods/calls/retrieve` | `/compatibility-api/sdks/sdks/methods/calls/retrieve` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/calls/update` | `/compatibility-api/sdks/sdks/methods/calls/update` | `/compatibility-api/sdks/sdks/methods/calls/update` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/conference-participants` | `/compatibility-api/sdks/sdks/methods/conference-participants` | `/compatibility-api/sdks/sdks/methods/conference-participants` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/conference-participants/add` | `/compatibility-api/sdks/sdks/methods/conference-participants/add` | `/compatibility-api/sdks/sdks/methods/conference-participants/add` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/conference-participants/delete` | `/compatibility-api/sdks/sdks/methods/conference-participants/delete` | `/compatibility-api/sdks/sdks/methods/conference-participants/delete` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/conference-participants/list` | `/compatibility-api/sdks/sdks/methods/conference-participants/list` | `/compatibility-api/sdks/sdks/methods/conference-participants/list` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/conference-participants/retrieve` | `/compatibility-api/sdks/sdks/methods/conference-participants/retrieve` | `/compatibility-api/sdks/sdks/methods/conference-participants/retrieve` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/conference-participants/update` | `/compatibility-api/sdks/sdks/methods/conference-participants/update` | `/compatibility-api/sdks/sdks/methods/conference-participants/update` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/conferences` | `/compatibility-api/sdks/sdks/methods/conferences` | `/compatibility-api/sdks/sdks/methods/conferences` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/conferences/list` | `/compatibility-api/sdks/sdks/methods/conferences/list` | `/compatibility-api/sdks/sdks/methods/conferences/list` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/conferences/retrieve` | `/compatibility-api/sdks/sdks/methods/conferences/retrieve` | `/compatibility-api/sdks/sdks/methods/conferences/retrieve` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/conferences/update` | `/compatibility-api/sdks/sdks/methods/conferences/update` | `/compatibility-api/sdks/sdks/methods/conferences/update` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/cxml-applications` | `/compatibility-api/sdks/sdks/methods/cxml-applications` | `/compatibility-api/sdks/sdks/methods/cxml-applications` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/cxml-applications/create` | `/compatibility-api/sdks/sdks/methods/cxml-applications/create` | `/compatibility-api/sdks/sdks/methods/cxml-applications/create` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/cxml-applications/delete` | `/compatibility-api/sdks/sdks/methods/cxml-applications/delete` | `/compatibility-api/sdks/sdks/methods/cxml-applications/delete` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/cxml-applications/list` | `/compatibility-api/sdks/sdks/methods/cxml-applications/list` | `/compatibility-api/sdks/sdks/methods/cxml-applications/list` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/cxml-applications/retrieve` | `/compatibility-api/sdks/sdks/methods/cxml-applications/retrieve` | `/compatibility-api/sdks/sdks/methods/cxml-applications/retrieve` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/cxml-applications/update` | `/compatibility-api/sdks/sdks/methods/cxml-applications/update` | `/compatibility-api/sdks/sdks/methods/cxml-applications/update` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/fax-media` | `/compatibility-api/sdks/sdks/methods/fax-media` | `/compatibility-api/sdks/sdks/methods/fax-media` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/fax-media/delete` | `/compatibility-api/sdks/sdks/methods/fax-media/delete` | `/compatibility-api/sdks/sdks/methods/fax-media/delete` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/fax-media/retrieve` | `/compatibility-api/sdks/sdks/methods/fax-media/retrieve` | `/compatibility-api/sdks/sdks/methods/fax-media/retrieve` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/faxes` | `/compatibility-api/sdks/sdks/methods/faxes` | `/compatibility-api/sdks/sdks/methods/faxes` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/faxes/delete` | `/compatibility-api/sdks/sdks/methods/faxes/delete` | `/compatibility-api/sdks/sdks/methods/faxes/delete` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/faxes/list` | `/compatibility-api/sdks/sdks/methods/faxes/list` | `/compatibility-api/sdks/sdks/methods/faxes/list` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/faxes/retrieve` | `/compatibility-api/sdks/sdks/methods/faxes/retrieve` | `/compatibility-api/sdks/sdks/methods/faxes/retrieve` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/faxes/send` | `/compatibility-api/sdks/sdks/methods/faxes/send` | `/compatibility-api/sdks/sdks/methods/faxes/send` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/faxes/update` | `/compatibility-api/sdks/sdks/methods/faxes/update` | `/compatibility-api/sdks/sdks/methods/faxes/update` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/incoming-phone-numbers` | `/compatibility-api/sdks/sdks/methods/incoming-phone-numbers` | `/compatibility-api/sdks/sdks/methods/incoming-phone-numbers` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/incoming-phone-numbers/create` | `/compatibility-api/sdks/sdks/methods/incoming-phone-numbers/create` | `/compatibility-api/sdks/sdks/methods/incoming-phone-numbers/create` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/incoming-phone-numbers/delete` | `/compatibility-api/sdks/sdks/methods/incoming-phone-numbers/delete` | `/compatibility-api/sdks/sdks/methods/incoming-phone-numbers/delete` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/incoming-phone-numbers/list` | `/compatibility-api/sdks/sdks/methods/incoming-phone-numbers/list` | `/compatibility-api/sdks/sdks/methods/incoming-phone-numbers/list` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/incoming-phone-numbers/retrieve` | `/compatibility-api/sdks/sdks/methods/incoming-phone-numbers/retrieve` | `/compatibility-api/sdks/sdks/methods/incoming-phone-numbers/retrieve` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/incoming-phone-numbers/update` | `/compatibility-api/sdks/sdks/methods/incoming-phone-numbers/update` | `/compatibility-api/sdks/sdks/methods/incoming-phone-numbers/update` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/media` | `/compatibility-api/sdks/sdks/methods/media` | `/compatibility-api/sdks/sdks/methods/media` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/media/delete` | `/compatibility-api/sdks/sdks/methods/media/delete` | `/compatibility-api/sdks/sdks/methods/media/delete` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/media/list` | `/compatibility-api/sdks/sdks/methods/media/list` | `/compatibility-api/sdks/sdks/methods/media/list` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/media/retrieve` | `/compatibility-api/sdks/sdks/methods/media/retrieve` | `/compatibility-api/sdks/sdks/methods/media/retrieve` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/messaging` | `/compatibility-api/sdks/sdks/methods/messaging` | `/compatibility-api/sdks/sdks/methods/messaging` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/messaging/create` | `/compatibility-api/sdks/sdks/methods/messaging/create` | `/compatibility-api/sdks/sdks/methods/messaging/create` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/messaging/delete` | `/compatibility-api/sdks/sdks/methods/messaging/delete` | `/compatibility-api/sdks/sdks/methods/messaging/delete` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/messaging/list` | `/compatibility-api/sdks/sdks/methods/messaging/list` | `/compatibility-api/sdks/sdks/methods/messaging/list` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/messaging/retrieve` | `/compatibility-api/sdks/sdks/methods/messaging/retrieve` | `/compatibility-api/sdks/sdks/methods/messaging/retrieve` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/messaging/update` | `/compatibility-api/sdks/sdks/methods/messaging/update` | `/compatibility-api/sdks/sdks/methods/messaging/update` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/queue-members` | `/compatibility-api/sdks/sdks/methods/queue-members` | `/compatibility-api/sdks/sdks/methods/queue-members` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/queue-members/list` | `/compatibility-api/sdks/sdks/methods/queue-members/list` | `/compatibility-api/sdks/sdks/methods/queue-members/list` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/queue-members/retrieve` | `/compatibility-api/sdks/sdks/methods/queue-members/retrieve` | `/compatibility-api/sdks/sdks/methods/queue-members/retrieve` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/queue-members/update` | `/compatibility-api/sdks/sdks/methods/queue-members/update` | `/compatibility-api/sdks/sdks/methods/queue-members/update` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/queues` | `/compatibility-api/sdks/sdks/methods/queues` | `/compatibility-api/sdks/sdks/methods/queues` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/queues/create` | `/compatibility-api/sdks/sdks/methods/queues/create` | `/compatibility-api/sdks/sdks/methods/queues/create` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/queues/delete` | `/compatibility-api/sdks/sdks/methods/queues/delete` | `/compatibility-api/sdks/sdks/methods/queues/delete` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/queues/list` | `/compatibility-api/sdks/sdks/methods/queues/list` | `/compatibility-api/sdks/sdks/methods/queues/list` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/queues/retrieve` | `/compatibility-api/sdks/sdks/methods/queues/retrieve` | `/compatibility-api/sdks/sdks/methods/queues/retrieve` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/queues/retrieve-members-waiting-in-queue` | `/compatibility-api/sdks/sdks/methods/queues/retrieve-members-waiting-in-queue` | `/compatibility-api/sdks/sdks/methods/queues/retrieve-members-waiting-in-queue` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/queues/update` | `/compatibility-api/sdks/sdks/methods/queues/update` | `/compatibility-api/sdks/sdks/methods/queues/update` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/recording-transcriptions` | `/compatibility-api/sdks/sdks/methods/recording-transcriptions` | `/compatibility-api/sdks/sdks/methods/recording-transcriptions` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/recording-transcriptions/delete` | `/compatibility-api/sdks/sdks/methods/recording-transcriptions/delete` | `/compatibility-api/sdks/sdks/methods/recording-transcriptions/delete` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/recording-transcriptions/list` | `/compatibility-api/sdks/sdks/methods/recording-transcriptions/list` | `/compatibility-api/sdks/sdks/methods/recording-transcriptions/list` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/recording-transcriptions/retrieve` | `/compatibility-api/sdks/sdks/methods/recording-transcriptions/retrieve` | `/compatibility-api/sdks/sdks/methods/recording-transcriptions/retrieve` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/recordings` | `/compatibility-api/sdks/sdks/methods/recordings` | `/compatibility-api/sdks/sdks/methods/recordings` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/recordings/create` | `/compatibility-api/sdks/sdks/methods/recordings/create` | `/compatibility-api/sdks/sdks/methods/recordings/create` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/recordings/delete` | `/compatibility-api/sdks/sdks/methods/recordings/delete` | `/compatibility-api/sdks/sdks/methods/recordings/delete` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/recordings/list` | `/compatibility-api/sdks/sdks/methods/recordings/list` | `/compatibility-api/sdks/sdks/methods/recordings/list` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/recordings/retrieve` | `/compatibility-api/sdks/sdks/methods/recordings/retrieve` | `/compatibility-api/sdks/sdks/methods/recordings/retrieve` | slug_changed | 1.000 |
| `/compatibility-api/client-sdks/methods/recordings/update` | `/compatibility-api/sdks/sdks/methods/recordings/update` | `/compatibility-api/sdks/sdks/methods/recordings/update` | slug_changed | 1.000 |
| `/compatibility-api/cxml/fax/reject` | `/compatibility-api/cxml/cxml/fax/reject` | `/compatibility-api/cxml/cxml/reference/fax/reject` | slug_changed | 0.904 |
| `/compatibility-api/cxml/messaging/redirect` | `/compatibility-api/cxml/cxml/messaging/redirect` | `/compatibility-api/cxml/cxml/reference/messaging/redirect` | slug_changed | 0.858 |
| `/compatibility-api/cxml/voice/connect` | `/compatibility-api/cxml/cxml/voice/connect` | `/compatibility-api/cxml/cxml/reference/voice/connect` | slug_changed | 0.878 |
| `/compatibility-api/cxml/voice/denoise` | `/compatibility-api/cxml/cxml/voice/denoise` | `/compatibility-api/cxml/cxml/reference/voice/denoise` | slug_changed | 0.987 |
| `/compatibility-api/cxml/voice/gather` | `/compatibility-api/cxml/cxml/voice/gather` | `/compatibility-api/cxml/cxml/reference/voice/gather` | slug_changed | 0.740 |
| `/compatibility-api/cxml/voice/hangup` | `/compatibility-api/cxml/cxml/voice/hangup` | `/compatibility-api/cxml/cxml/reference/voice/hangup` | slug_changed | 0.953 |
| `/compatibility-api/cxml/voice/leave` | `/compatibility-api/cxml/cxml/voice/leave` | `/compatibility-api/cxml/cxml/reference/voice/leave` | slug_changed | 0.957 |
| `/compatibility-api/cxml/voice/pause` | `/compatibility-api/cxml/cxml/voice/pause` | `/compatibility-api/cxml/cxml/reference/voice/pause` | slug_changed | 0.906 |
| `/compatibility-api/cxml/voice/pay/parameter` | `/compatibility-api/cxml/cxml/voice/pay/parameter` | `/compatibility-api/cxml/cxml/reference/voice/pay/parameter` | slug_changed | 0.986 |
| `/compatibility-api/cxml/voice/pay/prompt` | `/compatibility-api/cxml/cxml/voice/pay/prompt` | `/compatibility-api/cxml/cxml/reference/voice/pay/prompt` | slug_changed | 0.776 |
| `/compatibility-api/cxml/voice/play` | `/compatibility-api/cxml/cxml/voice/play` | `/compatibility-api/cxml/cxml/reference/voice/play` | slug_changed | 0.804 |
| `/compatibility-api/cxml/voice/queue-noun` | `/compatibility-api/cxml/cxml/voice/queue` | `/compatibility-api/cxml/cxml/reference/voice/queue` | slug_changed | 0.770 |
| `/compatibility-api/cxml/voice/redirect` | `/compatibility-api/cxml/cxml/voice/redirect` | `/compatibility-api/cxml/cxml/reference/voice/redirect` | slug_changed | 0.913 |
| `/compatibility-api/cxml/voice/refer` | `/compatibility-api/cxml/cxml/voice/refer` | `/compatibility-api/cxml/cxml/reference/voice/refer` | slug_changed | 0.745 |
| `/compatibility-api/cxml/voice/reject` | `/compatibility-api/cxml/cxml/voice/reject` | `/compatibility-api/cxml/cxml/reference/voice/reject` | slug_changed | 0.829 |
| `/compatibility-api/cxml/voice/room-noun` | `/compatibility-api/cxml/cxml/voice/room` | `/compatibility-api/cxml/cxml/reference/voice/room` | slug_changed | 0.886 |
| `/compatibility-api/cxml/voice/say` | `/compatibility-api/cxml/cxml/voice/say` | `/compatibility-api/cxml/cxml/reference/voice/say` | slug_changed | 0.729 |
| `/compatibility-api/cxml/voice/stream` | `/compatibility-api/cxml/cxml/voice/stream` | `/compatibility-api/cxml/cxml/reference/voice/stream` | slug_changed | 0.859 |
| `/compatibility-api/cxml/voice/verto-noun` | `/compatibility-api/cxml/cxml/voice/verto` | `/compatibility-api/cxml/cxml/reference/voice/verto` | slug_changed | 0.992 |
| `/compatibility-api/cxml/voice/virtualagent-noun` | `/compatibility-api/cxml/cxml/voice/virtualagent` | `/compatibility-api/cxml/cxml/reference/voice/virtualagent` | slug_changed | 0.802 |
| `/compatibility-api/sdks` | `/compatibility-api/sdks/sdks` | `/compatibility-api/sdks/sdks` | slug_changed | 1.000 |
| `/fax` | `/platform/calling/fax` | `/platform/calling/fax` | matched_changed | 1.000 |
| `/fax/getting-started/common-fax-errors` | `/platform/calling/fax/getting-started/common-fax-errors` | `/platform/calling/fax/common-fax-errors` | matched_changed | 1.000 |
| `/fax/getting-started/fax-to-email` | `/platform/calling/fax/getting-started/fax-to-email` | `/platform/calling/fax/fax-to-email` | matched_changed | 1.000 |
| `/fax/getting-started/fax-with-retries` | `/platform/calling/fax/getting-started/fax-with-retries` | `/platform/calling/fax/fax-with-retries` | matched_changed | 1.000 |
| `/fax/getting-started/filter-faxes-by-number-status-and-date` | `/platform/calling/fax/getting-started/filter-faxes-by-number-status-and-date` | `/platform/calling/fax/filter-faxes-by-number-status-and-date` | matched_changed | 1.000 |
| `/fax/getting-started/list-faxes-to-csv-in-all-languages` | `/platform/calling/fax/getting-started/list-faxes-to-csv-in-all-languages` | `/platform/calling/fax/list-faxes-to-csv-in-all-languages` | matched_changed | 1.000 |
| `/guides` | `/browser-sdk/guides/guides` | `/browser-sdk/guides/guides` | matched_changed | 1.000 |
| `/messaging` | `/platform/messaging/messaging` | `/platform/messaging/messaging` | matched_changed | 1.000 |
| `/messaging/faq` | `/platform/messaging/messaging/faq` | `/platform/messaging/messaging/messaging-faq` | matched_changed | 1.000 |
| `/messaging/get-started/campaign-registry` | `/platform/messaging/messaging/get-started/campaign-registry` | `/platform/messaging/messaging/campaign-registry` | matched_changed | 1.000 |
| `/messaging/getting-started/campaign-registry/campaign-service-providers` | `/platform/messaging/messaging/getting-started/campaign-registry/campaign-service-providers` | `/platform/messaging/messaging/campaign-service-providers` | matched_changed | 1.000 |
| `/messaging/getting-started/campaign-registry/faq` | `/platform/messaging/messaging/getting-started/campaign-registry/faq` | `/platform/messaging/messaging/campaign-registry-faq` | matched_changed | 1.000 |
| `/messaging/getting-started/campaign-registry/pricing` | `/platform/messaging/messaging/getting-started/campaign-registry/pricing` | `/platform/messaging/messaging/pricing` | matched_changed | 1.000 |
| `/messaging/getting-started/campaign-registry/registration` | `/platform/messaging/messaging/getting-started/campaign-registry/registration` | `/platform/messaging/messaging/registration` | matched_changed | 1.000 |
| `/messaging/getting-started/how-to-troubleshoot-common-messaging-issues` | `/platform/messaging/messaging/getting-started/how-to-troubleshoot-common-messaging-issues` | `/platform/messaging/messaging/how-to-troubleshoot-common-messaging-issues` | matched_changed | 1.000 |
| `/messaging/getting-started/platform-free-trial` | `/platform/messaging/messaging/getting-started/platform-free-trial` | `/platform/messaging/messaging/platform-free-trial` | matched_changed | 1.000 |
| `/messaging/getting-started/receiving-your-first-sms` | `/compatibility-api/cxml/cxml/guides/receiving-your-first-sms` | `/compatibility-api/cxml/guides/receiving-your-first-sms` | slug_changed | 0.914 |
| `/messaging/getting-started/sending-your-first-sms` | `/compatibility-api/cxml/cxml/guides/sending-your-first-sms` | `/compatibility-api/cxml/guides/sending-your-first-sms` | slug_changed | 0.966 |
| `/messaging/getting-started/sms-best-practices-how-to-ensure-message-delivery` | `/platform/messaging/messaging/getting-started/sms-best-practices-how-to-ensure-message-delivery` | `/platform/messaging/messaging/sms-best-practices-how-to-ensure-message-delivery` | matched_changed | 1.000 |
| `/messaging/guides/general/how-to-build-a-private-url-shortener` | `/platform/messaging/messaging/guides/general/how-to-build-a-private-url-shortener` | `/platform/messaging/messaging/how-to-build-a-private-url-shortener` | matched_changed | 1.000 |
| `/messaging/guides/general/how-to-find-unregistered-numbers-on-your-project` | `/platform/messaging/messaging/guides/general/how-to-find-unregistered-numbers-on-your-project` | `/platform/messaging/messaging/how-to-find-unregistered-numbers-on-your-project` | matched_changed | 1.000 |
| `/messaging/guides/general/messaging-character-limits` | `/platform/messaging/messaging/guides/general/messaging-character-limits` | `/platform/messaging/messaging/messaging-character-limits` | matched_changed | 1.000 |
| `/messaging/guides/general/messaging-mime-types` | `/platform/messaging/messaging/guides/general/messaging-mime-types` | `/platform/messaging/messaging/messaging-mime-types` | matched_changed | 1.000 |
| `/messaging/guides/general/toll-free-number-overview` | `/platform/messaging/messaging/guides/general/toll-free-number-overview` | `/platform/messaging/messaging/toll-free-number-overview` | matched_changed | 1.000 |
| `/messaging/guides/hosted-messaging` | `/platform/messaging/messaging/guides/hosted-messaging` | `/platform/messaging/messaging/hosted-messaging` | matched_changed | 1.000 |
| `/platform/basics/general/signalwire-rate-limits` | `/platform/platform/basics/general/signalwire-rate-limits` | `/platform/platform/basics/signalwire-rate-limits` | matched_changed | 1.000 |
| `/platform/basics/general/stir-shaken-all-you-need-to-know` | `/platform/platform/basics/general/stir-shaken-all-you-need-to-know` | `/platform/platform/basics/stir-shaken-all-you-need-to-know` | matched_changed | 1.000 |
| `/platform/basics/general/stun-vs-turn-vs-ice` | `/platform/platform/basics/general/stun-vs-turn-vs-ice` | `/platform/platform/basics/stun-vs-turn-vs-ice` | matched_changed | 1.000 |
| `/platform/basics/general/what-is-sip` | `/platform/platform/basics/general/what-is-sip` | `/platform/platform/basics/what-is-sip` | matched_changed | 1.000 |
| `/platform/basics/general/what-is-webrtc` | `/platform/platform/basics/general/what-is-webrtc` | `/platform/platform/basics/what-is-webrtc` | matched_changed | 1.000 |
| `/platform/basics/guides/getting-started-without-code` | `/platform/platform/basics/guides/getting-started-without-code` | `/platform/platform/basics/getting-started-without-code` | matched_changed | 1.000 |
| `/platform/basics/guides/how-to-test-api-requests-on-postman` | `/platform/platform/basics/guides/how-to-test-api-requests-on-postman` | `/platform/platform/basics/how-to-test-api-requests-on-postman` | matched_changed | 1.000 |
| `/platform/basics/guides/technical-troubleshooting/common-webhook-errors` | `/platform/platform/basics/guides/technical-troubleshooting/common-webhook-errors` | `/platform/platform/basics/common-webhook-errors` | matched_changed | 1.000 |
| `/platform/basics/guides/technical-troubleshooting/creating-a-publically-exposed-webhook` | `/platform/platform/basics/guides/technical-troubleshooting/creating-a-publically-exposed-webhook` | `/platform/platform/basics/creating-a-publically-exposed-webhook` | matched_changed | 1.000 |
| `/platform/basics/guides/technical-troubleshooting/how-to-test-webhooks-with-ngrok` | `/platform/platform/basics/guides/technical-troubleshooting/how-to-test-webhooks-with-ngrok` | `/platform/platform/basics/how-to-test-webhooks-with-ngrok` | matched_changed | 1.000 |
| `/platform/basics/guides/webrtc-with-sip-over-websockets` | `/platform/platform/basics/guides/webrtc-with-sip-over-websockets` | `/platform/platform/basics/webrtc-with-sip-over-websockets` | matched_changed | 1.000 |
| `/platform/basics/security-and-compliance/fraud` | `/platform/platform/basics/security-and-compliance/fraud` | `/platform/platform/basics/fraud` | matched_changed | 1.000 |
| `/platform/basics/security-and-compliance/hipaapci-compliance` | `/platform/platform/basics/security-and-compliance/hipaapci-compliance` | `/platform/platform/basics/hipaapci-compliance` | matched_changed | 1.000 |
| `/platform/basics/security-and-compliance/webhook-security` | `/platform/platform/basics/security-and-compliance/webhook-security` | `/platform/platform/basics/webhook-security` | matched_changed | 1.000 |
| `/platform/call-fabric` | `/platform/platform/call-fabric` | `/platform/platform/call-fabric` | matched_changed | 1.000 |
| `/platform/call-fabric/addresses` | `/platform/platform/call-fabric/addresses` | `/platform/platform/call-fabric/addresses` | matched_changed | 1.000 |
| `/platform/call-fabric/resources` | `/platform/platform/call-fabric/resources` | `/platform/platform/call-fabric/resources` | matched_changed | 1.000 |
| `/platform/call-fabric/resources/ai-agents` | `/platform/platform/call-fabric/resources/ai-agents` | `/platform/platform/call-fabric/ai-agents` | matched_changed | 1.000 |
| `/platform/call-fabric/resources/cxml-scripts` | `/platform/platform/call-fabric/resources/cxml-scripts` | `/platform/platform/call-fabric/cxml-scripts` | matched_changed | 1.000 |
| `/platform/call-fabric/resources/dialogflow-agents` | `/platform/platform/call-fabric/resources/dialogflow-agents` | `/platform/platform/call-fabric/dialogflow-agents` | matched_changed | 1.000 |
| `/platform/call-fabric/resources/freeswitch-connectors` | `/platform/platform/call-fabric/resources/freeswitch-connectors` | `/platform/platform/call-fabric/freeswitch-connectors` | matched_changed | 1.000 |
| `/platform/call-fabric/resources/relay-applications` | `/platform/platform/call-fabric/resources/relay-applications` | `/platform/platform/call-fabric/relay-applications` | matched_changed | 1.000 |
| `/platform/call-fabric/resources/sip-gateways` | `/platform/platform/call-fabric/resources/sip-gateways` | `/platform/platform/call-fabric/sip-gateways` | matched_changed | 1.000 |
| `/platform/call-fabric/resources/subscribers` | `/platform/platform/call-fabric/resources/subscribers` | `/platform/platform/call-fabric/resources-subscribers` | matched_changed | 1.000 |
| `/platform/call-fabric/resources/swml-scripts` | `/platform/platform/call-fabric/resources/swml-scripts` | `/platform/platform/call-fabric/swml-scripts` | matched_changed | 1.000 |
| `/platform/call-fabric/resources/video-rooms` | `/platform/platform/call-fabric/resources/video-rooms` | `/platform/platform/call-fabric/video-rooms` | matched_changed | 1.000 |
| `/platform/call-fabric/subscribers` | `/platform/platform/call-fabric/subscribers` | `/platform/platform/call-fabric/call-fabric-subscribers` | matched_changed | 1.000 |
| `/platform/dashboard` | `/platform/platform/dashboard` | `/platform/platform/dashboard` | matched_changed | 1.000 |
| `/platform/dashboard/billing` | `/platform/platform/dashboard/billing` | `/platform/platform/dashboard/billing` | matched_changed | 1.000 |
| `/platform/dashboard/get-started/phone-numbers` | `/platform/platform/dashboard/get-started/phone-numbers` | `/platform/platform/dashboard/phone-numbers` | matched_changed | 1.000 |
| `/platform/dashboard/getting-started/signing-up-for-a-space` | `/platform/platform/dashboard/getting-started/signing-up-for-a-space` | `/platform/platform/dashboard/signing-up-for-a-space` | matched_changed | 1.000 |
| `/platform/dashboard/getting-started/your-signalwire-api-space` | `/platform/platform/dashboard/getting-started/your-signalwire-api-space` | `/platform/platform/dashboard/your-signalwire-api-space` | matched_changed | 1.000 |
| `/platform/dashboard/guides/changing-settings-in-your-signalwire-space` | `/platform/platform/dashboard/guides/changing-settings-in-your-signalwire-space` | `/platform/platform/dashboard/changing-settings-in-your-signalwire-space` | matched_changed | 1.000 |
| `/platform/dashboard/guides/closing-a-signalwire-account` | `/platform/platform/dashboard/guides/closing-a-signalwire-account` | `/platform/platform/dashboard/closing-a-signalwire-account` | matched_changed | 1.000 |
| `/platform/dashboard/guides/export-logs-from-your-signalwire-space` | `/platform/platform/dashboard/guides/export-logs-from-your-signalwire-space` | `/platform/platform/dashboard/export-logs-from-your-signalwire-space` | matched_changed | 1.000 |
| `/platform/dashboard/guides/how-to-enable-international-outbound-dialing-sms` | `/platform/platform/dashboard/guides/how-to-enable-international-outbound-dialing-sms` | `/platform/platform/dashboard/how-to-enable-international-outbound-dialing-sms` | matched_changed | 1.000 |
| `/platform/dashboard/guides/how-to-request-an-increase-to-your-signalwire-space-limits` | `/platform/platform/dashboard/guides/how-to-request-an-increase-to-your-signalwire-space-limits` | `/platform/platform/dashboard/how-to-request-an-increase-to-your-signalwire-space-limits` | matched_changed | 1.000 |
| `/platform/dashboard/guides/media-protection` | `/platform/platform/dashboard/guides/media-protection` | `/platform/platform/dashboard/media-protection` | matched_changed | 1.000 |
| `/platform/dashboard/guides/subprojects` | `/platform/platform/dashboard/guides/subprojects` | `/platform/platform/dashboard/subprojects` | matched_changed | 1.000 |
| `/platform/dashboard/guides/suspended-signalwire-cloud-space` | `/platform/platform/dashboard/guides/suspended-signalwire-cloud-space` | `/platform/platform/dashboard/suspended-signalwire-cloud-space` | matched_changed | 1.000 |
| `/platform/dashboard/guides/user-management` | `/platform/platform/dashboard/guides/user-management` | `/platform/platform/dashboard/user-management` | matched_changed | 1.000 |
| `/platform/dashboard/guides/what-is-a-sid` | `/platform/platform/dashboard/guides/what-is-a-sid` | `/platform/platform/dashboard/what-is-a-sid` | matched_changed | 1.000 |
| `/platform/integrations/carriers/thinq` | `/platform/platform/integrations/carriers/thinq` | `/platform/platform/integrations/thinq` | matched_changed | 1.000 |
| `/platform/integrations/crm/zoho-crm-click-to-call` | `/platform/platform/integrations/crm/zoho-crm-click-to-call` | `/platform/platform/integrations/zoho-crm-click-to-call` | matched_changed | 1.000 |
| `/platform/integrations/dialogflow/dialogflow-agents` | `/platform/platform/integrations/dialogflow/dialogflow-agents` | `/platform/platform/integrations/dialogflow-agents` | matched_changed | 1.000 |
| `/platform/integrations/dialogflow/dialogflow-using-nodejs-to-get-caller-id-send-sms` | `/platform/platform/integrations/dialogflow/dialogflow-using-nodejs-to-get-caller-id-send-sms` | `/platform/platform/integrations/dialogflow-using-nodejs-to-get-caller-id-send-sms` | matched_changed | 1.000 |
| `/platform/integrations/freeswitch/add-ai-to-freeswitch` | `/platform/platform/integrations/freeswitch/add-ai-to-freeswitch` | `/platform/platform/integrations/add-ai-to-freeswitch` | matched_changed | 1.000 |
| `/platform/integrations/freeswitch/choosing-a-freeswitch-repository` | `/platform/platform/integrations/freeswitch/choosing-a-freeswitch-repository` | `/platform/platform/integrations/choosing-a-freeswitch-repository` | matched_changed | 1.000 |
| `/platform/integrations/freeswitch/freeswitch-crash-getting-a-backtrace-from-a-core-dump` | `/platform/platform/integrations/freeswitch/freeswitch-crash-getting-a-backtrace-from-a-core-dump` | `/platform/platform/integrations/freeswitch-crash-getting-a-backtrace-from-a-core-dump` | matched_changed | 1.000 |
| `/platform/integrations/freeswitch/freeswitch-memory-address-and-memory-pool-sanitizer` | `/platform/platform/integrations/freeswitch/freeswitch-memory-address-and-memory-pool-sanitizer` | `/platform/platform/integrations/freeswitch-memory-address-and-memory-pool-sanitizer` | matched_changed | 1.000 |
| `/platform/integrations/freeswitch/how-to-mod-signalwire-in-freeswitch-clean-and-reconfigure` | `/platform/platform/integrations/freeswitch/how-to-mod-signalwire-in-freeswitch-clean-and-reconfigure` | `/platform/platform/integrations/how-to-mod-signalwire-in-freeswitch-clean-and-reconfigure` | matched_changed | 1.000 |
| `/platform/integrations/freeswitch/installing-freeswitch-or-freeswitch-advantage` | `/platform/platform/integrations/freeswitch/installing-freeswitch-or-freeswitch-advantage` | `/platform/platform/integrations/installing-freeswitch-or-freeswitch-advantage` | matched_changed | 1.000 |
| `/platform/integrations/freeswitch/sending-an-sms-from-freeswitch-xml-dialplan-through-signalwire-cloud` | `/platform/platform/integrations/freeswitch/sending-an-sms-from-freeswitch-xml-dialplan-through-signalwire-cloud` | `/platform/platform/integrations/sending-an-sms-from-freeswitch-xml-dialplan-through-signalwire-cloud` | matched_changed | 1.000 |
| `/platform/integrations/messaging-services/textable` | `/platform/platform/integrations/messaging-services/textable` | `/platform/platform/integrations/textable` | matched_changed | 1.000 |
| `/platform/integrations/messaging-services/textit` | `/platform/platform/integrations/messaging-services/textit` | `/platform/platform/integrations/textit` | matched_changed | 1.000 |
| `/platform/integrations/pbx-systems/connect-fusionpbx-with-signalwire` | `/platform/platform/integrations/pbx-systems/connect-fusionpbx-with-signalwire` | `/platform/platform/integrations/connect-fusionpbx-with-signalwire` | matched_changed | 1.000 |
| `/platform/integrations/pbx-systems/set-up-chan-sip-freepbx-with-signalwire` | `/platform/platform/integrations/pbx-systems/set-up-chan-sip-freepbx-with-signalwire` | `/platform/platform/integrations/set-up-chan-sip-freepbx-with-signalwire` | matched_changed | 1.000 |
| `/platform/integrations/pbx-systems/set-up-freepbx-with-signalwire` | `/platform/platform/integrations/pbx-systems/set-up-freepbx-with-signalwire` | `/platform/platform/integrations/set-up-freepbx-with-signalwire` | matched_changed | 1.000 |
| `/platform/integrations/serverless-functions/google-cloud-functions` | `/platform/platform/integrations/serverless-functions/google-cloud-functions` | `/platform/platform/integrations/google-cloud-functions` | matched_changed | 1.000 |
| `/platform/integrations/serverless-functions/microsoft-azure-functions` | `/platform/platform/integrations/serverless-functions/microsoft-azure-functions` | `/platform/platform/integrations/microsoft-azure-functions` | matched_changed | 1.000 |
| `/platform/integrations/softphones/connect-signalwire-with-3cx` | `/platform/platform/integrations/softphones/connect-signalwire-with-3cx` | `/platform/platform/integrations/connect-signalwire-with-3cx` | matched_changed | 1.000 |
| `/platform/integrations/softphones/connect-signalwire-with-linphone` | `/platform/platform/integrations/softphones/connect-signalwire-with-linphone` | `/platform/platform/integrations/connect-signalwire-with-linphone` | matched_changed | 1.000 |
| `/platform/integrations/softphones/microsip-softphone` | `/platform/platform/integrations/softphones/microsip-softphone` | `/platform/platform/integrations/microsip-softphone` | matched_changed | 1.000 |
| `/platform/integrations/softphones/set-up-bria-softphone-with-signalwire` | `/platform/platform/integrations/softphones/set-up-bria-softphone-with-signalwire` | `/platform/platform/integrations/set-up-bria-softphone-with-signalwire` | matched_changed | 1.000 |
| `/platform/integrations/softphones/set-up-zoiper-softphone-with-signalwire` | `/platform/platform/integrations/softphones/set-up-zoiper-softphone-with-signalwire` | `/platform/platform/integrations/set-up-zoiper-softphone-with-signalwire` | matched_changed | 1.000 |
| `/platform/integrations/workflow-tools/how-to-integrate-signalwire-into-integromat` | `/platform/platform/integrations/workflow-tools/how-to-integrate-signalwire-into-integromat` | `/platform/platform/integrations/how-to-integrate-signalwire-into-integromat` | matched_changed | 1.000 |
| `/platform/integrations/workflow-tools/zapier/creating-a-zapier-zap` | `/platform/platform/integrations/workflow-tools/zapier/creating-a-zapier-zap` | `/platform/platform/integrations/creating-a-zapier-zap` | matched_changed | 1.000 |
| `/platform/integrations/workflow-tools/zapier/how-to-use-zapier-webhooks` | `/platform/platform/integrations/workflow-tools/zapier/how-to-use-zapier-webhooks` | `/platform/platform/integrations/how-to-use-zapier-webhooks` | matched_changed | 1.000 |
| `/platform/phone-numbers` | `/platform/platform/dashboard/get-started/phone-numbers` | `/platform/platform/dashboard/phone-numbers` | matched_changed | 1.000 |
| `/platform/phone-numbers/getting-started/buying-a-phone-number` | `/platform/platform/phone-numbers/getting-started/buying-a-phone-number` | `/platform/platform/phone-numbers/buying-a-phone-number` | matched_changed | 1.000 |
| `/platform/phone-numbers/getting-started/e911` | `/platform/platform/phone-numbers/getting-started/e911` | `/platform/platform/phone-numbers/e911` | matched_changed | 1.000 |
| `/platform/phone-numbers/getting-started/porting-into-signalwire` | `/platform/platform/phone-numbers/getting-started/porting-into-signalwire` | `/platform/platform/phone-numbers/porting-into-signalwire` | matched_changed | 1.000 |
| `/platform/phone-numbers/getting-started/what-is-e164` | `/platform/platform/phone-numbers/getting-started/what-is-e164` | `/platform/platform/phone-numbers/what-is-e164` | matched_changed | 1.000 |
| `/platform/phone-numbers/guides/caller-id` | `/platform/platform/phone-numbers/guides/caller-id` | `/platform/platform/phone-numbers/caller-id` | matched_changed | 1.000 |
| `/platform/phone-numbers/guides/how-to-configure-your-webhook` | `/platform/platform/phone-numbers/guides/how-to-configure-your-webhook` | `/platform/platform/phone-numbers/how-to-configure-your-webhook` | matched_changed | 1.000 |
| `/platform/phone-numbers/guides/number-groups` | `/platform/platform/phone-numbers/guides/number-groups` | `/platform/platform/phone-numbers/number-groups` | matched_changed | 1.000 |
| `/platform/phone-numbers/guides/porting-out-of-signalwire` | `/platform/platform/phone-numbers/guides/porting-out-of-signalwire` | `/platform/platform/phone-numbers/porting-out-of-signalwire` | matched_changed | 1.000 |
| `/platform/phone-numbers/guides/releasing-dids` | `/platform/platform/phone-numbers/guides/releasing-dids` | `/platform/platform/phone-numbers/releasing-dids` | matched_changed | 1.000 |
| `/platform/phone-numbers/guides/transferring-dids` | `/platform/platform/phone-numbers/guides/transferring-dids` | `/platform/platform/phone-numbers/transferring-dids` | matched_changed | 1.000 |
| `/sdks` | `/compatibility-api/sdks/sdks` | `/compatibility-api/sdks/sdks` | matched_changed | 1.000 |
| `/sdks/agents-sdk` | `/agents-sdk/guides` | `/agents-sdk/guides` | matched_changed | 1.000 |
| `/sdks/agents-sdk/advanced/call-recording` | `/agents-sdk/guides/advanced/call-recording` | `/agents-sdk/guides/guides/call-recording` | matched_changed | 1.000 |
| `/sdks/agents-sdk/advanced/call-transfer` | `/agents-sdk/guides/advanced/call-transfer` | `/agents-sdk/guides/guides/call-transfer` | matched_changed | 1.000 |
| `/sdks/agents-sdk/advanced/contexts-workflows` | `/agents-sdk/guides/advanced/contexts-workflows` | `/agents-sdk/guides/guides/contexts-workflows` | matched_changed | 1.000 |
| `/sdks/agents-sdk/advanced/mcp-gateway` | `/agents-sdk/guides/advanced/mcp-gateway` | `/agents-sdk/guides/guides/mcp-gateway` | matched_changed | 1.000 |
| `/sdks/agents-sdk/advanced/multi-agent` | `/agents-sdk/guides/advanced/multi-agent` | `/agents-sdk/guides/guides/multi-agent` | matched_changed | 1.000 |
| `/sdks/agents-sdk/advanced/search-knowledge` | `/agents-sdk/guides/advanced/search-knowledge` | `/agents-sdk/guides/guides/search-knowledge` | matched_changed | 1.000 |
| `/sdks/agents-sdk/advanced/state-management` | `/agents-sdk/guides/advanced/state-management` | `/agents-sdk/guides/guides/state-management` | matched_changed | 1.000 |
| `/sdks/agents-sdk/api/agent-base` | `/agents-sdk/reference/api/agent-base` | `/agents-sdk/reference/reference/agent-base` | matched_changed | 1.000 |
| `/sdks/agents-sdk/api/cli-sw-agent-init` | `/agents-sdk/reference/api/cli-sw-agent-init` | `/agents-sdk/reference/reference/cli-sw-agent-init` | matched_changed | 1.000 |
| `/sdks/agents-sdk/api/cli-sw-search` | `/agents-sdk/reference/api/cli-sw-search` | `/agents-sdk/reference/reference/cli-sw-search` | matched_changed | 1.000 |
| `/sdks/agents-sdk/api/cli/swaig-test` | `/agents-sdk/reference/api/cli/swaig-test` | `/agents-sdk/reference/reference/cli-swaig-test` | matched_changed | 1.000 |
| `/sdks/agents-sdk/api/configuration` | `/agents-sdk/reference/api/configuration` | `/agents-sdk/reference/reference/configuration` | matched_changed | 1.000 |
| `/sdks/agents-sdk/api/contexts` | `/agents-sdk/reference/api/contexts` | `/agents-sdk/reference/reference/contexts` | matched_changed | 1.000 |
| `/sdks/agents-sdk/api/data-map` | `/agents-sdk/reference/api/data-map` | `/agents-sdk/reference/reference/data-map` | matched_changed | 1.000 |
| `/sdks/agents-sdk/api/environment-variables` | `/agents-sdk/reference/api/environment-variables` | `/agents-sdk/reference/reference/environment-variables` | matched_changed | 1.000 |
| `/sdks/agents-sdk/api/function-result` | `/agents-sdk/reference/api/function-result` | `/agents-sdk/reference/reference/function-result` | matched_changed | 1.000 |
| `/sdks/agents-sdk/api/skill-base` | `/agents-sdk/reference/api/skill-base` | `/agents-sdk/reference/reference/skill-base` | matched_changed | 1.000 |
| `/sdks/agents-sdk/api/swaig-function` | `/agents-sdk/reference/api/swaig-function` | `/agents-sdk/reference/reference/swaig-function` | matched_changed | 1.000 |
| `/sdks/agents-sdk/api/swml-schema` | `/agents-sdk/reference/api/swml-schema` | `/agents-sdk/reference/reference/swml-schema` | matched_changed | 1.000 |
| `/sdks/agents-sdk/api/swml-service` | `/agents-sdk/reference/api/swml-service` | `/agents-sdk/reference/reference/swml-service` | matched_changed | 1.000 |
| `/sdks/agents-sdk/appendix/ai-parameters-reference` | `/agents-sdk/reference/appendix/ai-parameters-reference` | `/agents-sdk/reference/reference/ai-parameters-reference` | matched_changed | 1.000 |
| `/sdks/agents-sdk/appendix/best-practices` | `/agents-sdk/reference/appendix/best-practices` | `/agents-sdk/reference/reference/best-practices` | matched_changed | 1.000 |
| `/sdks/agents-sdk/appendix/changelog` | `/agents-sdk/reference/appendix/changelog` | `/agents-sdk/reference/reference/changelog` | matched_changed | 1.000 |
| `/sdks/agents-sdk/appendix/migration` | `/agents-sdk/reference/appendix/migration` | `/agents-sdk/reference/reference/migration` | matched_changed | 1.000 |
| `/sdks/agents-sdk/appendix/patterns` | `/agents-sdk/reference/appendix/patterns` | `/agents-sdk/reference/reference/patterns` | matched_changed | 1.000 |
| `/sdks/agents-sdk/appendix/troubleshooting` | `/agents-sdk/reference/appendix/troubleshooting` | `/agents-sdk/reference/reference/troubleshooting` | matched_changed | 1.000 |
| `/sdks/agents-sdk/building-agents/agent-base` | `/agents-sdk/guides/building-agents/agent-base` | `/agents-sdk/guides/guides/agent-base` | matched_changed | 1.000 |
| `/sdks/agents-sdk/building-agents/ai-parameters` | `/agents-sdk/guides/building-agents/ai-parameters` | `/agents-sdk/guides/guides/ai-parameters` | matched_changed | 1.000 |
| `/sdks/agents-sdk/building-agents/call-flow` | `/agents-sdk/guides/building-agents/call-flow` | `/agents-sdk/guides/guides/call-flow` | matched_changed | 1.000 |
| `/sdks/agents-sdk/building-agents/hints` | `/agents-sdk/guides/building-agents/hints` | `/agents-sdk/guides/guides/hints` | matched_changed | 1.000 |
| `/sdks/agents-sdk/building-agents/prompts-pom` | `/agents-sdk/guides/building-agents/prompts-pom` | `/agents-sdk/guides/guides/prompts-pom` | matched_changed | 1.000 |
| `/sdks/agents-sdk/building-agents/static-vs-dynamic` | `/agents-sdk/guides/building-agents/static-vs-dynamic` | `/agents-sdk/guides/guides/static-vs-dynamic` | matched_changed | 1.000 |
| `/sdks/agents-sdk/building-agents/voice-language` | `/agents-sdk/guides/building-agents/voice-language` | `/agents-sdk/guides/guides/voice-language` | matched_changed | 1.000 |
| `/sdks/agents-sdk/core-concepts/architecture` | `/agents-sdk/guides/core-concepts/architecture` | `/agents-sdk/guides/guides/architecture` | matched_changed | 1.000 |
| `/sdks/agents-sdk/core-concepts/lifecycle` | `/agents-sdk/guides/core-concepts/lifecycle` | `/agents-sdk/guides/guides/lifecycle` | matched_changed | 1.000 |
| `/sdks/agents-sdk/core-concepts/security` | `/agents-sdk/guides/core-concepts/security` | `/agents-sdk/guides/guides/security` | matched_changed | 1.000 |
| `/sdks/agents-sdk/core-concepts/swaig` | `/agents-sdk/guides/core-concepts/swaig` | `/agents-sdk/guides/guides/swaig` | matched_changed | 1.000 |
| `/sdks/agents-sdk/core-concepts/swml` | `/agents-sdk/guides/core-concepts/swml` | `/agents-sdk/guides/guides/swml` | matched_changed | 1.000 |
| `/sdks/agents-sdk/deployment/cgi-mode` | `/agents-sdk/guides/deployment/cgi-mode` | `/agents-sdk/guides/guides/cgi-mode` | matched_changed | 1.000 |
| `/sdks/agents-sdk/deployment/docker-kubernetes` | `/agents-sdk/guides/deployment/docker-kubernetes` | `/agents-sdk/guides/guides/docker-kubernetes` | matched_changed | 1.000 |
| `/sdks/agents-sdk/deployment/local-development` | `/agents-sdk/guides/deployment/local-development` | `/agents-sdk/guides/guides/local-development` | matched_changed | 1.000 |
| `/sdks/agents-sdk/deployment/production` | `/agents-sdk/guides/deployment/production` | `/agents-sdk/guides/guides/production` | matched_changed | 1.000 |
| `/sdks/agents-sdk/deployment/serverless` | `/agents-sdk/guides/deployment/serverless` | `/agents-sdk/guides/guides/serverless` | matched_changed | 1.000 |
| `/sdks/agents-sdk/dev-environment` | `/agents-sdk/guides/dev-environment` | `/agents-sdk/guides/guides/dev-environment` | matched_changed | 1.000 |
| `/sdks/agents-sdk/examples/by-complexity` | `/agents-sdk/guides/examples/by-complexity` | `/agents-sdk/guides/guides/by-complexity` | matched_changed | 1.000 |
| `/sdks/agents-sdk/examples/by-feature` | `/agents-sdk/guides/examples/by-feature` | `/agents-sdk/guides/guides/by-feature` | matched_changed | 1.000 |
| `/sdks/agents-sdk/exposing-agents` | `/agents-sdk/guides/exposing-agents` | `/agents-sdk/guides/guides/exposing-agents` | matched_changed | 1.000 |
| `/sdks/agents-sdk/installation` | `/agents-sdk/guides/installation` | `/agents-sdk/guides/guides/installation` | matched_changed | 1.000 |
| `/sdks/agents-sdk/prefabs/concierge` | `/agents-sdk/guides/prefabs/concierge` | `/agents-sdk/guides/guides/concierge` | matched_changed | 1.000 |
| `/sdks/agents-sdk/prefabs/faq-bot` | `/agents-sdk/guides/prefabs/faq-bot` | `/agents-sdk/guides/guides/faq-bot` | matched_changed | 1.000 |
| `/sdks/agents-sdk/prefabs/info-gatherer` | `/agents-sdk/guides/prefabs/info-gatherer` | `/agents-sdk/guides/guides/info-gatherer` | matched_changed | 1.000 |
| `/sdks/agents-sdk/prefabs/receptionist` | `/agents-sdk/guides/prefabs/receptionist` | `/agents-sdk/guides/guides/receptionist` | matched_changed | 1.000 |
| `/sdks/agents-sdk/prefabs/survey` | `/agents-sdk/guides/prefabs/survey` | `/agents-sdk/guides/guides/survey` | matched_changed | 1.000 |
| `/sdks/agents-sdk/quickstart` | `/agents-sdk/guides/quickstart` | `/agents-sdk/guides/guides/quickstart` | matched_changed | 1.000 |
| `/sdks/agents-sdk/signalwire-integration/account-setup` | `/agents-sdk/guides/signalwire-integration/account-setup` | `/agents-sdk/guides/guides/account-setup` | matched_changed | 1.000 |
| `/sdks/agents-sdk/signalwire-integration/mapping-numbers` | `/agents-sdk/guides/signalwire-integration/mapping-numbers` | `/agents-sdk/guides/guides/mapping-numbers` | matched_changed | 1.000 |
| `/sdks/agents-sdk/signalwire-integration/phone-numbers` | `/agents-sdk/guides/signalwire-integration/phone-numbers` | `/agents-sdk/guides/guides/phone-numbers` | matched_changed | 1.000 |
| `/sdks/agents-sdk/signalwire-integration/testing` | `/agents-sdk/guides/signalwire-integration/testing` | `/agents-sdk/guides/guides/testing` | matched_changed | 1.000 |
| `/sdks/agents-sdk/signalwire-integration/troubleshooting` | `/agents-sdk/guides/signalwire-integration/troubleshooting` | `/agents-sdk/guides/guides/troubleshooting` | matched_changed | 1.000 |
| `/sdks/agents-sdk/skills/adding-skills` | `/agents-sdk/guides/skills/adding-skills` | `/agents-sdk/guides/guides/adding-skills` | matched_changed | 1.000 |
| `/sdks/agents-sdk/skills/builtin-skills` | `/agents-sdk/guides/skills/builtin-skills` | `/agents-sdk/guides/guides/builtin-skills` | matched_changed | 1.000 |
| `/sdks/agents-sdk/skills/custom` | `/agents-sdk/guides/skills/custom` | `/agents-sdk/guides/guides/custom` | matched_changed | 1.000 |
| `/sdks/agents-sdk/skills/skill-config` | `/agents-sdk/guides/skills/skill-config` | `/agents-sdk/guides/guides/skill-config` | matched_changed | 1.000 |
| `/sdks/agents-sdk/skills/understanding-skills` | `/agents-sdk/guides/skills/understanding-skills` | `/agents-sdk/guides/guides/understanding-skills` | matched_changed | 1.000 |
| `/sdks/agents-sdk/swaig-functions/datamap` | `/agents-sdk/guides/swaig-functions/datamap` | `/agents-sdk/guides/guides/datamap` | matched_changed | 1.000 |
| `/sdks/agents-sdk/swaig-functions/defining-functions` | `/agents-sdk/guides/swaig-functions/defining-functions` | `/agents-sdk/guides/guides/defining-functions` | matched_changed | 1.000 |
| `/sdks/agents-sdk/swaig-functions/native-functions` | `/agents-sdk/guides/swaig-functions/native-functions` | `/agents-sdk/guides/guides/native-functions` | matched_changed | 1.000 |
| `/sdks/agents-sdk/swaig-functions/parameters` | `/agents-sdk/guides/swaig-functions/parameters` | `/agents-sdk/guides/guides/parameters` | matched_changed | 1.000 |
| `/sdks/agents-sdk/swaig-functions/results-actions` | `/agents-sdk/guides/swaig-functions/results-actions` | `/agents-sdk/guides/guides/results-actions` | matched_changed | 1.000 |
| `/sdks/browser-sdk/chat` | `/browser-sdk/reference/reference/chat` | `/browser-sdk/reference/reference/chat` | slug_changed | 0.951 |
| `/sdks/browser-sdk/chat/member` | `/browser-sdk/reference/reference/chat/chat-member` | `/browser-sdk/reference/reference/chat/chat-member` | slug_changed | 0.900 |
| `/sdks/browser-sdk/chat/message` | `/browser-sdk/reference/reference/chat/chat-message` | `/browser-sdk/reference/reference/chat/chat-message` | slug_changed | 0.836 |
| `/sdks/browser-sdk/guides` | `/browser-sdk/guides/guides` | `/browser-sdk/guides/guides` | matched_changed | 1.000 |
| `/sdks/browser-sdk/guides/video/get-thumbnails-for-your-video-calls` | `/browser-sdk/guides/guides/display-call-thumbnails` | `/browser-sdk/guides/guides/display-call-thumbnails` | matched_changed | 1.000 |
| `/sdks/browser-sdk/guides/video/interactive-live-streaming` | `/browser-sdk/guides/guides/interactive-live-streaming` | `/browser-sdk/guides/guides/interactive-live-streaming` | matched_changed | 1.000 |
| `/sdks/browser-sdk/guides/video/recording-video` | `/browser-sdk/guides/guides/record-calls` | `/browser-sdk/guides/guides/record-calls` | matched_changed | 1.000 |
| `/sdks/browser-sdk/guides/video/streaming-to-youtube-and-other-platforms` | `/browser-sdk/guides/guides/stream-to-youtube-and-other-platforms` | `/browser-sdk/guides/guides/stream-to-youtube-and-other-platforms` | matched_changed | 1.000 |
| `/sdks/browser-sdk/guides/video/switch-webcam-or-microphone` | `/browser-sdk/guides/guides/switch-devices-during-calls` | `/browser-sdk/guides/guides/switch-devices-during-calls` | slug_changed | 0.882 |
| `/sdks/browser-sdk/pubsub` | `/browser-sdk/reference/reference/pubsub` | `/browser-sdk/reference/reference/pubsub` | slug_changed | 0.962 |
| `/sdks/browser-sdk/pubsub/message` | `/browser-sdk/reference/reference/pubsub/pubsub-message` | `/browser-sdk/reference/reference/pubsub/pubsub-message` | slug_changed | 0.900 |
| `/sdks/browser-sdk/signalwire-client` | `/browser-sdk/reference/reference/signalwire-client` | `/browser-sdk/reference/reference/signalwire-client` | slug_changed | 0.951 |
| `/sdks/browser-sdk/signalwire-client/client/address` | `/browser-sdk/reference/reference/signalwire-client/client/address` | `/browser-sdk/reference/reference/signalwire-client/client/address` | slug_changed | 1.000 |
| `/sdks/browser-sdk/signalwire-client/client/chat` | `/browser-sdk/reference/reference/signalwire-client/client/chat` | `/browser-sdk/reference/reference/signalwire-client/client/chat` | slug_changed | 0.999 |
| `/sdks/browser-sdk/signalwire-client/client/conversation` | `/browser-sdk/reference/reference/signalwire-client/client/conversation` | `/browser-sdk/reference/reference/signalwire-client/client/conversation` | slug_changed | 1.000 |
| `/sdks/browser-sdk/signalwire-client/notifications` | `/browser-sdk/reference/reference/signalwire-client/notifications` | `/browser-sdk/reference/reference/signalwire-client/notifications` | slug_changed | 1.000 |
| `/sdks/browser-sdk/signalwire-client/utils` | `/browser-sdk/reference/reference/signalwire-client/utils` | `/browser-sdk/reference/reference/signalwire-client/utils` | slug_changed | 0.996 |
| `/sdks/browser-sdk/technical-reference` | `/browser-sdk/reference/reference` | `/browser-sdk/reference/reference` | slug_changed | 0.730 |
| `/sdks/browser-sdk/v2` | `/browser-sdk/v2` | `/browser-sdk/v2` | matched_changed | 1.000 |
| `/sdks/browser-sdk/v2/call` | `/browser-sdk/v2/reference/call` | `/browser-sdk/v2/reference/call` | slug_changed | 1.000 |
| `/sdks/browser-sdk/v2/client` | `/browser-sdk/v2/reference/relay-client` | `/browser-sdk/v2/reference/relay-client` | slug_changed | 0.900 |
| `/sdks/browser-sdk/v2/guides/v2-vs-v3` | `/browser-sdk/v2/reference/v2-vs-v3` | `/browser-sdk/v2/reference/v2-vs-v3` | slug_changed | 0.998 |
| `/sdks/browser-sdk/v2/notification` | `/browser-sdk/v2/reference/notification` | `/browser-sdk/v2/reference/notification` | slug_changed | 1.000 |
| `/sdks/browser-sdk/video/local-overlay` | `/browser-sdk/reference/reference/video/local-overlay` | `/browser-sdk/reference/reference/video/local-overlay` | slug_changed | 0.758 |
| `/sdks/browser-sdk/video/room-device` | `/browser-sdk/reference/reference/video/room-device` | `/browser-sdk/reference/reference/video/room-device` | slug_changed | 0.945 |
| `/sdks/browser-sdk/video/room-screenshare` | `/browser-sdk/reference/reference/video/room-screen-share` | `/browser-sdk/reference/reference/video/room-screen-share` | slug_changed | 0.959 |
| `/sdks/browser-sdk/video/room-session-device` | `/browser-sdk/reference/reference/video/room-device` | `/browser-sdk/reference/reference/video/room-device` | slug_changed | 0.885 |
| `/sdks/browser-sdk/video/room-session-playback` | `/browser-sdk/reference/reference/video/room-session-playback` | `/browser-sdk/reference/reference/video/room-session-playback` | slug_changed | 0.716 |
| `/sdks/browser-sdk/video/room-session-screenshare` | `/browser-sdk/reference/reference/video/room-screen-share` | `/browser-sdk/reference/reference/video/room-screen-share` | slug_changed | 0.918 |
| `/sdks/realtime-sdk` | `/realtime-sdk/reference` | `/realtime-sdk/reference` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/chat` | `/realtime-sdk/reference/reference/chat` | `/realtime-sdk/reference/reference/chat` | slug_changed | 0.805 |
| `/sdks/realtime-sdk/chat/chat-member` | `/realtime-sdk/reference/reference/chat/chat-member` | `/realtime-sdk/reference/reference/chat/chat-member` | slug_changed | 0.937 |
| `/sdks/realtime-sdk/chat/chat-message` | `/realtime-sdk/reference/reference/chat/chat-message` | `/realtime-sdk/reference/reference/chat/chat-message` | slug_changed | 0.925 |
| `/sdks/realtime-sdk/chat/client` | `/realtime-sdk/reference/chat/client` | `/realtime-sdk/reference/chat-client [collision]` | slug_changed | 0.788 |
| `/sdks/realtime-sdk/guides` | `/realtime-sdk/guides/guides` | `/realtime-sdk/guides/guides` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/guides/messaging/first-steps-with-messaging` | `/realtime-sdk/guides/guides/first-steps-with-messaging` | `/realtime-sdk/guides/guides/first-steps-with-messaging` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/guides/messaging/forwarding-texts-to-email` | `/realtime-sdk/v3/guides/messaging/forwarding-texts-to-email-nodejs` | `/realtime-sdk/v3/guides/forwarding-texts-to-email-nodejs` | slug_changed | 0.793 |
| `/sdks/realtime-sdk/guides/messaging/send-sms-from-the-browser` | `/realtime-sdk/v3/guides/messaging/send-sms-from-the-browser-using-node-js` | `/realtime-sdk/v3/guides/send-sms-from-the-browser-using-node-js` | slug_changed | 0.839 |
| `/sdks/realtime-sdk/guides/voice/first-steps-with-voice` | `/realtime-sdk/v3/guides/voice/first-steps-with-voice` | `/realtime-sdk/v3/guides/first-steps-with-voice` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/guides/voice/setting-up-voicemail` | `/realtime-sdk/guides/guides/make-a-voicemail-responder-with-the-realtime-sdk` | `/realtime-sdk/guides/guides/make-a-voicemail-responder-with-the-realtime-sdk` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/guides/voice/stop-robocalls` | `/realtime-sdk/guides/guides/filter-robocalls-to-lenny-with-the-realtime-sdk` | `/realtime-sdk/guides/guides/filter-robocalls-to-lenny-with-the-realtime-sdk` | slug_changed | 0.896 |
| `/sdks/realtime-sdk/guides/voice/weather-phone` | `/realtime-sdk/guides/guides/make-a-weather-phone-ivr-with-the-realtime-sdk` | `/realtime-sdk/guides/guides/make-a-weather-phone-ivr-with-the-realtime-sdk` | slug_changed | 0.898 |
| `/sdks/realtime-sdk/messaging` | `/realtime-sdk/reference/reference/messaging` | `/realtime-sdk/reference/reference/messaging` | slug_changed | 0.769 |
| `/sdks/realtime-sdk/messaging/client` | `/realtime-sdk/reference/messaging/client` | `/realtime-sdk/reference/messaging-client [collision]` | slug_changed | 0.852 |
| `/sdks/realtime-sdk/messaging/message-contract` | `/realtime-sdk/reference/reference/messaging/message-contract` | `/realtime-sdk/reference/reference/messaging/message-contract` | slug_changed | 0.908 |
| `/sdks/realtime-sdk/messaging/messaging-sendresult` | `/realtime-sdk/reference/reference/messaging/messaging-send-result` | `/realtime-sdk/reference/reference/messaging/messaging-send-result` | slug_changed | 0.901 |
| `/sdks/realtime-sdk/pubsub` | `/realtime-sdk/reference/reference/pubsub` | `/realtime-sdk/reference/reference/pubsub` | slug_changed | 0.786 |
| `/sdks/realtime-sdk/pubsub/client` | `/realtime-sdk/reference/pubsub/client` | `/realtime-sdk/reference/pubsub-client [collision]` | slug_changed | 0.790 |
| `/sdks/realtime-sdk/pubsub/pubsubmessage` | `/realtime-sdk/reference/reference/pubsub/pubsub-message` | `/realtime-sdk/reference/reference/pubsub/pubsub-message` | slug_changed | 0.828 |
| `/sdks/realtime-sdk/task` | `/realtime-sdk/reference/reference/task` | `/realtime-sdk/reference/reference/task` | slug_changed | 0.862 |
| `/sdks/realtime-sdk/task/client` | `/realtime-sdk/reference/task/client` | `/realtime-sdk/reference/task-client [collision]` | slug_changed | 0.768 |
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
| `/sdks/realtime-sdk/v3/chat/client` | `/realtime-sdk/v3/reference/chat/client` | `/realtime-sdk/v3/reference/chat-client [collision]` | slug_changed | 0.840 |
| `/sdks/realtime-sdk/v3/chat/member` | `/realtime-sdk/v3/reference/chat/chat-member` | `/realtime-sdk/v3/reference/chat/chat-member` | slug_changed | 0.900 |
| `/sdks/realtime-sdk/v3/chat/message` | `/realtime-sdk/v3/reference/chat/chat-message` | `/realtime-sdk/v3/reference/chat/chat-message` | slug_changed | 0.900 |
| `/sdks/realtime-sdk/v3/guides` | `/realtime-sdk/v3/guides` | `/realtime-sdk/v3/guides` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v3/guides/messaging/first-steps-with-messaging` | `/realtime-sdk/v3/guides/messaging/first-steps-with-messaging` | `/realtime-sdk/v3/guides/first-steps-with-messaging` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v3/guides/messaging/forwarding-texts-to-email` | `/realtime-sdk/v3/guides/messaging/forwarding-texts-to-email-nodejs` | `/realtime-sdk/v3/guides/forwarding-texts-to-email-nodejs` | slug_changed | 0.842 |
| `/sdks/realtime-sdk/v3/guides/messaging/send-sms-from-the-browser` | `/realtime-sdk/v3/guides/messaging/send-sms-from-the-browser-using-node-js` | `/realtime-sdk/v3/guides/send-sms-from-the-browser-using-node-js` | slug_changed | 0.871 |
| `/sdks/realtime-sdk/v3/guides/realtime-relay-v4-vs-v3` | `/realtime-sdk/v3/guides/realtime-relay-v4-vs-v3` | `/realtime-sdk/v3/guides/realtime-relay-v4-vs-v3` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v3/guides/voice/first-steps-with-voice` | `/realtime-sdk/v3/guides/voice/first-steps-with-voice` | `/realtime-sdk/v3/guides/first-steps-with-voice` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v3/guides/voice/setting-up-voicemail` | `/realtime-sdk/v3/guides/voice/setting-up-voicemail` | `/realtime-sdk/v3/guides/setting-up-voicemail` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v3/guides/voice/weather-phone` | `/realtime-sdk/v3/guides/voice/weather-phone-with-signalwire-realtime-api` | `/realtime-sdk/v3/guides/weather-phone-with-signalwire-realtime-api` | slug_changed | 0.884 |
| `/sdks/realtime-sdk/v3/messaging` | `/realtime-sdk/v3/reference/messaging` | `/realtime-sdk/v3/reference/messaging` | slug_changed | 0.795 |
| `/sdks/realtime-sdk/v3/messaging/client` | `/realtime-sdk/v3/reference/messaging/client` | `/realtime-sdk/v3/reference/messaging-client [collision]` | slug_changed | 0.822 |
| `/sdks/realtime-sdk/v3/messaging/message-contract` | `/realtime-sdk/v3/reference/messaging/message-contract` | `/realtime-sdk/v3/reference/messaging/message-contract` | slug_changed | 0.946 |
| `/sdks/realtime-sdk/v3/messaging/messaging-sendresult` | `/realtime-sdk/v3/reference/messaging/messaging-send-result` | `/realtime-sdk/v3/reference/messaging/messaging-send-result` | slug_changed | 0.963 |
| `/sdks/realtime-sdk/v3/pubsub` | `/realtime-sdk/v3/reference/pubsub` | `/realtime-sdk/v3/reference/pubsub` | slug_changed | 0.781 |
| `/sdks/realtime-sdk/v3/pubsub/client` | `/realtime-sdk/v3/reference/pubsub/client` | `/realtime-sdk/v3/reference/pubsub-client [collision]` | slug_changed | 0.811 |
| `/sdks/realtime-sdk/v3/realtime-client` | `/realtime-sdk/v3/reference/realtime-client` | `/realtime-sdk/v3/reference/realtime-client` | slug_changed | 0.792 |
| `/sdks/realtime-sdk/v3/task` | `/realtime-sdk/v3/reference/task` | `/realtime-sdk/v3/reference/task` | slug_changed | 0.940 |
| `/sdks/realtime-sdk/v3/task/client` | `/realtime-sdk/v3/reference/task/client` | `/realtime-sdk/v3/reference/task-client [collision]` | slug_changed | 0.789 |
| `/sdks/realtime-sdk/v3/tech-ref/pubsub/pubsub-pubsubmessage` | `/realtime-sdk/v3/reference/pubsub/pubsub-message` | `/realtime-sdk/v3/reference/pubsub/pubsub-message` | matched_changed | 1.000 |
| `/sdks/realtime-sdk/v3/video` | `/realtime-sdk/v3/reference/video` | `/realtime-sdk/v3/reference/video` | slug_changed | 0.702 |
| `/sdks/realtime-sdk/v3/video/room-session` | `/realtime-sdk/v3/reference/video/room-session` | `/realtime-sdk/v3/reference/video-room-session [collision]` | slug_changed | 0.939 |
| `/sdks/realtime-sdk/v3/video/roomsession-fullstate` | `/realtime-sdk/v3/reference/video/room-session-full-state` | `/realtime-sdk/v3/reference/video/room-session-full-state` | slug_changed | 0.932 |
| `/sdks/realtime-sdk/v3/video/roomsession-member` | `/realtime-sdk/v3/reference/video/room-session-member` | `/realtime-sdk/v3/reference/video/room-session-member` | slug_changed | 0.958 |
| `/sdks/realtime-sdk/v3/video/roomsession-playback` | `/realtime-sdk/v3/reference/video/room-session-playback` | `/realtime-sdk/v3/reference/video/room-session-playback` | slug_changed | 0.965 |
| `/sdks/realtime-sdk/v3/video/roomsession-recording` | `/realtime-sdk/v3/reference/video/room-session-recording` | `/realtime-sdk/v3/reference/video/room-session-recording` | slug_changed | 0.970 |
| `/sdks/realtime-sdk/v3/video/roomsession-stream` | `/realtime-sdk/v3/reference/video/room-session-stream` | `/realtime-sdk/v3/reference/video/room-session-stream` | slug_changed | 0.966 |
| `/sdks/realtime-sdk/v3/voice/call` | `/realtime-sdk/v3/reference/voice/call` | `/realtime-sdk/v3/reference/voice-call [collision]` | slug_changed | 0.868 |
| `/sdks/realtime-sdk/v3/voice/call-collect` | `/realtime-sdk/v3/reference/voice/call-collect` | `/realtime-sdk/v3/reference/voice/call-collect` | slug_changed | 0.991 |
| `/sdks/realtime-sdk/v3/voice/call-detect` | `/realtime-sdk/v3/reference/voice/call-detect` | `/realtime-sdk/v3/reference/voice/call-detect` | slug_changed | 0.981 |
| `/sdks/realtime-sdk/v3/voice/call-playback` | `/realtime-sdk/v3/reference/voice/call-playback` | `/realtime-sdk/v3/reference/voice/call-playback` | slug_changed | 0.983 |
| `/sdks/realtime-sdk/v3/voice/call-prompt` | `/realtime-sdk/v3/reference/voice/call-prompt` | `/realtime-sdk/v3/reference/voice/call-prompt` | slug_changed | 0.981 |
| `/sdks/realtime-sdk/v3/voice/call-recording` | `/realtime-sdk/v3/reference/voice/call-recording` | `/realtime-sdk/v3/reference/voice/call-recording` | slug_changed | 0.982 |
| `/sdks/realtime-sdk/v3/voice/call-state` | `/realtime-sdk/v3/reference/voice/call-state` | `/realtime-sdk/v3/reference/voice/call-state` | slug_changed | 0.950 |
| `/sdks/realtime-sdk/v3/voice/call-tap` | `/realtime-sdk/v3/reference/voice/call-tap` | `/realtime-sdk/v3/reference/voice/call-tap` | slug_changed | 0.984 |
| `/sdks/realtime-sdk/v3/voice/client` | `/realtime-sdk/v3/reference/voice/client` | `/realtime-sdk/v3/reference/voice-client [collision]` | slug_changed | 0.856 |
| `/sdks/realtime-sdk/v3/voice/device-builder` | `/realtime-sdk/v3/reference/voice/device-builder` | `/realtime-sdk/v3/reference/voice/device-builder` | slug_changed | 0.948 |
| `/sdks/realtime-sdk/v3/voice/playlist` | `/realtime-sdk/v3/reference/voice/playlist` | `/realtime-sdk/v3/reference/voice/playlist` | slug_changed | 0.840 |
| `/sdks/realtime-sdk/v3/voice/types` | `/realtime-sdk/v3/reference/voice/types` | `/realtime-sdk/v3/reference/voice/types` | slug_changed | 0.981 |
| `/sdks/realtime-sdk/video/room-session-member` | `/realtime-sdk/reference/reference/video/room-session-member` | `/realtime-sdk/reference/reference/video/room-session-member` | slug_changed | 0.936 |
| `/sdks/realtime-sdk/video/room-session-playback` | `/realtime-sdk/reference/reference/video/room-session-playback` | `/realtime-sdk/reference/reference/video/room-session-playback` | slug_changed | 0.943 |
| `/sdks/realtime-sdk/video/roomsession` | `/realtime-sdk/reference/video/room-session` | `/realtime-sdk/reference/video-room-session [collision]` | slug_changed | 0.868 |
| `/sdks/realtime-sdk/video/roomsession-fullstate` | `/realtime-sdk/reference/reference/video/room-session-full-state` | `/realtime-sdk/reference/reference/video/room-session-full-state` | slug_changed | 0.904 |
| `/sdks/realtime-sdk/video/roomsession-recording` | `/realtime-sdk/reference/reference/video/room-session-recording` | `/realtime-sdk/reference/reference/video/room-session-recording` | slug_changed | 0.954 |
| `/sdks/realtime-sdk/video/roomsession-stream` | `/realtime-sdk/reference/reference/video/room-session-stream` | `/realtime-sdk/reference/reference/video/room-session-stream` | slug_changed | 0.935 |
| `/sdks/realtime-sdk/voice/call` | `/realtime-sdk/reference/voice/call` | `/realtime-sdk/reference/voice-call [collision]` | slug_changed | 0.830 |
| `/sdks/realtime-sdk/voice/call-collect` | `/realtime-sdk/reference/reference/voice/call-collect` | `/realtime-sdk/reference/reference/voice/call-collect` | slug_changed | 0.955 |
| `/sdks/realtime-sdk/voice/call-detect` | `/realtime-sdk/reference/reference/voice/call-detect` | `/realtime-sdk/reference/reference/voice/call-detect` | slug_changed | 0.968 |
| `/sdks/realtime-sdk/voice/call-playback` | `/realtime-sdk/reference/reference/voice/call-playback` | `/realtime-sdk/reference/reference/voice/call-playback` | slug_changed | 0.974 |
| `/sdks/realtime-sdk/voice/call-prompt` | `/realtime-sdk/reference/reference/voice/call-prompt` | `/realtime-sdk/reference/reference/voice/call-prompt` | slug_changed | 0.961 |
| `/sdks/realtime-sdk/voice/call-recording` | `/realtime-sdk/reference/reference/voice/call-recording` | `/realtime-sdk/reference/reference/voice/call-recording` | slug_changed | 0.976 |
| `/sdks/realtime-sdk/voice/call-state` | `/realtime-sdk/reference/reference/voice/call-state` | `/realtime-sdk/reference/reference/voice/call-state` | slug_changed | 0.945 |
| `/sdks/realtime-sdk/voice/call-tap` | `/realtime-sdk/reference/reference/voice/call-tap` | `/realtime-sdk/reference/reference/voice/call-tap` | slug_changed | 0.974 |
| `/sdks/realtime-sdk/voice/client` | `/realtime-sdk/reference/voice/client` | `/realtime-sdk/reference/voice-client [collision]` | slug_changed | 0.798 |
| `/sdks/realtime-sdk/voice/device-builder` | `/realtime-sdk/reference/reference/voice/device-builder` | `/realtime-sdk/reference/reference/voice/device-builder` | slug_changed | 0.927 |
| `/sdks/realtime-sdk/voice/playlist` | `/realtime-sdk/reference/reference/voice/playlist` | `/realtime-sdk/reference/reference/voice/playlist` | slug_changed | 0.790 |
| `/sdks/realtime-sdk/voice/types` | `/realtime-sdk/reference/reference/voice/types` | `/realtime-sdk/reference/reference/voice/types` | slug_changed | 0.864 |
| `/sms/carrier-fees` | `/platform/messaging/sms/carrier-fees` | `/platform/messaging/sms/carrier-fees` | matched_changed | 1.000 |
| `/swml` | `/swml/reference` | `/swml/reference` | matched_changed | 1.000 |
| `/swml/expressions` | `/swml/reference/expressions` | `/swml/reference/reference/expressions` | matched_changed | 1.000 |
| `/swml/guides/ai/context-switch` | `/swml/guides/guides/ai/context-switch` | `/swml/guides/guides/context-switch` | matched_changed | 1.000 |
| `/swml/guides/ai/executing-swml` | `/swml/guides/guides/ai/executing-swml` | `/swml/guides/guides/executing-swml` | matched_changed | 1.000 |
| `/swml/guides/ai/set-meta-data` | `/swml/guides/guides/ai/set-meta-data` | `/swml/guides/guides/set-meta-data` | matched_changed | 1.000 |
| `/swml/guides/ai/swaig` | `/swml/guides/guides/ai/swaig` | `/swml/guides/guides/swaig` | matched_changed | 1.000 |
| `/swml/guides/ai/swaig/functions/data-map` | `/swml/guides/guides/ai/swaig/functions/data-map` | `/swml/guides/guides/data-map` | matched_changed | 1.000 |
| `/swml/guides/ai/toggle-functions` | `/swml/guides/guides/ai/toggle-functions` | `/swml/guides/guides/toggle-functions` | matched_changed | 1.000 |
| `/swml/guides/call-whisper` | `/swml/guides/guides/call-whisper` | `/swml/guides/guides/call-whisper` | matched_changed | 1.000 |
| `/swml/guides/creating-ivr` | `/swml/guides/guides/creating-ivr` | `/swml/guides/guides/creating-ivr` | matched_changed | 1.000 |
| `/swml/guides/deployment` | `/swml/guides/guides/deployment` | `/swml/guides/guides/deployment` | matched_changed | 1.000 |
| `/swml/guides/methods/goto-execute-transfer-disambiguation` | `/swml/guides/guides/methods/goto-execute-transfer-disambiguation` | `/swml/guides/guides/goto-execute-transfer-disambiguation` | matched_changed | 1.000 |
| `/swml/guides/methods/request` | `/swml/guides/guides/methods/request` | `/swml/guides/guides/request` | matched_changed | 1.000 |
| `/swml/guides/remote-server` | `/swml/guides/guides/remote-server` | `/swml/guides/guides/remote-server` | matched_changed | 1.000 |
| `/swml/methods` | `/swml/reference/methods` | `/swml/reference/reference` | matched_changed | 1.000 |
| `/swml/methods/ai` | `/swml/reference/methods/ai` | `/swml/reference/reference/ai` | matched_changed | 1.000 |
| `/swml/methods/ai/hints` | `/swml/reference/methods/ai/hints` | `/swml/reference/reference/ai/hints` | matched_changed | 1.000 |
| `/swml/methods/ai/languages` | `/swml/reference/methods/ai/languages` | `/swml/reference/reference/ai/languages` | matched_changed | 1.000 |
| `/swml/methods/ai/params` | `/swml/reference/methods/ai/params` | `/swml/reference/reference/ai/params` | matched_changed | 1.000 |
| `/swml/methods/ai/post-prompt` | `/swml/reference/methods/ai/post-prompt` | `/swml/reference/reference/ai/post-prompt` | matched_changed | 1.000 |
| `/swml/methods/ai/post-prompt-url` | `/swml/reference/methods/ai/post-prompt-url` | `/swml/reference/reference/ai/post-prompt-url` | matched_changed | 1.000 |
| `/swml/methods/ai/prompt` | `/swml/reference/methods/ai/prompt` | `/swml/reference/reference/ai/prompt` | matched_changed | 1.000 |
| `/swml/methods/ai/prompt/contexts` | `/swml/reference/methods/ai/prompt/contexts` | `/swml/reference/reference/ai/prompt/contexts` | matched_changed | 1.000 |
| `/swml/methods/ai/prompt/contexts/steps` | `/swml/reference/methods/ai/prompt/contexts/steps` | `/swml/reference/reference/ai/prompt/contexts-steps` | matched_changed | 1.000 |
| `/swml/methods/ai/prompt/pom` | `/swml/reference/methods/ai/prompt/pom` | `/swml/reference/reference/ai/prompt/pom` | matched_changed | 1.000 |
| `/swml/methods/ai/pronounce` | `/swml/reference/methods/ai/pronounce` | `/swml/reference/reference/ai/pronounce` | matched_changed | 1.000 |
| `/swml/methods/ai/swaig` | `/swml/reference/methods/ai/swaig` | `/swml/reference/reference/ai/swaig` | matched_changed | 1.000 |
| `/swml/methods/ai/swaig/defaults` | `/swml/reference/methods/ai/swaig/defaults` | `/swml/reference/reference/ai/swaig/defaults` | matched_changed | 1.000 |
| `/swml/methods/ai/swaig/functions` | `/swml/reference/methods/ai/swaig/functions` | `/swml/reference/reference/ai/swaig/functions` | matched_changed | 1.000 |
| `/swml/methods/ai/swaig/functions/data-map` | `/swml/reference/methods/ai/swaig/functions/data-map` | `/swml/reference/reference/ai/swaig/functions-data-map` | matched_changed | 1.000 |
| `/swml/methods/ai/swaig/functions/data-map/expressions` | `/swml/reference/methods/ai/swaig/functions/data-map/expressions` | `/swml/reference/reference/ai/swaig/functions-data-map-expressions` | matched_changed | 1.000 |
| `/swml/methods/ai/swaig/functions/data-map/output` | `/swml/reference/methods/ai/swaig/functions/data-map/output` | `/swml/reference/reference/ai/swaig/functions-data-map-output` | matched_changed | 1.000 |
| `/swml/methods/ai/swaig/functions/data-map/webhooks` | `/swml/reference/methods/ai/swaig/functions/data-map/webhooks` | `/swml/reference/reference/ai/swaig/functions-data-map-webhooks` | matched_changed | 1.000 |
| `/swml/methods/ai/swaig/functions/data-map/webhooks/foreach` | `/swml/reference/methods/ai/swaig/functions/data-map/webhooks/foreach` | `/swml/reference/reference/ai/swaig/functions-data-map-webhooks-foreach` | matched_changed | 1.000 |
| `/swml/methods/ai/swaig/functions/fillers` | `/swml/reference/methods/ai/swaig/functions/fillers` | `/swml/reference/reference/ai/swaig/functions-fillers` | matched_changed | 1.000 |
| `/swml/methods/ai/swaig/functions/parameters` | `/swml/reference/methods/ai/swaig/functions/parameters` | `/swml/reference/reference/ai/swaig/functions-parameters` | matched_changed | 1.000 |
| `/swml/methods/ai/swaig/functions/web-hook-url` | `/swml/reference/methods/ai/swaig/functions/web-hook-url` | `/swml/reference/reference/ai/swaig/functions-web-hook-url` | matched_changed | 1.000 |
| `/swml/methods/ai/swaig/includes` | `/swml/reference/methods/ai/swaig/includes` | `/swml/reference/reference/ai/swaig/includes` | matched_changed | 1.000 |
| `/swml/methods/ai/swaig/internal-fillers` | `/swml/reference/methods/ai/swaig/internal-fillers` | `/swml/reference/reference/ai/swaig/internal-fillers` | matched_changed | 1.000 |
| `/swml/methods/ai/swaig/native-functions` | `/swml/reference/methods/ai/swaig/native-functions` | `/swml/reference/reference/ai/swaig/native-functions` | matched_changed | 1.000 |
| `/swml/methods/amazon-bedrock` | `/swml/reference/methods/amazon-bedrock` | `/swml/reference/reference/amazon-bedrock` | matched_changed | 1.000 |
| `/swml/methods/amazon-bedrock/params` | `/swml/reference/methods/amazon-bedrock/params` | `/swml/reference/reference/amazon-bedrock/params` | matched_changed | 1.000 |
| `/swml/methods/amazon-bedrock/post-prompt` | `/swml/reference/methods/amazon-bedrock/post-prompt` | `/swml/reference/reference/amazon-bedrock/post-prompt` | matched_changed | 1.000 |
| `/swml/methods/amazon-bedrock/post-prompt-url` | `/swml/reference/methods/amazon-bedrock/post-prompt-url` | `/swml/reference/reference/amazon-bedrock/post-prompt-url` | matched_changed | 1.000 |
| `/swml/methods/amazon-bedrock/prompt` | `/swml/reference/methods/amazon-bedrock/prompt` | `/swml/reference/reference/amazon-bedrock/prompt` | matched_changed | 1.000 |
| `/swml/methods/amazon-bedrock/prompt/pom` | `/swml/reference/methods/amazon-bedrock/prompt/pom` | `/swml/reference/reference/amazon-bedrock/prompt/pom` | matched_changed | 1.000 |
| `/swml/methods/amazon-bedrock/swaig` | `/swml/reference/methods/amazon-bedrock/swaig` | `/swml/reference/reference/amazon-bedrock/swaig` | matched_changed | 1.000 |
| `/swml/methods/amazon-bedrock/swaig/defaults` | `/swml/reference/methods/amazon-bedrock/swaig/defaults` | `/swml/reference/reference/amazon-bedrock/swaig/defaults` | matched_changed | 1.000 |
| `/swml/methods/amazon-bedrock/swaig/functions` | `/swml/reference/methods/amazon-bedrock/swaig/functions` | `/swml/reference/reference/amazon-bedrock/swaig/functions` | matched_changed | 1.000 |
| `/swml/methods/amazon-bedrock/swaig/functions/data-map` | `/swml/reference/methods/amazon-bedrock/swaig/functions/data-map` | `/swml/reference/reference/amazon-bedrock/swaig/functions-data-map` | matched_changed | 1.000 |
| `/swml/methods/amazon-bedrock/swaig/functions/data-map/expressions` | `/swml/reference/methods/amazon-bedrock/swaig/functions/data-map/expressions` | `/swml/reference/reference/amazon-bedrock/swaig/functions-data-map-expressions` | matched_changed | 1.000 |
| `/swml/methods/amazon-bedrock/swaig/functions/data-map/output` | `/swml/reference/methods/amazon-bedrock/swaig/functions/data-map/output` | `/swml/reference/reference/amazon-bedrock/swaig/functions-data-map-output` | matched_changed | 1.000 |
| `/swml/methods/amazon-bedrock/swaig/functions/data-map/webhooks` | `/swml/reference/methods/amazon-bedrock/swaig/functions/data-map/webhooks` | `/swml/reference/reference/amazon-bedrock/swaig/functions-data-map-webhooks` | matched_changed | 1.000 |
| `/swml/methods/amazon-bedrock/swaig/functions/data-map/webhooks/foreach` | `/swml/reference/methods/amazon-bedrock/swaig/functions/data-map/webhooks/foreach` | `/swml/reference/reference/amazon-bedrock/swaig/functions-data-map-webhooks-foreach` | matched_changed | 1.000 |
| `/swml/methods/amazon-bedrock/swaig/functions/parameters` | `/swml/reference/methods/amazon-bedrock/swaig/functions/parameters` | `/swml/reference/reference/amazon-bedrock/swaig/functions-parameters` | matched_changed | 1.000 |
| `/swml/methods/amazon-bedrock/swaig/functions/web-hook-url` | `/swml/reference/methods/amazon-bedrock/swaig/functions/web-hook-url` | `/swml/reference/reference/amazon-bedrock/swaig/functions-web-hook-url` | matched_changed | 1.000 |
| `/swml/methods/amazon-bedrock/swaig/includes` | `/swml/reference/methods/amazon-bedrock/swaig/includes` | `/swml/reference/reference/amazon-bedrock/swaig/includes` | matched_changed | 1.000 |
| `/swml/methods/amazon-bedrock/swaig/native-functions` | `/swml/reference/methods/amazon-bedrock/swaig/native-functions` | `/swml/reference/reference/amazon-bedrock/swaig/native-functions` | matched_changed | 1.000 |
| `/swml/methods/answer` | `/swml/reference/methods/answer` | `/swml/reference/reference/answer` | matched_changed | 1.000 |
| `/swml/methods/cond` | `/swml/reference/methods/cond` | `/swml/reference/reference/cond` | matched_changed | 1.000 |
| `/swml/methods/connect` | `/swml/reference/methods/connect` | `/swml/reference/reference/connect` | matched_changed | 1.000 |
| `/swml/methods/connect/headers` | `/swml/reference/methods/connect/headers` | `/swml/reference/reference/connect/headers` | matched_changed | 1.000 |
| `/swml/methods/denoise` | `/swml/reference/methods/denoise` | `/swml/reference/reference/denoise` | matched_changed | 1.000 |
| `/swml/methods/detect-machine` | `/swml/reference/methods/detect-machine` | `/swml/reference/reference/detect-machine` | matched_changed | 1.000 |
| `/swml/methods/enter-queue` | `/swml/reference/methods/enter-queue` | `/swml/reference/reference/enter-queue` | matched_changed | 1.000 |
| `/swml/methods/execute` | `/swml/reference/methods/execute` | `/swml/reference/reference/execute` | matched_changed | 1.000 |
| `/swml/methods/goto` | `/swml/reference/methods/goto` | `/swml/reference/reference/goto` | matched_changed | 1.000 |
| `/swml/methods/hangup` | `/swml/reference/methods/hangup` | `/swml/reference/reference/hangup` | matched_changed | 1.000 |
| `/swml/methods/join-conference` | `/swml/reference/methods/join-conference` | `/swml/reference/reference/join-conference` | matched_changed | 1.000 |
| `/swml/methods/join-room` | `/swml/reference/methods/join-room` | `/swml/reference/reference/join-room` | matched_changed | 1.000 |
| `/swml/methods/label` | `/swml/reference/methods/label` | `/swml/reference/reference/label` | matched_changed | 1.000 |
| `/swml/methods/live-transcribe` | `/swml/reference/methods/live-transcribe` | `/swml/reference/reference/live-transcribe` | matched_changed | 1.000 |
| `/swml/methods/live-transcribe/action` | `/swml/reference/methods/live-transcribe/action` | `/swml/reference/reference/live-transcribe/action` | matched_changed | 1.000 |
| `/swml/methods/live-transcribe/action/start` | `/swml/reference/methods/live-transcribe/action/start` | `/swml/reference/reference/live-transcribe/action/start` | matched_changed | 1.000 |
| `/swml/methods/live-transcribe/action/stop` | `/swml/reference/methods/live-transcribe/action/stop` | `/swml/reference/reference/live-transcribe/action/stop` | matched_changed | 1.000 |
| `/swml/methods/live-transcribe/action/summarize` | `/swml/reference/methods/live-transcribe/action/summarize` | `/swml/reference/reference/live-transcribe/action/summarize` | matched_changed | 1.000 |
| `/swml/methods/live-translate` | `/swml/reference/methods/live-translate` | `/swml/reference/reference/live-translate` | matched_changed | 1.000 |
| `/swml/methods/live-translate/action` | `/swml/reference/methods/live-translate/action` | `/swml/reference/reference/live-translate/action` | matched_changed | 1.000 |
| `/swml/methods/live-translate/action/inject` | `/swml/reference/methods/live-translate/action/inject` | `/swml/reference/reference/live-translate/action/inject` | matched_changed | 1.000 |
| `/swml/methods/live-translate/action/start` | `/swml/reference/methods/live-translate/action/start` | `/swml/reference/reference/live-translate/action/start` | matched_changed | 1.000 |
| `/swml/methods/live-translate/action/stop` | `/swml/reference/methods/live-translate/action/stop` | `/swml/reference/reference/live-translate/action/stop` | matched_changed | 1.000 |
| `/swml/methods/live-translate/action/summarize` | `/swml/reference/methods/live-translate/action/summarize` | `/swml/reference/reference/live-translate/action/summarize` | matched_changed | 1.000 |
| `/swml/methods/pay` | `/swml/reference/methods/pay` | `/swml/reference/reference/pay` | matched_changed | 1.000 |
| `/swml/methods/pay/parameters` | `/swml/reference/methods/pay/parameters` | `/swml/reference/reference/pay/parameters` | matched_changed | 1.000 |
| `/swml/methods/pay/payment-connector-url` | `/swml/reference/methods/pay/payment-connector-url` | `/swml/reference/reference/pay/payment-connector-url` | matched_changed | 1.000 |
| `/swml/methods/pay/prompts` | `/swml/reference/methods/pay/prompts` | `/swml/reference/reference/pay/prompts` | matched_changed | 1.000 |
| `/swml/methods/pay/prompts/actions` | `/swml/reference/methods/pay/prompts/actions` | `/swml/reference/reference/pay/prompts/actions` | matched_changed | 1.000 |
| `/swml/methods/play` | `/swml/reference/methods/play` | `/swml/reference/reference/play` | matched_changed | 1.000 |
| `/swml/methods/prompt` | `/swml/reference/methods/prompt` | `/swml/reference/reference/prompt` | matched_changed | 1.000 |
| `/swml/methods/receive-fax` | `/swml/reference/methods/receive-fax` | `/swml/reference/reference/receive-fax` | matched_changed | 1.000 |
| `/swml/methods/record` | `/swml/reference/methods/record` | `/swml/reference/reference/record` | matched_changed | 1.000 |
| `/swml/methods/record-call` | `/swml/reference/methods/record-call` | `/swml/reference/reference/record-call` | matched_changed | 1.000 |
| `/swml/methods/request` | `/swml/reference/methods/request` | `/swml/reference/reference/request` | matched_changed | 1.000 |
| `/swml/methods/return` | `/swml/reference/methods/return` | `/swml/reference/reference/return` | matched_changed | 1.000 |
| `/swml/methods/send-digits` | `/swml/reference/methods/send-digits` | `/swml/reference/reference/send-digits` | matched_changed | 1.000 |
| `/swml/methods/send-fax` | `/swml/reference/methods/send-fax` | `/swml/reference/reference/send-fax` | matched_changed | 1.000 |
| `/swml/methods/send-sms` | `/swml/reference/methods/send-sms` | `/swml/reference/reference/send-sms` | matched_changed | 1.000 |
| `/swml/methods/set` | `/swml/reference/methods/set` | `/swml/reference/reference/set` | matched_changed | 1.000 |
| `/swml/methods/sip-refer` | `/swml/reference/methods/sip-refer` | `/swml/reference/reference/sip-refer` | matched_changed | 1.000 |
| `/swml/methods/sleep` | `/swml/reference/methods/sleep` | `/swml/reference/reference/sleep` | matched_changed | 1.000 |
| `/swml/methods/stop-denoise` | `/swml/reference/methods/stop-denoise` | `/swml/reference/reference/stop-denoise` | matched_changed | 1.000 |
| `/swml/methods/stop-record-call` | `/swml/reference/methods/stop-record-call` | `/swml/reference/reference/stop-record-call` | matched_changed | 1.000 |
| `/swml/methods/stop-tap` | `/swml/reference/methods/stop-tap` | `/swml/reference/reference/stop-tap` | matched_changed | 1.000 |
| `/swml/methods/switch` | `/swml/reference/methods/switch` | `/swml/reference/reference/switch` | matched_changed | 1.000 |
| `/swml/methods/tap` | `/swml/reference/methods/tap` | `/swml/reference/reference/tap` | matched_changed | 1.000 |
| `/swml/methods/transfer` | `/swml/reference/methods/transfer` | `/swml/reference/reference/transfer` | matched_changed | 1.000 |
| `/swml/methods/unset` | `/swml/reference/methods/unset` | `/swml/reference/reference/unset` | matched_changed | 1.000 |
| `/swml/methods/user-event` | `/swml/reference/methods/user-event` | `/swml/reference/reference/user-event` | matched_changed | 1.000 |
| `/swml/quickstart` | `/swml/guides/quickstart` | `/swml/guides/guides/quickstart` | matched_changed | 1.000 |
| `/swml/reference/template-functions` | `/swml/reference/reference/template-functions` | `/swml/reference/reference/template-functions` | matched_changed | 1.000 |
| `/swml/variables` | `/swml/reference/variables` | `/swml/reference/reference/variables` | matched_changed | 1.000 |
| `/tools` | `/platform/tools/tools` | `/platform/tools/tools` | matched_changed | 1.000 |
| `/tools/c2c` | `/platform/tools/tools/c2c` | `/platform/tools/tools/c2c` | matched_changed | 1.000 |
| `/tools/c2c/technical-reference` | `/platform/tools/tools/c2c/technical-reference` | `/platform/tools/tools/technical-reference` | matched_changed | 1.000 |
| `/tools/swsh` | `/platform/tools/tools/swsh` | `/platform/tools/tools/swsh` | matched_changed | 1.000 |
| `/tools/wirestarter` | `/platform/tools/tools/wirestarter` | `/platform/tools/tools/wirestarter` | matched_changed | 1.000 |
| `/video` | `/platform/calling/video` | `/platform/calling/video` | matched_changed | 1.000 |
| `/video/conference` | `/platform/calling/video/conference` | `/platform/calling/video/conference` | matched_changed | 1.000 |
| `/video/conference/technical-reference` | `/platform/calling/video/conference/technical-reference` | `/platform/calling/video/technical-reference` | matched_changed | 1.000 |
| `/video/faq` | `/platform/calling/video/faq` | `/platform/calling/video/faq` | matched_changed | 1.000 |
| `/video/getting-started` | `/platform/calling/video/getting-started` | `/platform/calling/video/getting-started` | matched_changed | 1.000 |
| `/video/getting-started/extending-rooms-with-custom-code` | `/platform/calling/video/getting-started/extending-rooms-with-custom-code` | `/platform/calling/video/extending-rooms-with-custom-code` | matched_changed | 1.000 |
| `/video/getting-started/managing-rooms-with-apis` | `/platform/calling/video/getting-started/managing-rooms-with-apis` | `/platform/calling/video/managing-rooms-with-apis` | matched_changed | 1.000 |
| `/video/getting-started/simple-video-demo` | `/platform/calling/video/getting-started/simple-video-demo` | `/platform/calling/video/simple-video-demo` | matched_changed | 1.000 |
| `/video/getting-started/video-first-steps` | `/platform/calling/video/getting-started/video-first-steps` | `/platform/calling/video/video-first-steps` | matched_changed | 1.000 |
| `/video/guides/layout-positions` | `/platform/calling/video/guides/layout-positions` | `/platform/calling/video/layout-positions` | matched_changed | 1.000 |
| `/video/guides/layouts` | `/platform/calling/video/guides/layouts` | `/platform/calling/video/layouts` | matched_changed | 1.000 |
| `/video/guides/making-a-clubhouse-clone` | `/platform/calling/video/guides/making-a-clubhouse-clone` | `/platform/calling/video/making-a-clubhouse-clone` | matched_changed | 1.000 |
| `/video/guides/making-a-zoom-clone` | `/platform/calling/video/guides/making-a-zoom-clone` | `/platform/calling/video/making-a-zoom-clone` | matched_changed | 1.000 |
| `/video/guides/setting-the-layout-of-your-signalwire-video-calls` | `/platform/calling/video/guides/setting-the-layout-of-your-signalwire-video-calls` | `/platform/calling/video/setting-the-layout-of-your-signalwire-video-calls` | matched_changed | 1.000 |
| `/voice` | `/platform/calling/voice` | `/platform/calling/voice` | matched_changed | 1.000 |
| `/voice/faq` | `/platform/calling/voice/faq` | `/platform/calling/voice/faq` | matched_changed | 1.000 |
| `/voice/getting-started/how-to-forward-calls` | `/platform/calling/voice/getting-started/how-to-forward-calls` | `/platform/calling/voice/how-to-forward-calls` | matched_changed | 1.000 |
| `/voice/getting-started/how-to-gather-keypad-input-from-user` | `/compatibility-api/cxml/cxml/guides/gathering-user-input` | `/compatibility-api/cxml/guides/gathering-user-input` | slug_changed | 0.702 |
| `/voice/getting-started/how-to-set-up-voicemail` | `/platform/calling/voice/getting-started/how-to-set-up-voicemail` | `/platform/calling/voice/how-to-set-up-voicemail` | matched_changed | 1.000 |
| `/voice/getting-started/making-and-receiving-phone-calls` | `/platform/calling/voice/getting-started/making-and-receiving-phone-calls` | `/platform/calling/voice/making-and-receiving-phone-calls` | matched_changed | 1.000 |
| `/voice/getting-started/recording-calls` | `/platform/calling/voice/getting-started/recording-calls` | `/platform/calling/voice/recording-calls` | matched_changed | 1.000 |
| `/voice/getting-started/sip/allowing-signalwire-ips-through-your-firewall` | `/platform/calling/voice/getting-started/sip/allowing-signalwire-ips-through-your-firewall` | `/platform/calling/voice/allowing-signalwire-ips-through-your-firewall` | matched_changed | 1.000 |
| `/voice/getting-started/sip/sip-byoc-bring-your-own-carrier` | `/platform/calling/voice/getting-started/sip/sip-byoc-bring-your-own-carrier` | `/platform/calling/voice/sip-byoc-bring-your-own-carrier` | matched_changed | 1.000 |
| `/voice/getting-started/sip/sip-domain-applications` | `/platform/calling/voice/getting-started/sip/sip-domain-applications` | `/platform/calling/voice/sip-domain-applications` | matched_changed | 1.000 |
| `/voice/getting-started/sip/sip-gateways` | `/platform/calling/voice/getting-started/sip/sip-gateways` | `/platform/calling/voice/sip-gateways` | matched_changed | 1.000 |
| `/voice/getting-started/sip/sip-trunking` | `/platform/calling/voice/getting-started/sip/sip-trunking` | `/platform/calling/voice/sip-trunking` | matched_changed | 1.000 |
| `/voice/getting-started/voice-and-languages` | `/platform/calling/voice/getting-started/voice-and-languages` | `/platform/calling/voice/voice-and-languages` | matched_changed | 1.000 |
| `/voice/sip` | `/platform/calling/voice/sip` | `/platform/calling/voice/sip` | matched_changed | 1.000 |
| `/voice/sip/get-started` | `/platform/calling/voice/sip/get-started` | `/platform/calling/voice/get-started` | matched_changed | 1.000 |
| `/voice/tts/amazon-polly` | `/platform/calling/voice/tts/amazon-polly` | `/platform/calling/voice/amazon-polly` | matched_changed | 1.000 |
| `/voice/tts/azure` | `/platform/calling/voice/tts/azure` | `/platform/calling/voice/azure` | matched_changed | 1.000 |
| `/voice/tts/cartesia` | `/platform/calling/voice/tts/cartesia` | `/platform/calling/voice/cartesia` | matched_changed | 1.000 |
| `/voice/tts/deepgram` | `/platform/calling/voice/tts/deepgram` | `/platform/calling/voice/deepgram` | matched_changed | 1.000 |
| `/voice/tts/elevenlabs` | `/platform/calling/voice/tts/elevenlabs` | `/platform/calling/voice/elevenlabs` | matched_changed | 1.000 |
| `/voice/tts/gcloud` | `/platform/calling/voice/tts/gcloud` | `/platform/calling/voice/gcloud` | matched_changed | 1.000 |
| `/voice/tts/openai` | `/platform/calling/voice/tts/openai` | `/platform/calling/voice/openai` | matched_changed | 1.000 |
| `/voice/tts/rime` | `/platform/calling/voice/tts/rime` | `/platform/calling/voice/rime` | matched_changed | 1.000 |

## Needs review (43)

Possible matches with low confidence. Verify manually before redirecting.

| Old URL | Current full URL | Proposed full URL | Confidence | Notes |
|---------|------------------|-------------------|------------|-------|
| `/chat/getting-started` | `/platform/calling/video/getting-started` | `/platform/calling/video/getting-started` | 0.350 | body=0.226 fname=0.846 |
| `/chat/guides` | `/realtime-sdk/v2/guides` | `/realtime-sdk/v2/guides` | 0.357 | body=0.196 fname=1.000 |
| `/compatibility-api/client-sdks/api/available-phone-numbers/find-toll-free` | `/compatibility-api/sdks/sdks/methods/available-phone-numbers/find-toll-free` | `/compatibility-api/sdks/sdks/reference/available-phone-numbers/find-toll-free` | 0.685 | body=0.731 fname=0.500 |
| `/compatibility-api/client-sdks/api/available-phone-numbers/search-local` | `/compatibility-api/sdks/sdks/methods/available-phone-numbers/search-local` | `/compatibility-api/sdks/sdks/reference/available-phone-numbers/search-local` | 0.464 | body=0.455 fname=0.500 |
| `/compatibility-api/client-sdks/methods/fax-media/list-all` | `/compatibility-api/sdks/sdks/methods/fax-media/list-all` | `/compatibility-api/sdks/sdks/reference/fax-media/list-all` | 0.592 | body=0.615 fname=0.500 |
| `/compatibility-api/cxml` | `/compatibility-api/cxml/cxml` | `/compatibility-api/cxml/cxml/reference` | 0.458 | body=0.447 fname=0.500 |
| `/compatibility-api/cxml/fax` | `/compatibility-api/cxml/cxml/fax` | `/compatibility-api/cxml/cxml/reference/fax` | 0.489 | body=0.611 fname=0.000 |
| `/compatibility-api/cxml/fax/receive` | `/compatibility-api/cxml/cxml/fax/receive` | `/compatibility-api/cxml/cxml/reference/fax/receive` | 0.700 | body=0.625 fname=1.000 |
| `/compatibility-api/cxml/messaging` | `/compatibility-api/cxml/cxml/fax` | `/compatibility-api/cxml/cxml/reference/fax` | 0.311 | body=0.330 fname=0.235 |
| `/compatibility-api/cxml/messaging/message` | `/compatibility-api/cxml/cxml/messaging/message` | `/compatibility-api/cxml/cxml/reference/messaging/message` | 0.533 | body=0.416 fname=1.000 |
| `/compatibility-api/cxml/voice` | `/compatibility-api/cxml/cxml/voice` | `/compatibility-api/cxml/cxml/reference/voice` | 0.427 | body=0.418 fname=0.462 |
| `/compatibility-api/cxml/voice/conference-noun` | `/compatibility-api/cxml/cxml/voice/conference` | `/compatibility-api/cxml/cxml/reference/voice/conference` | 0.561 | body=0.451 fname=1.000 |
| `/compatibility-api/cxml/voice/dial` | `/compatibility-api/cxml/cxml/voice/dial` | `/compatibility-api/cxml/cxml/reference/voice/dial` | 0.578 | body=0.472 fname=1.000 |
| `/compatibility-api/cxml/voice/echo` | `/compatibility-api/cxml/cxml/voice/echo` | `/compatibility-api/cxml/cxml/reference/voice/echo` | 0.656 | body=0.570 fname=1.000 |
| `/compatibility-api/cxml/voice/enqueue` | `/compatibility-api/cxml/cxml/voice/enqueue` | `/compatibility-api/cxml/cxml/reference/voice/enqueue` | 0.477 | body=0.346 fname=1.000 |
| `/compatibility-api/cxml/voice/number-noun` | `/compatibility-api/cxml/cxml/voice/number` | `/compatibility-api/cxml/cxml/reference/voice/number` | 0.559 | body=0.448 fname=1.000 |
| `/compatibility-api/cxml/voice/pay` | `/compatibility-api/cxml/cxml/voice/pay` | `/compatibility-api/cxml/cxml/reference/voice/pay` | 0.694 | body=0.617 fname=1.000 |
| `/compatibility-api/cxml/voice/record` | `/compatibility-api/cxml/cxml/voice/record` | `/compatibility-api/cxml/cxml/reference/voice/record` | 0.625 | body=0.531 fname=1.000 |
| `/compatibility-api/cxml/voice/sip-noun` | `/compatibility-api/cxml/cxml/voice/sip` | `/compatibility-api/cxml/cxml/reference/voice/sip` | 0.671 | body=0.588 fname=1.000 |
| `/compatibility-api/cxml/voice/sms` | `/compatibility-api/cxml/cxml/voice/sms` | `/compatibility-api/cxml/cxml/reference/voice/sms` | 0.587 | body=0.484 fname=1.000 |
| `/fax/get-started` | `/platform/calling/video/getting-started` | `/platform/calling/video/getting-started` | 0.381 | body=0.227 fname=1.000 |
| `/fax/getting-started/first-steps-with-fax` | `/platform/calling/fax` | `/platform/calling/fax` | 0.499 | body=0.570 fname=0.214 |
| `/fax/getting-started/securing-callback-for-inbound-fax-with-cxml` | `/compatibility-api/cxml/cxml/guides/securing-callback-for-inbound-fax` | `/compatibility-api/cxml/guides/securing-callback-for-inbound-fax` | 0.367 | body=0.333 fname=0.500 |
| `/messaging/get-started` | `/platform/calling/video/getting-started` | `/platform/calling/video/getting-started` | 0.380 | body=0.225 fname=1.000 |
| `/messaging/guides/general` | `/browser-sdk/reference/reference/signalwire-client/client/methods/disconnect` | `/browser-sdk/reference/reference/signalwire-client/client/methods/disconnect` | 0.320 | body=0.342 fname=0.235 |
| `/platform/phone-numbers/getting-started` | `/platform/calling/video/getting-started` | `/platform/calling/video/getting-started` | 0.311 | body=0.177 fname=0.846 |
| `/rest/signalwire-rest/guides` | `/browser-sdk/reference/reference/signalwire-client/client/methods/disconnect` | `/browser-sdk/reference/reference/signalwire-client/client/methods/disconnect` | 0.308 | body=0.322 fname=0.250 |
| `/sdks/browser-sdk/chat/member-entity` | `/browser-sdk/reference/reference/chat/chat-member-entity` | `/browser-sdk/reference/reference/chat/chat-member-entity` | 0.482 | body=0.396 fname=0.828 |
| `/sdks/browser-sdk/chat/message-entity` | `/browser-sdk/reference/reference/chat/chat-message-entity` | `/browser-sdk/reference/reference/chat/chat-message-entity` | 0.462 | body=0.368 fname=0.839 |
| `/sdks/browser-sdk/pubsub/client` | `/browser-sdk/reference/reference/chat/client` | `/browser-sdk/reference/reference/chat/client` | 0.368 | body=0.210 fname=1.000 |
| `/sdks/browser-sdk/signalwire-client/client` | `/browser-sdk/reference/reference/signalwire-client/client` | `/browser-sdk/reference/reference/signalwire-client/client` | 0.522 | body=0.402 fname=1.000 |
| `/sdks/browser-sdk/video` | `/browser-sdk/reference/reference/video` | `/browser-sdk/reference/reference/video` | 0.623 | body=0.529 fname=1.000 |
| `/sdks/browser-sdk/video/room-session-recording` | `/browser-sdk/reference/reference/video/room-session-recording` | `/browser-sdk/reference/reference/video/room-session-recording` | 0.321 | body=0.193 fname=0.833 |
| `/sdks/browser-sdk/video/room-session-stream` | `/browser-sdk/reference/reference/video/room-session-stream` | `/browser-sdk/reference/reference/video/room-session-stream` | 0.584 | body=0.528 fname=0.810 |
| `/sdks/realtime-sdk/realtime-client` | `/realtime-sdk/reference/reference/realtime-client` | `/realtime-sdk/reference/reference/realtime-client` | 0.411 | body=0.264 fname=1.000 |
| `/sdks/realtime-sdk/v3/guides/voice` | `/realtime-sdk/v3/reference/video/client/methods/once` | `/realtime-sdk/v3/reference/video/client/methods/once` | 0.301 | body=0.210 fname=0.667 |
| `/sdks/realtime-sdk/v3/video/client` | `/realtime-sdk/v3/reference/task/client` | `/realtime-sdk/v3/reference/task-client [collision]` | 0.391 | body=0.363 fname=0.500 |
| `/sdks/realtime-sdk/v3/voice` | `/realtime-sdk/v3/reference/voice` | `/realtime-sdk/v3/reference/voice` | 0.679 | body=0.599 fname=1.000 |
| `/sdks/realtime-sdk/video` | `/realtime-sdk/reference/reference/video` | `/realtime-sdk/reference/reference/video` | 0.696 | body=0.620 fname=1.000 |
| `/sdks/realtime-sdk/video/client` | `/realtime-sdk/reference/reference/video/client/methods/listen` | `/realtime-sdk/reference/reference/video/client/methods/listen` | 0.396 | body=0.329 fname=0.667 |
| `/sdks/realtime-sdk/voice` | `/realtime-sdk/reference/reference/voice` | `/realtime-sdk/reference/reference/voice` | 0.562 | body=0.452 fname=1.000 |
| `/video/guides` | `/realtime-sdk/v2/guides` | `/realtime-sdk/v2/guides` | 0.334 | body=0.167 fname=1.000 |
| `/voice/guides/general/how-to-set-caller-id-or-cnam` | `/platform/platform/platform/basics/general/how-to-set-caller-id-or-cnam` | `/platform/platform/basics/how-to-set-caller-id-or-cnam` | 0.437 | body=0.296 fname=1.000 |

## Gone (586)

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
- `/platform/basics` -- No Fern page above similarity threshold
- `/platform/basics/general` -- No Fern page above similarity threshold
- `/platform/basics/guides` -- No Fern page above similarity threshold
- `/platform/basics/guides/technical-troubleshooting` -- No Fern page above similarity threshold
- ... and 52 more

### no_source (5)

- `/swml/guides/ai/background-audio` -- No source file found in main/swml docs dir
- `/swml/methods/ai/params/hold-music` -- No source file found in main/swml docs dir
- `/swml/methods/ai/params/interrupt-prompt` -- No source file found in main/swml docs dir
- `/swml/methods/ai/swaig/defaults/web-hook-url` -- No source file found in main/swml docs dir
- `/swml/methods/amazon-bedrock/swaig/defaults/web-hook-url` -- No source file found in main/swml docs dir


## No action needed (1)

URLs that haven't changed or are already covered.

- `/sdks/browser-sdk/v2/guides` -> ``

## Output files

- `C:\Users\devon\projects\signalwire-fern-config\scripts\slug-reconciliation\reports\slug-final-report.csv` -- full report (1489 rows)
- `C:\Users\devon\projects\signalwire-fern-config\scripts\slug-reconciliation\reports\slug-final-report.md` -- this report

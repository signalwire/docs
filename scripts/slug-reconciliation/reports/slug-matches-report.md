# Unmatched Page Matching Report

## Summary

| Category | Count | Description |
|----------|-------|-------------|
| **slug_changed** | 201 | Page exists in Fern under a different slug |
| already_mapped | 3 | Source file maps to a known slug via different URL |
| uncertain | 66 | Possible match, needs manual review |
| likely_deleted | 193 | No similar page found in Fern |
| autogen | 401 | OpenAPI-generated endpoint (no MDX source) |
| known_deleted | 98 | Section known to be not migrated |
| no_source | 36 | No Docusaurus source file found |
| **Total** | **998** | |

## Slug changed

Pages that exist in Fern but with a different URL.

| Old URL | Fern file | Current slug | New slug | Confidence |
|---------|-----------|--------------|----------|------------|
| `/call-flow-builder/ai-agent` | `call-flow-builder/pages/nodes/ai_agent.mdx` | `/reference/ai-agent` | `/reference/ai-agent` | 0.788 |
| `/call-flow-builder/answer-call` | `call-flow-builder/pages/nodes/answer_call.mdx` | `/reference/answer-call` | `/reference/answer-call` | 0.939 |
| `/call-flow-builder/execute-swml` | `call-flow-builder/pages/nodes/execute_swml.mdx` | `/reference/execute-swml` | `/reference/execute-swml` | 0.846 |
| `/call-flow-builder/handle-call` | `call-flow-builder/pages/nodes/handle_call.mdx` | `/reference/handle-call` | `/reference/handle-call` | 0.983 |
| `/call-flow-builder/nodes` | `call-flow-builder/pages/nodes/overview.mdx` | `/reference` | `/reference/reference` | 0.839 |
| `/call-flow-builder/request` | `call-flow-builder/pages/nodes/request.mdx` | `/reference/request` | `/reference/request` | 0.781 |
| `/call-flow-builder/set-variables` | `call-flow-builder/pages/nodes/set_variables.mdx` | `/reference/set-variables` | `/reference/set-variables` | 0.820 |
| `/call-flow-builder/start-call-recording` | `call-flow-builder/pages/nodes/start_call_recording.mdx` | `/reference/start-call-recording` | `/reference/start-call-recording` | 0.761 |
| `/call-flow-builder/stop-call-recording` | `call-flow-builder/pages/nodes/stop_call_recording.mdx` | `/reference/stop-call-recording` | `/reference/stop-call-recording` | 0.846 |
| `/call-flow-builder/unset-variables` | `call-flow-builder/pages/nodes/unset_variables.mdx` | `/reference/unset-variables` | `/reference/unset-variables` | 0.819 |
| `/call-flow-builder/variables` | `call-flow-builder/pages/core/variables.mdx` | `/reference/variables` | `/guides/variables` | 0.929 |
| `/call-flow-builder/version` | `call-flow-builder/pages/core/version.mdx` | `/reference/versioning` | `/guides/versioning` | 0.984 |
| `/call-flow-builder/voicemail-recording` | `call-flow-builder/pages/nodes/voicemail_recording.mdx` | `/reference/voicemail-recording` | `/reference/voicemail-recording` | 0.825 |
| `/chat/getting-started/get-started-with-a-simple-chat-demo` | `browser-sdk/pages/latest/guides/chat/get-started-with-a-simple-chat-demo/index.mdx` | `/guides/build-a-chat-application-with-the-browser-sdk` | `/guides/build-a-chat-application-with-the-browser-sdk` | 0.971 |
| `/compatibility-api/api-reference/rest-client-sdks/methods` | `compatibility-api\pages\sdks\methods\overview.mdx` | `sdks/methods` | -- | 1.000 |
| `/compatibility-api/client-sdks/api/available-phone-numbers` | `compatibility-api\pages\sdks\methods\available-phone-numbers\index.mdx` | `sdks/methods/available-phone-numbers` | -- | 1.000 |
| `/compatibility-api/client-sdks/api/available-phone-numbers/list-resources` | `compatibility-api\pages\sdks\methods\available-phone-numbers\list-resources.mdx` | `sdks/methods/available-phone-numbers/list-resources` | -- | 1.000 |
| `/compatibility-api/client-sdks/applications` | `compatibility-api\pages\sdks\methods\applications\index.mdx` | `sdks/methods/applications` | -- | 1.000 |
| `/compatibility-api/client-sdks/applications/create` | `compatibility-api\pages\sdks\methods\applications\create.mdx` | `sdks/methods/applications/create` | -- | 1.000 |
| `/compatibility-api/client-sdks/applications/delete` | `compatibility-api\pages\sdks\methods\applications\delete.mdx` | `sdks/methods/applications/delete` | -- | 1.000 |
| `/compatibility-api/client-sdks/applications/retrieve` | `compatibility-api\pages\sdks\methods\applications\retrieve.mdx` | `sdks/methods/applications/retrieve` | -- | 1.000 |
| `/compatibility-api/client-sdks/applications/update` | `compatibility-api\pages\sdks\methods\applications\update.mdx` | `sdks/methods/applications/update` | -- | 1.000 |
| `/compatibility-api/client-sdks/methods/accounts` | `compatibility-api\pages\sdks\methods\accounts\index.mdx` | `sdks/methods/accounts` | -- | 1.000 |
| `/compatibility-api/client-sdks/methods/accounts/list` | `compatibility-api\pages\sdks\methods\accounts\list.mdx` | `sdks/methods/accounts/list` | -- | 1.000 |
| `/compatibility-api/client-sdks/methods/accounts/retrieve` | `compatibility-api\pages\sdks\methods\accounts\retrieve.mdx` | `sdks/methods/accounts/retrieve` | -- | 1.000 |
| `/compatibility-api/client-sdks/methods/accounts/update` | `compatibility-api\pages\sdks\methods\accounts\update-friendly-name.mdx` | `sdks/methods/accounts/update` | -- | 1.000 |
| `/compatibility-api/client-sdks/methods/calls` | `compatibility-api\pages\sdks\methods\calls\index.mdx` | `sdks/methods/calls` | -- | 1.000 |
| `/compatibility-api/client-sdks/methods/calls/create` | `compatibility-api\pages\sdks\methods\calls\create.mdx` | `sdks/methods/calls/create` | -- | 1.000 |
| `/compatibility-api/client-sdks/methods/calls/delete` | `compatibility-api\pages\sdks\methods\calls\delete.mdx` | `sdks/methods/calls/delete` | -- | 1.000 |
| `/compatibility-api/client-sdks/methods/calls/list` | `compatibility-api\pages\sdks\methods\calls\list.mdx` | `sdks/methods/calls/list` | -- | 1.000 |
| `/compatibility-api/client-sdks/methods/calls/retrieve` | `compatibility-api\pages\sdks\methods\calls\retrieve.mdx` | `sdks/methods/calls/retrieve` | -- | 1.000 |
| `/compatibility-api/client-sdks/methods/calls/update` | `compatibility-api\pages\sdks\methods\calls\update.mdx` | `sdks/methods/calls/update` | -- | 1.000 |
| `/compatibility-api/client-sdks/methods/conference-participants` | `compatibility-api\pages\sdks\methods\conference-participants\index.mdx` | `sdks/methods/conference-participants` | -- | 1.000 |
| `/compatibility-api/client-sdks/methods/conference-participants/add` | `compatibility-api\pages\sdks\methods\conference-participants\add.mdx` | `sdks/methods/conference-participants/add` | -- | 1.000 |
| `/compatibility-api/client-sdks/methods/conference-participants/delete` | `compatibility-api\pages\sdks\methods\conference-participants\delete.mdx` | `sdks/methods/conference-participants/delete` | -- | 1.000 |
| `/compatibility-api/client-sdks/methods/conference-participants/list` | `compatibility-api\pages\sdks\methods\conference-participants\list.mdx` | `sdks/methods/conference-participants/list` | -- | 1.000 |
| `/compatibility-api/client-sdks/methods/conference-participants/retrieve` | `compatibility-api\pages\sdks\methods\conference-participants\retrieve.mdx` | `sdks/methods/conference-participants/retrieve` | -- | 1.000 |
| `/compatibility-api/client-sdks/methods/conference-participants/update` | `compatibility-api\pages\sdks\methods\conference-participants\update.mdx` | `sdks/methods/conference-participants/update` | -- | 1.000 |
| `/compatibility-api/client-sdks/methods/conferences` | `compatibility-api\pages\sdks\methods\conferences\index.mdx` | `sdks/methods/conferences` | -- | 1.000 |
| `/compatibility-api/client-sdks/methods/conferences/list` | `compatibility-api\pages\sdks\methods\conferences\list.mdx` | `sdks/methods/conferences/list` | -- | 1.000 |
| `/compatibility-api/client-sdks/methods/conferences/retrieve` | `compatibility-api\pages\sdks\methods\conferences\retrieve.mdx` | `sdks/methods/conferences/retrieve` | -- | 1.000 |
| `/compatibility-api/client-sdks/methods/conferences/update` | `compatibility-api\pages\sdks\methods\conferences\update.mdx` | `sdks/methods/conferences/update` | -- | 1.000 |
| `/compatibility-api/client-sdks/methods/cxml-applications` | `compatibility-api\pages\sdks\methods\cxml-applications\index.mdx` | `sdks/methods/cxml-applications` | -- | 1.000 |
| `/compatibility-api/client-sdks/methods/cxml-applications/create` | `compatibility-api\pages\sdks\methods\cxml-applications\create.mdx` | `sdks/methods/cxml-applications/create` | -- | 1.000 |
| `/compatibility-api/client-sdks/methods/cxml-applications/delete` | `compatibility-api\pages\sdks\methods\cxml-applications\delete.mdx` | `sdks/methods/cxml-applications/delete` | -- | 1.000 |
| `/compatibility-api/client-sdks/methods/cxml-applications/list` | `compatibility-api\pages\sdks\methods\cxml-applications\list.mdx` | `sdks/methods/cxml-applications/list` | -- | 1.000 |
| `/compatibility-api/client-sdks/methods/cxml-applications/retrieve` | `compatibility-api\pages\sdks\methods\cxml-applications\retrieve.mdx` | `sdks/methods/cxml-applications/retrieve` | -- | 1.000 |
| `/compatibility-api/client-sdks/methods/cxml-applications/update` | `compatibility-api\pages\sdks\methods\cxml-applications\update.mdx` | `sdks/methods/cxml-applications/update` | -- | 1.000 |
| `/compatibility-api/client-sdks/methods/fax-media` | `compatibility-api\pages\sdks\methods\fax-media\index.mdx` | `sdks/methods/fax-media` | -- | 1.000 |
| `/compatibility-api/client-sdks/methods/fax-media/delete` | `compatibility-api\pages\sdks\methods\fax-media\delete.mdx` | `sdks/methods/fax-media/delete` | -- | 1.000 |
| `/compatibility-api/client-sdks/methods/fax-media/retrieve` | `compatibility-api\pages\sdks\methods\fax-media\retrieve.mdx` | `sdks/methods/fax-media/retrieve` | -- | 1.000 |
| `/compatibility-api/client-sdks/methods/faxes` | `compatibility-api\pages\sdks\methods\faxes\index.mdx` | `sdks/methods/faxes` | -- | 1.000 |
| `/compatibility-api/client-sdks/methods/faxes/delete` | `compatibility-api\pages\sdks\methods\faxes\delete.mdx` | `sdks/methods/faxes/delete` | -- | 1.000 |
| `/compatibility-api/client-sdks/methods/faxes/list` | `compatibility-api\pages\sdks\methods\faxes\list.mdx` | `sdks/methods/faxes/list` | -- | 1.000 |
| `/compatibility-api/client-sdks/methods/faxes/retrieve` | `compatibility-api\pages\sdks\methods\faxes\retrieve.mdx` | `sdks/methods/faxes/retrieve` | -- | 1.000 |
| `/compatibility-api/client-sdks/methods/faxes/send` | `compatibility-api\pages\sdks\methods\faxes\send.mdx` | `sdks/methods/faxes/send` | -- | 1.000 |
| `/compatibility-api/client-sdks/methods/faxes/update` | `compatibility-api\pages\sdks\methods\faxes\update.mdx` | `sdks/methods/faxes/update` | -- | 1.000 |
| `/compatibility-api/client-sdks/methods/incoming-phone-numbers` | `compatibility-api\pages\sdks\methods\incoming-phone-numbers\index.mdx` | `sdks/methods/incoming-phone-numbers` | -- | 1.000 |
| `/compatibility-api/client-sdks/methods/incoming-phone-numbers/create` | `compatibility-api\pages\sdks\methods\incoming-phone-numbers\create.mdx` | `sdks/methods/incoming-phone-numbers/create` | -- | 1.000 |
| `/compatibility-api/client-sdks/methods/incoming-phone-numbers/delete` | `compatibility-api\pages\sdks\methods\incoming-phone-numbers\delete.mdx` | `sdks/methods/incoming-phone-numbers/delete` | -- | 1.000 |
| `/compatibility-api/client-sdks/methods/incoming-phone-numbers/list` | `compatibility-api\pages\sdks\methods\incoming-phone-numbers\list.mdx` | `sdks/methods/incoming-phone-numbers/list` | -- | 1.000 |
| `/compatibility-api/client-sdks/methods/incoming-phone-numbers/retrieve` | `compatibility-api\pages\sdks\methods\incoming-phone-numbers\retrieve.mdx` | `sdks/methods/incoming-phone-numbers/retrieve` | -- | 1.000 |
| `/compatibility-api/client-sdks/methods/incoming-phone-numbers/update` | `compatibility-api\pages\sdks\methods\incoming-phone-numbers\update.mdx` | `sdks/methods/incoming-phone-numbers/update` | -- | 1.000 |
| `/compatibility-api/client-sdks/methods/media` | `compatibility-api\pages\sdks\methods\media\index.mdx` | `sdks/methods/media` | -- | 1.000 |
| `/compatibility-api/client-sdks/methods/media/delete` | `compatibility-api\pages\sdks\methods\media\delete.mdx` | `sdks/methods/media/delete` | -- | 1.000 |
| `/compatibility-api/client-sdks/methods/media/list` | `compatibility-api\pages\sdks\methods\media\list.mdx` | `sdks/methods/media/list` | -- | 1.000 |
| `/compatibility-api/client-sdks/methods/media/retrieve` | `compatibility-api\pages\sdks\methods\media\retrieve.mdx` | `sdks/methods/media/retrieve` | -- | 1.000 |
| `/compatibility-api/client-sdks/methods/messaging` | `compatibility-api\pages\sdks\methods\messaging\index.mdx` | `sdks/methods/messaging` | -- | 1.000 |
| `/compatibility-api/client-sdks/methods/messaging/create` | `compatibility-api\pages\sdks\methods\messaging\create.mdx` | `sdks/methods/messaging/create` | -- | 1.000 |
| `/compatibility-api/client-sdks/methods/messaging/delete` | `compatibility-api\pages\sdks\methods\messaging\delete.mdx` | `sdks/methods/messaging/delete` | -- | 1.000 |
| `/compatibility-api/client-sdks/methods/messaging/list` | `compatibility-api\pages\sdks\methods\messaging\list.mdx` | `sdks/methods/messaging/list` | -- | 1.000 |
| `/compatibility-api/client-sdks/methods/messaging/retrieve` | `compatibility-api\pages\sdks\methods\messaging\retrieve.mdx` | `sdks/methods/messaging/retrieve` | -- | 1.000 |
| `/compatibility-api/client-sdks/methods/messaging/update` | `compatibility-api\pages\sdks\methods\messaging\update.mdx` | `sdks/methods/messaging/update` | -- | 1.000 |
| `/compatibility-api/client-sdks/methods/queue-members` | `compatibility-api\pages\sdks\methods\queue-members\index.mdx` | `sdks/methods/queue-members` | -- | 1.000 |
| `/compatibility-api/client-sdks/methods/queue-members/list` | `compatibility-api\pages\sdks\methods\queue-members\list.mdx` | `sdks/methods/queue-members/list` | -- | 1.000 |
| `/compatibility-api/client-sdks/methods/queue-members/retrieve` | `compatibility-api\pages\sdks\methods\queue-members\retrieve.mdx` | `sdks/methods/queue-members/retrieve` | -- | 1.000 |
| `/compatibility-api/client-sdks/methods/queue-members/update` | `compatibility-api\pages\sdks\methods\queue-members\update.mdx` | `sdks/methods/queue-members/update` | -- | 1.000 |
| `/compatibility-api/client-sdks/methods/queues` | `compatibility-api\pages\sdks\methods\queues\index.mdx` | `sdks/methods/queues` | -- | 1.000 |
| `/compatibility-api/client-sdks/methods/queues/create` | `compatibility-api\pages\sdks\methods\queues\create.mdx` | `sdks/methods/queues/create` | -- | 1.000 |
| `/compatibility-api/client-sdks/methods/queues/delete` | `compatibility-api\pages\sdks\methods\queues\delete.mdx` | `sdks/methods/queues/delete` | -- | 1.000 |
| `/compatibility-api/client-sdks/methods/queues/list` | `compatibility-api\pages\sdks\methods\queues\list.mdx` | `sdks/methods/queues/list` | -- | 1.000 |
| `/compatibility-api/client-sdks/methods/queues/retrieve` | `compatibility-api\pages\sdks\methods\queues\retrieve.mdx` | `sdks/methods/queues/retrieve` | -- | 1.000 |
| `/compatibility-api/client-sdks/methods/queues/retrieve-members-waiting-in-queue` | `compatibility-api\pages\sdks\methods\queues\retrieve-members-waiting-in-queue.mdx` | `sdks/methods/queues/retrieve-members-waiting-in-queue` | -- | 1.000 |
| `/compatibility-api/client-sdks/methods/queues/update` | `compatibility-api\pages\sdks\methods\queues\update.mdx` | `sdks/methods/queues/update` | -- | 1.000 |
| `/compatibility-api/client-sdks/methods/recording-transcriptions` | `compatibility-api\pages\sdks\methods\recording-transcriptions\index.mdx` | `sdks/methods/recording-transcriptions` | -- | 1.000 |
| `/compatibility-api/client-sdks/methods/recording-transcriptions/delete` | `compatibility-api\pages\sdks\methods\recording-transcriptions\delete.mdx` | `sdks/methods/recording-transcriptions/delete` | -- | 1.000 |
| `/compatibility-api/client-sdks/methods/recording-transcriptions/list` | `compatibility-api\pages\sdks\methods\recording-transcriptions\list.mdx` | `sdks/methods/recording-transcriptions/list` | -- | 1.000 |
| `/compatibility-api/client-sdks/methods/recording-transcriptions/retrieve` | `compatibility-api\pages\sdks\methods\recording-transcriptions\retrieve.mdx` | `sdks/methods/recording-transcriptions/retrieve` | -- | 1.000 |
| `/compatibility-api/client-sdks/methods/recordings` | `compatibility-api\pages\sdks\methods\recordings\index.mdx` | `sdks/methods/recordings` | -- | 1.000 |
| `/compatibility-api/client-sdks/methods/recordings/create` | `compatibility-api\pages\sdks\methods\recordings\create.mdx` | `sdks/methods/recordings/create` | -- | 1.000 |
| `/compatibility-api/client-sdks/methods/recordings/delete` | `compatibility-api\pages\sdks\methods\recordings\delete.mdx` | `sdks/methods/recordings/delete` | -- | 1.000 |
| `/compatibility-api/client-sdks/methods/recordings/list` | `compatibility-api\pages\sdks\methods\recordings\list.mdx` | `sdks/methods/recordings/list` | -- | 1.000 |
| `/compatibility-api/client-sdks/methods/recordings/retrieve` | `compatibility-api\pages\sdks\methods\recordings\retrieve.mdx` | `sdks/methods/recordings/retrieve` | -- | 1.000 |
| `/compatibility-api/client-sdks/methods/recordings/update` | `compatibility-api\pages\sdks\methods\recordings\update.mdx` | `sdks/methods/recordings/update` | -- | 1.000 |
| `/compatibility-api/cxml/fax/reject` | `compatibility-api/pages/cxml/fax/reject.mdx` | `cxml/fax/reject` | `/cxml/reference/fax/reject` | 0.904 |
| `/compatibility-api/cxml/messaging/redirect` | `compatibility-api/pages/cxml/messaging/redirect.mdx` | `cxml/messaging/redirect` | `/cxml/reference/messaging/redirect` | 0.858 |
| `/compatibility-api/cxml/voice/connect` | `compatibility-api/pages/cxml/voice/connect.mdx` | `cxml/voice/connect` | `/cxml/reference/voice/connect` | 0.878 |
| `/compatibility-api/cxml/voice/denoise` | `compatibility-api/pages/cxml/voice/denoise.mdx` | `cxml/voice/denoise` | `/cxml/reference/voice/denoise` | 0.987 |
| `/compatibility-api/cxml/voice/gather` | `compatibility-api/pages/cxml/voice/gather.mdx` | `cxml/voice/gather` | `/cxml/reference/voice/gather` | 0.740 |
| `/compatibility-api/cxml/voice/hangup` | `compatibility-api/pages/cxml/voice/hangup.mdx` | `cxml/voice/hangup` | `/cxml/reference/voice/hangup` | 0.953 |
| `/compatibility-api/cxml/voice/leave` | `compatibility-api/pages/cxml/voice/leave.mdx` | `cxml/voice/leave` | `/cxml/reference/voice/leave` | 0.957 |
| `/compatibility-api/cxml/voice/pause` | `compatibility-api/pages/cxml/voice/pause.mdx` | `cxml/voice/pause` | `/cxml/reference/voice/pause` | 0.906 |
| `/compatibility-api/cxml/voice/pay/parameter` | `compatibility-api/pages/cxml/voice/pay/parameter.mdx` | `cxml/voice/pay/parameter` | `/cxml/reference/voice/pay/parameter` | 0.986 |
| `/compatibility-api/cxml/voice/pay/prompt` | `compatibility-api/pages/cxml/voice/pay/prompt.mdx` | `cxml/voice/pay/prompt` | `/cxml/reference/voice/pay/prompt` | 0.776 |
| `/compatibility-api/cxml/voice/play` | `compatibility-api/pages/cxml/voice/play.mdx` | `cxml/voice/play` | `/cxml/reference/voice/play` | 0.804 |
| `/compatibility-api/cxml/voice/queue-noun` | `compatibility-api/pages/cxml/voice/queue-noun.mdx` | `cxml/voice/queue` | `/cxml/reference/voice/queue` | 0.770 |
| `/compatibility-api/cxml/voice/redirect` | `compatibility-api/pages/cxml/voice/redirect.mdx` | `cxml/voice/redirect` | `/cxml/reference/voice/redirect` | 0.913 |
| `/compatibility-api/cxml/voice/refer` | `compatibility-api/pages/cxml/voice/refer.mdx` | `cxml/voice/refer` | `/cxml/reference/voice/refer` | 0.745 |
| `/compatibility-api/cxml/voice/reject` | `compatibility-api/pages/cxml/voice/reject.mdx` | `cxml/voice/reject` | `/cxml/reference/voice/reject` | 0.829 |
| `/compatibility-api/cxml/voice/room-noun` | `compatibility-api/pages/cxml/voice/room-noun.mdx` | `cxml/voice/room` | `/cxml/reference/voice/room` | 0.886 |
| `/compatibility-api/cxml/voice/say` | `compatibility-api/pages/cxml/voice/say.mdx` | `cxml/voice/say` | `/cxml/reference/voice/say` | 0.729 |
| `/compatibility-api/cxml/voice/stream` | `compatibility-api/pages/cxml/voice/stream.mdx` | `cxml/voice/stream` | `/cxml/reference/voice/stream` | 0.859 |
| `/compatibility-api/cxml/voice/verto-noun` | `compatibility-api/pages/cxml/voice/verto-noun.mdx` | `cxml/voice/verto` | `/cxml/reference/voice/verto` | 0.992 |
| `/compatibility-api/cxml/voice/virtualagent-noun` | `compatibility-api/pages/cxml/voice/virtualagent-noun.mdx` | `cxml/voice/virtualagent` | `/cxml/reference/voice/virtualagent` | 0.802 |
| `/compatibility-api/sdks` | `compatibility-api\pages\sdks\core\overview.mdx` | `sdks` | -- | 1.000 |
| `/fax/getting-started/common-fax-errors` | `platform/pages/calling/fax/common-fax-errors.mdx` | `/fax/common-fax-errors` | `/fax/common-fax-errors` | 0.999 |
| `/messaging/getting-started/receiving-your-first-sms` | `compatibility-api/pages/cxml/guides/receiving-your-first-sms.mdx` | `/cxml/guides/receiving-your-first-sms` | `/guides/receiving-your-first-sms` | 0.914 |
| `/messaging/getting-started/sending-your-first-sms` | `compatibility-api/pages/cxml/guides/sending-your-first-sms.mdx` | `/cxml/guides/sending-your-first-sms` | `/guides/sending-your-first-sms` | 0.966 |
| `/messaging/guides/general/messaging-character-limits` | `platform/pages/messaging/sms/messaging-character-limits.mdx` | `/messaging/sms/messaging-character-limits` | `/messaging/messaging-character-limits` | 0.967 |
| `/messaging/guides/general/messaging-mime-types` | `platform/pages/messaging/sms/messaging-mime-types.mdx` | `/messaging/sms/messaging-mime-types` | `/messaging/messaging-mime-types` | 1.000 |
| `/platform/basics/security-and-compliance/webhook-security` | `platform/pages/platform/core/webhooks/webhook-security.mdx` | `/basics/security/webhook-security` | `/basics/webhook-security` | 0.960 |
| `/platform/dashboard/get-started/phone-numbers` | `platform/pages/platform/phone-numbers/overview.mdx` | `/phone-numbers` | `/phone-numbers` | 0.744 |
| `/platform/dashboard/getting-started/signing-up-for-a-space` | `platform/pages/setup/create-an-account.mdx` | `/get-started/create-an-account` | `/get-started/create-an-account` | 0.733 |
| `/platform/dashboard/getting-started/your-signalwire-api-space` | `platform/pages/setup/api-credentials.mdx` | `/get-started/api-credentials` | `/get-started/api-credentials` | 0.729 |
| `/platform/dashboard/guides/what-is-a-sid` | `platform/pages/platform/core/segment-ids.mdx` | `/platform/basics/segment-ids` | `/basics/segment-ids` | 0.854 |
| `/platform/phone-numbers/getting-started/porting-into-signalwire` | `platform/pages/setup/porting-into-signalwire.mdx` | `/get-started/porting-into-signalwire` | `/get-started/porting-into-signalwire` | 0.879 |
| `/platform/phone-numbers/getting-started/what-is-e164` | `platform/pages/platform/phone-numbers/what-is-e164.mdx` | `/platform/phone-numbers/what-is-e164` | `/phone-numbers/what-is-e164` | 1.000 |
| `/sdks/browser-sdk/chat` | `browser-sdk/pages/latest/reference/chat/index.mdx` | `/reference/chat` | `/reference/chat` | 0.951 |
| `/sdks/browser-sdk/chat/member` | `browser-sdk/pages/latest/reference/chat/chat-chatmember.mdx` | `/reference/chat/chat-member` | `/reference/chat/chat-member` | 0.900 |
| `/sdks/browser-sdk/chat/message` | `browser-sdk/pages/latest/reference/chat/chat-chatmessage.mdx` | `/reference/chat/chat-message` | `/reference/chat/chat-message` | 0.836 |
| `/sdks/browser-sdk/guides/video/switch-webcam-or-microphone` | `browser-sdk/pages/latest/guides/video/switch-webcam-or-microphone-with-signalwire-video-api.mdx` | `/guides/switch-devices-during-calls` | `/guides/switch-devices-during-calls` | 0.882 |
| `/sdks/browser-sdk/pubsub` | `browser-sdk/pages/latest/reference/pubsub/index.mdx` | `/reference/pubsub` | `/reference/pubsub` | 0.962 |
| `/sdks/browser-sdk/pubsub/message` | `browser-sdk/pages/latest/reference/pubsub/pubsub-pubsubmessage.mdx` | `/reference/pubsub/pubsub-message` | `/reference/pubsub/pubsub-message` | 0.900 |
| `/sdks/browser-sdk/signalwire-client` | `browser-sdk/pages/latest/reference/signalwire-client/index.mdx` | `/reference/signalwire-client` | `/reference/signalwire-client` | 0.951 |
| `/sdks/browser-sdk/signalwire-client/client/address` | `browser-sdk/pages/latest/reference/signalwire-client/client/address.mdx` | `/reference/signalwire-client/client/address` | `/reference/signalwire-client/client/address` | 1.000 |
| `/sdks/browser-sdk/signalwire-client/client/chat` | `browser-sdk/pages/latest/reference/signalwire-client/client/chat.mdx` | `/reference/signalwire-client/client/chat` | `/reference/signalwire-client/client/chat` | 0.999 |
| `/sdks/browser-sdk/signalwire-client/client/conversation` | `browser-sdk/pages/latest/reference/signalwire-client/client/conversation.mdx` | `/reference/signalwire-client/client/conversation` | `/reference/signalwire-client/client/conversation` | 1.000 |
| `/sdks/browser-sdk/signalwire-client/notifications` | `browser-sdk/pages/latest/reference/signalwire-client/notifications.mdx` | `/reference/signalwire-client/notifications` | `/reference/signalwire-client/notifications` | 1.000 |
| `/sdks/browser-sdk/signalwire-client/utils` | `browser-sdk/pages/latest/reference/signalwire-client/utils.mdx` | `/reference/signalwire-client/utils` | `/reference/signalwire-client/utils` | 0.996 |
| `/sdks/browser-sdk/v2` | `browser-sdk/pages/v2/reference/core/overview.mdx` | `` | `/reference/core/overview` | 0.840 |
| `/sdks/browser-sdk/v2/call` | `browser-sdk/pages/v2/reference/core/call.mdx` | `` | `/reference/core/call` | 1.000 |
| `/sdks/browser-sdk/v2/client` | `browser-sdk/pages/v2/reference/core/relay-client.mdx` | `/reference/relay-client` | `/reference/relay-client` | 0.900 |
| `/sdks/browser-sdk/v2/guides/v2-vs-v3` | `browser-sdk/pages/v2/reference/core/v2-vs-v3.mdx` | `/reference/v2-vs-v3` | `/reference/v2-vs-v3` | 0.998 |
| `/sdks/browser-sdk/v2/notification` | `browser-sdk/pages/v2/reference/core/notification.mdx` | `` | `/reference/core/notification` | 1.000 |
| `/sdks/browser-sdk/video/local-overlay` | `browser-sdk/pages/latest/reference/video/video-localoverlay.mdx` | `/reference/video/local-overlay` | `/reference/video/local-overlay` | 0.758 |
| `/sdks/browser-sdk/video/room-device` | `browser-sdk/pages/latest/reference/video/video-roomdevice.mdx` | `/reference/video/room-device` | `/reference/video/room-device` | 0.945 |
| `/sdks/browser-sdk/video/room-screenshare` | `browser-sdk/pages/latest/reference/video/video-roomscreenshare.mdx` | `/reference/video/room-screen-share` | `/reference/video/room-screen-share` | 0.959 |
| `/sdks/browser-sdk/video/room-session-device` | `browser-sdk/pages/latest/reference/video/video-roomdevice.mdx` | `/reference/video/room-device` | `/reference/video/room-device` | 0.885 |
| `/sdks/browser-sdk/video/room-session-playback` | `browser-sdk/pages/latest/reference/video/video-roomsessionplayback.mdx` | `/reference/video/room-session-playback` | `/reference/video/room-session-playback` | 0.716 |
| `/sdks/browser-sdk/video/room-session-screenshare` | `browser-sdk/pages/latest/reference/video/video-roomscreenshare.mdx` | `/reference/video/room-screen-share` | `/reference/video/room-screen-share` | 0.918 |
| `/sdks/realtime-sdk/chat/chat-member` | `realtime-sdk/pages/latest/tech-ref/chat/chat-chatmember.mdx` | `reference/chat/chat-member` | `/reference/chat/chat-member` | 0.937 |
| `/sdks/realtime-sdk/chat/chat-message` | `realtime-sdk/pages/latest/tech-ref/chat/chat-chatmessage.mdx` | `reference/chat/chat-message` | `/reference/chat/chat-message` | 0.925 |
| `/sdks/realtime-sdk/guides/voice/first-steps-with-voice` | `realtime-sdk/pages/latest/guides/voice/make-and-receive-calls.mdx` | `/guides/make-and-receive-calls` | `/guides/make-and-receive-calls` | 0.824 |
| `/sdks/realtime-sdk/messaging/message-contract` | `realtime-sdk/pages/latest/tech-ref/messaging/messaging-messagecontract.mdx` | `reference/messaging/message-contract` | `/reference/messaging/message-contract` | 0.908 |
| `/sdks/realtime-sdk/messaging/messaging-sendresult` | `realtime-sdk/pages/latest/tech-ref/messaging/messaging-messagingsendresult.mdx` | `reference/messaging/messaging-send-result` | `/reference/messaging/messaging-send-result` | 0.901 |
| `/sdks/realtime-sdk/pubsub/pubsubmessage` | `realtime-sdk/pages/latest/tech-ref/pubsub/pubsub-pubsubmessage.mdx` | `reference/pubsub/pubsub-message` | `/reference/pubsub/pubsub-message` | 0.828 |
| `/sdks/realtime-sdk/v3/chat/member` | `realtime-sdk/pages/v3/tech-ref/chat/chat-chatmember.mdx` | `reference/chat/chat-member` | `/reference/chat/chat-member` | 0.900 |
| `/sdks/realtime-sdk/v3/chat/message` | `realtime-sdk/pages/v3/tech-ref/chat/chat-chatmessage.mdx` | `reference/chat/chat-message` | `/reference/chat/chat-message` | 0.900 |
| `/sdks/realtime-sdk/v3/guides/messaging/first-steps-with-messaging` | `realtime-sdk/pages/latest/guides/messaging/first-steps-with-messaging.mdx` | `/guides/first-steps-with-messaging` | `/guides/first-steps-with-messaging` | 0.844 |
| `/sdks/realtime-sdk/v3/guides/realtime-relay-v4-vs-v3` | `realtime-sdk/pages/v3/tech-ref/core/migration-to-v4.mdx` | `/migration-to-v4` | `/migration-to-v4` | 0.883 |
| `/sdks/realtime-sdk/v3/guides/voice/first-steps-with-voice` | `realtime-sdk/pages/latest/guides/voice/make-and-receive-calls.mdx` | `/guides/make-and-receive-calls` | `/guides/make-and-receive-calls` | 0.707 |
| `/sdks/realtime-sdk/v3/messaging/message-contract` | `realtime-sdk/pages/v3/tech-ref/messaging/messaging-messagecontract.mdx` | `reference/messaging/message-contract` | `/reference/messaging/message-contract` | 0.946 |
| `/sdks/realtime-sdk/v3/messaging/messaging-sendresult` | `realtime-sdk/pages/v3/tech-ref/messaging/messaging-messagingsendresult.mdx` | `reference/messaging/messaging-send-result` | `/reference/messaging/messaging-send-result` | 0.963 |
| `/sdks/realtime-sdk/v3/realtime-client` | `realtime-sdk/pages/v3/tech-ref/realtime-client/index.mdx` | `reference/realtime-client` | `/reference/realtime-client` | 0.877 |
| `/sdks/realtime-sdk/v3/task` | `realtime-sdk/pages/v3/tech-ref/task/overview.mdx` | `reference/task` | `/reference/task` | 0.764 |
| `/sdks/realtime-sdk/v3/video/roomsession-fullstate` | `realtime-sdk/pages/v3/tech-ref/video/video-roomsessionfullstate.mdx` | `reference/video/room-session-full-state` | `/reference/video/room-session-full-state` | 0.932 |
| `/sdks/realtime-sdk/v3/video/roomsession-member` | `realtime-sdk/pages/v3/tech-ref/video/video-roomsessionmember.mdx` | `reference/video/room-session-member` | `/reference/video/room-session-member` | 0.958 |
| `/sdks/realtime-sdk/v3/video/roomsession-playback` | `realtime-sdk/pages/v3/tech-ref/video/video-roomsessionplayback.mdx` | `reference/video/room-session-playback` | `/reference/video/room-session-playback` | 0.965 |
| `/sdks/realtime-sdk/v3/video/roomsession-recording` | `realtime-sdk/pages/v3/tech-ref/video/video-roomsessionrecording.mdx` | `reference/video/room-session-recording` | `/reference/video/room-session-recording` | 0.970 |
| `/sdks/realtime-sdk/v3/video/roomsession-stream` | `realtime-sdk/pages/v3/tech-ref/video/video-roomsessionstream.mdx` | `reference/video/room-session-stream` | `/reference/video/room-session-stream` | 0.966 |
| `/sdks/realtime-sdk/v3/voice/call-collect` | `realtime-sdk/pages/v3/tech-ref/voice/callcollect.mdx` | `reference/voice/call-collect` | `/reference/voice/call-collect` | 0.991 |
| `/sdks/realtime-sdk/v3/voice/call-detect` | `realtime-sdk/pages/v3/tech-ref/voice/calldetect.mdx` | `reference/voice/call-detect` | `/reference/voice/call-detect` | 0.981 |
| `/sdks/realtime-sdk/v3/voice/call-playback` | `realtime-sdk/pages/v3/tech-ref/voice/callplayback.mdx` | `reference/voice/call-playback` | `/reference/voice/call-playback` | 0.983 |
| `/sdks/realtime-sdk/v3/voice/call-prompt` | `realtime-sdk/pages/v3/tech-ref/voice/callprompt.mdx` | `reference/voice/call-prompt` | `/reference/voice/call-prompt` | 0.981 |
| `/sdks/realtime-sdk/v3/voice/call-recording` | `realtime-sdk/pages/v3/tech-ref/voice/callrecording.mdx` | `reference/voice/call-recording` | `/reference/voice/call-recording` | 0.982 |
| `/sdks/realtime-sdk/v3/voice/call-state` | `realtime-sdk/pages/v3/tech-ref/voice/callstate.mdx` | `reference/voice/call-state` | `/reference/voice/call-state` | 0.950 |
| `/sdks/realtime-sdk/v3/voice/call-tap` | `realtime-sdk/pages/v3/tech-ref/voice/calltap.mdx` | `reference/voice/call-tap` | `/reference/voice/call-tap` | 0.984 |
| `/sdks/realtime-sdk/v3/voice/device-builder` | `realtime-sdk/pages/v3/tech-ref/voice/voice-devicebuilder.mdx` | `reference/voice/device-builder` | `/reference/voice/device-builder` | 0.948 |
| `/sdks/realtime-sdk/v3/voice/playlist` | `realtime-sdk/pages/v3/tech-ref/voice/voice-playlist.mdx` | `reference/voice/playlist` | `/reference/voice/playlist` | 0.840 |
| `/sdks/realtime-sdk/v3/voice/types` | `realtime-sdk/pages/v3/tech-ref/voice/types.mdx` | `reference/voice/types` | `/reference/voice/types` | 0.981 |
| `/sdks/realtime-sdk/video/room-session-member` | `realtime-sdk/pages/latest/tech-ref/video/video-roomsessionmember.mdx` | `reference/video/room-session-member` | `/reference/video/room-session-member` | 0.936 |
| `/sdks/realtime-sdk/video/room-session-playback` | `realtime-sdk/pages/latest/tech-ref/video/video-roomsessionplayback.mdx` | `reference/video/room-session-playback` | `/reference/video/room-session-playback` | 0.943 |
| `/sdks/realtime-sdk/video/roomsession-fullstate` | `realtime-sdk/pages/latest/tech-ref/video/video-roomsessionfullstate.mdx` | `reference/video/room-session-full-state` | `/reference/video/room-session-full-state` | 0.904 |
| `/sdks/realtime-sdk/video/roomsession-recording` | `realtime-sdk/pages/latest/tech-ref/video/video-roomsessionrecording.mdx` | `reference/video/room-session-recording` | `/reference/video/room-session-recording` | 0.954 |
| `/sdks/realtime-sdk/video/roomsession-stream` | `realtime-sdk/pages/latest/tech-ref/video/video-roomsessionstream.mdx` | `reference/video/room-session-stream` | `/reference/video/room-session-stream` | 0.935 |
| `/sdks/realtime-sdk/voice/call-collect` | `realtime-sdk/pages/latest/tech-ref/voice/callcollect.mdx` | `reference/voice/call-collect` | `/reference/voice/call-collect` | 0.955 |
| `/sdks/realtime-sdk/voice/call-detect` | `realtime-sdk/pages/latest/tech-ref/voice/calldetect.mdx` | `reference/voice/call-detect` | `/reference/voice/call-detect` | 0.968 |
| `/sdks/realtime-sdk/voice/call-playback` | `realtime-sdk/pages/latest/tech-ref/voice/callplayback.mdx` | `reference/voice/call-playback` | `/reference/voice/call-playback` | 0.974 |
| `/sdks/realtime-sdk/voice/call-prompt` | `realtime-sdk/pages/latest/tech-ref/voice/callprompt.mdx` | `reference/voice/call-prompt` | `/reference/voice/call-prompt` | 0.961 |
| `/sdks/realtime-sdk/voice/call-recording` | `realtime-sdk/pages/latest/tech-ref/voice/callrecording.mdx` | `reference/voice/call-recording` | `/reference/voice/call-recording` | 0.976 |
| `/sdks/realtime-sdk/voice/call-state` | `realtime-sdk/pages/latest/tech-ref/voice/callstate.mdx` | `reference/voice/call-state` | `/reference/voice/call-state` | 0.945 |
| `/sdks/realtime-sdk/voice/call-tap` | `realtime-sdk/pages/latest/tech-ref/voice/calltap.mdx` | `reference/voice/call-tap` | `/reference/voice/call-tap` | 0.974 |
| `/sdks/realtime-sdk/voice/device-builder` | `realtime-sdk/pages/latest/tech-ref/voice/voice-devicebuilder.mdx` | `reference/voice/device-builder` | `/reference/voice/device-builder` | 0.927 |
| `/sdks/realtime-sdk/voice/playlist` | `realtime-sdk/pages/latest/tech-ref/voice/voice-playlist.mdx` | `reference/voice/playlist` | `/reference/voice/playlist` | 0.790 |
| `/sdks/realtime-sdk/voice/types` | `realtime-sdk/pages/latest/tech-ref/voice/types.mdx` | `reference/voice/types` | `/reference/voice/types` | 0.864 |
| `/video/faq` | `platform/pages/calling/video/overview.mdx` | `/video` | `/video` | 0.710 |
| `/video/getting-started/simple-video-demo` | `browser-sdk/pages/latest/guides/video/getting-started-with-the-signalwire-video/index.mdx` | `/guides/build-a-video-calling-application-with-the-browser-sdk` | `/guides/build-a-video-calling-application-with-the-browser-sdk` | 0.854 |
| `/video/guides/making-a-clubhouse-clone` | `browser-sdk/pages/latest/guides/video/making-a-clubhouse-clone/index.mdx` | `/guides/make-a-clubhouse-like-application` | `/guides/make-a-clubhouse-like-application` | 0.987 |
| `/video/guides/making-a-zoom-clone` | `browser-sdk/pages/latest/guides/video/zoom-clone-2/index.mdx` | `/guides/make-a-zoom-like-application` | `/guides/make-a-zoom-like-application` | 0.917 |
| `/voice/getting-started/how-to-gather-keypad-input-from-user` | `compatibility-api/pages/cxml/guides/gathering-user-input.mdx` | `/cxml/guides/gathering-user-input` | `/guides/gathering-user-input` | 0.702 |
| `/voice/getting-started/recording-calls` | `swml/pages/guides/recipes/recording-calls.mdx` | `/guides/recipes/recording-calls` | `/guides/recording-calls` | 0.796 |

## Uncertain matches (manual review needed)

| Old URL | Fern file | Current slug | New slug | Confidence |
|---------|-----------|--------------|----------|------------|
| `/call-flow-builder/conditions` | `call-flow-builder/pages/nodes/conditions.mdx` | `/reference/conditions` | `/reference/conditions` | 0.544 |
| `/call-flow-builder/forward-to-phone` | `call-flow-builder/pages/nodes/forward_to_phone.mdx` | `/reference/forward-to-phone` | `/reference/forward-to-phone` | 0.698 |
| `/call-flow-builder/gather-input` | `call-flow-builder/pages/nodes/gather_input.mdx` | `/reference/gather-input` | `/reference/gather-input` | 0.625 |
| `/call-flow-builder/hangup-call` | `call-flow-builder/pages/nodes/hangup_call.mdx` | `/reference/hangup-call` | `/reference/hangup-call` | 0.663 |
| `/call-flow-builder/play-audio-or-tts` | `call-flow-builder/pages/nodes/play_audio_or_tts.mdx` | `/reference/play-audio-or-tts` | `/reference/play-audio-or-tts` | 0.454 |
| `/chat/faq` | `platform/pages/messaging/chat/overview.mdx` | `/chat` | `/chat` | 0.437 |
| `/compatibility-api/client-sdks/api/available-phone-numbers/find-toll-free` | `compatibility-api/pages/sdks/methods/available-phone-numbers/toll-free.mdx` | `sdks/methods/available-phone-numbers/find-toll-free` | `/sdks/reference/available-phone-numbers/find-toll-free` | 0.685 |
| `/compatibility-api/client-sdks/api/available-phone-numbers/search-local` | `compatibility-api/pages/sdks/methods/available-phone-numbers/local.mdx` | `sdks/methods/available-phone-numbers/search-local` | `/sdks/reference/available-phone-numbers/search-local` | 0.464 |
| `/compatibility-api/client-sdks/methods/fax-media/list-all` | `compatibility-api/pages/sdks/methods/fax-media/list-all-media.mdx` | `sdks/methods/fax-media/list-all` | `/sdks/reference/fax-media/list-all` | 0.592 |
| `/compatibility-api/cxml` | `compatibility-api/pages/cxml/core/cxml-spec.mdx` | `cxml` | `/cxml/reference` | 0.458 |
| `/compatibility-api/cxml/fax` | `compatibility-api/pages/cxml/fax/overview.mdx` | `cxml/fax` | `/cxml/reference/fax` | 0.489 |
| `/compatibility-api/cxml/fax/receive` | `compatibility-api/pages/cxml/fax/receive.mdx` | `cxml/fax/receive` | `/cxml/reference/fax/receive` | 0.700 |
| `/compatibility-api/cxml/messaging` | `compatibility-api/pages/cxml/fax/overview.mdx` | `cxml/fax` | `/cxml/reference/fax` | 0.311 |
| `/compatibility-api/cxml/messaging/message` | `compatibility-api/pages/cxml/messaging/message.mdx` | `cxml/messaging/message` | `/cxml/reference/messaging/message` | 0.533 |
| `/compatibility-api/cxml/voice` | `compatibility-api/pages/cxml/voice/overview.mdx` | `cxml/voice` | `/cxml/reference/voice` | 0.427 |
| `/compatibility-api/cxml/voice/conference-noun` | `compatibility-api/pages/cxml/voice/conference-noun.mdx` | `cxml/voice/conference` | `/cxml/reference/voice/conference` | 0.561 |
| `/compatibility-api/cxml/voice/dial` | `compatibility-api/pages/cxml/voice/dial.mdx` | `cxml/voice/dial` | `/cxml/reference/voice/dial` | 0.578 |
| `/compatibility-api/cxml/voice/echo` | `compatibility-api/pages/cxml/voice/echo.mdx` | `cxml/voice/echo` | `/cxml/reference/voice/echo` | 0.656 |
| `/compatibility-api/cxml/voice/enqueue` | `compatibility-api/pages/cxml/voice/enqueue.mdx` | `cxml/voice/enqueue` | `/cxml/reference/voice/enqueue` | 0.477 |
| `/compatibility-api/cxml/voice/number-noun` | `compatibility-api/pages/cxml/voice/number-noun.mdx` | `cxml/voice/number` | `/cxml/reference/voice/number` | 0.559 |
| `/compatibility-api/cxml/voice/pay` | `compatibility-api/pages/cxml/voice/pay/index.mdx` | `cxml/voice/pay` | `/cxml/reference/voice/pay` | 0.694 |
| `/compatibility-api/cxml/voice/record` | `compatibility-api/pages/cxml/voice/record.mdx` | `cxml/voice/record` | `/cxml/reference/voice/record` | 0.625 |
| `/compatibility-api/cxml/voice/sip-noun` | `compatibility-api/pages/cxml/voice/sip-noun.mdx` | `cxml/voice/sip` | `/cxml/reference/voice/sip` | 0.671 |
| `/compatibility-api/cxml/voice/sms` | `compatibility-api/pages/cxml/voice/sms.mdx` | `cxml/voice/sms` | `/cxml/reference/voice/sms` | 0.587 |
| `/fax/get-started` | `browser-sdk/pages/latest/reference/video/RoomSession/methods/leave.mdx` | `` | `/reference/video/roomsession/methods/leave` | 0.304 |
| `/fax/getting-started/first-steps-with-fax` | `platform/pages/calling/fax/overview.mdx` | `/fax` | `/fax` | 0.499 |
| `/fax/getting-started/securing-callback-for-inbound-fax-with-cxml` | `compatibility-api/pages/cxml/guides/securing-callback-for-inbound-fax.mdx` | `/cxml/guides/securing-callback-for-inbound-fax` | `/guides/securing-callback-for-inbound-fax` | 0.367 |
| `/messaging/faq` | `platform/pages/messaging/sms/overview.mdx` | `/messaging` | `/messaging` | 0.540 |
| `/messaging/guides/general` | `browser-sdk/pages/latest/reference/signalwire-client/client/methods/disconnect.mdx` | `` | `/reference/signalwire-client/client/methods/disconnect` | 0.320 |
| `/platform/basics/general/what-is-sip` | `platform/pages/calling/voice/SIP/overview.mdx` | `/voice/sip` | `/voice/sip` | 0.373 |
| `/rest/signalwire-rest/guides` | `browser-sdk/pages/latest/reference/signalwire-client/client/methods/disconnect.mdx` | `` | `/reference/signalwire-client/client/methods/disconnect` | 0.308 |
| `/sdks/browser-sdk/chat/member-entity` | `browser-sdk/pages/latest/reference/chat/chatmemberentity.mdx` | `/reference/chat/chat-member-entity` | `/reference/chat/chat-member-entity` | 0.482 |
| `/sdks/browser-sdk/chat/message-entity` | `browser-sdk/pages/latest/reference/chat/chatmessageentity.mdx` | `/reference/chat/chat-message-entity` | `/reference/chat/chat-message-entity` | 0.462 |
| `/sdks/browser-sdk/pubsub/client` | `browser-sdk/pages/latest/reference/chat/Client/index.mdx` | `/reference/chat/client` | `/reference/chat/client` | 0.368 |
| `/sdks/browser-sdk/signalwire-client/client` | `browser-sdk/pages/latest/reference/signalwire-client/client/index.mdx` | `/reference/signalwire-client/client` | `/reference/signalwire-client/client` | 0.522 |
| `/sdks/browser-sdk/technical-reference` | `browser-sdk/pages/latest/reference/core/overview.mdx` | `/` | `/` | 0.674 |
| `/sdks/browser-sdk/video` | `browser-sdk/pages/latest/reference/video/index.mdx` | `/reference/video` | `/reference/video` | 0.623 |
| `/sdks/browser-sdk/video/room-session-recording` | `browser-sdk/pages/latest/reference/video/video-roomsessionrecording.mdx` | `/reference/video/room-session-recording` | `/reference/video/room-session-recording` | 0.321 |
| `/sdks/browser-sdk/video/room-session-stream` | `browser-sdk/pages/latest/reference/video/video-roomsessionstream.mdx` | `/reference/video/room-session-stream` | `/reference/video/room-session-stream` | 0.584 |
| `/sdks/realtime-sdk/chat` | `realtime-sdk/pages/latest/tech-ref/chat/overview.mdx` | `reference/chat` | `/reference/chat` | 0.624 |
| `/sdks/realtime-sdk/messaging` | `realtime-sdk/pages/latest/tech-ref/messaging/overview.mdx` | `reference/messaging` | `/reference/messaging` | 0.616 |
| `/sdks/realtime-sdk/messaging/client` | `realtime-sdk/pages/latest/tech-ref/messaging/client/methods/listen.mdx` | `reference/messaging/client/methods/listen` | `/reference/messaging/client/methods/listen` | 0.381 |
| `/sdks/realtime-sdk/pubsub` | `realtime-sdk/pages/latest/tech-ref/pubsub/overview.mdx` | `reference/pubsub` | `/reference/pubsub` | 0.608 |
| `/sdks/realtime-sdk/pubsub/client` | `realtime-sdk/pages/latest/tech-ref/pubsub/client/methods/listen.mdx` | `reference/pubsub/client/methods/listen` | `/reference/pubsub/client/methods/listen` | 0.507 |
| `/sdks/realtime-sdk/realtime-client` | `realtime-sdk/pages/latest/tech-ref/core/realtime-client/index.mdx` | `reference/realtime-client` | `/reference/realtime-client` | 0.411 |
| `/sdks/realtime-sdk/task` | `realtime-sdk/pages/latest/tech-ref/task/overview.mdx` | `reference/task` | `/reference/task` | 0.687 |
| `/sdks/realtime-sdk/task/client` | `realtime-sdk/pages/latest/tech-ref/task/client/methods/listen.mdx` | `reference/task/client/methods/listen` | `/reference/task/client/methods/listen` | 0.439 |
| `/sdks/realtime-sdk/v3/chat` | `realtime-sdk/pages/v3/tech-ref/chat/overview.mdx` | `reference/chat` | `/reference/chat` | 0.549 |
| `/sdks/realtime-sdk/v3/guides/voice` | `realtime-sdk/pages/v3/tech-ref/video/client/methods/once.mdx` | `reference/video/client/methods/once` | `/reference/video/client/methods/once` | 0.301 |
| `/sdks/realtime-sdk/v3/messaging` | `realtime-sdk/pages/v3/tech-ref/messaging/overview.mdx` | `reference/messaging` | `/reference/messaging` | 0.665 |
| `/sdks/realtime-sdk/v3/pubsub` | `realtime-sdk/pages/v3/tech-ref/pubsub/overview.mdx` | `reference/pubsub` | `/reference/pubsub` | 0.600 |
| `/sdks/realtime-sdk/v3/pubsub/client` | `realtime-sdk/pages/v3/tech-ref/pubsub/client/methods/publish.mdx` | `reference/pubsub/client/methods/publish` | `/reference/pubsub/client/methods/publish` | 0.379 |
| `/sdks/realtime-sdk/v3/task/client` | `realtime-sdk/pages/v3/tech-ref/task/client/events.mdx` | `reference/task/client/events` | `/reference/task/client/events` | 0.364 |
| `/sdks/realtime-sdk/v3/video` | `realtime-sdk/pages/v3/tech-ref/video/overview.mdx` | `reference/video` | `/reference/video` | 0.607 |
| `/sdks/realtime-sdk/v3/voice` | `realtime-sdk/pages/v3/tech-ref/voice/overview.mdx` | `reference/voice` | `/reference/voice` | 0.585 |
| `/sdks/realtime-sdk/v3/voice/client` | `realtime-sdk/pages/v3/tech-ref/voice/voice-devicebuilder.mdx` | `reference/voice/device-builder` | `/reference/voice/device-builder` | 0.369 |
| `/sdks/realtime-sdk/video` | `realtime-sdk/pages/latest/tech-ref/video/overview.mdx` | `reference/video` | `/reference/video` | 0.588 |
| `/sdks/realtime-sdk/video/client` | `realtime-sdk/pages/latest/tech-ref/video/client/methods/listen.mdx` | `reference/video/client/methods/listen` | `/reference/video/client/methods/listen` | 0.396 |
| `/sdks/realtime-sdk/voice` | `realtime-sdk/pages/latest/tech-ref/task/overview.mdx` | `reference/task` | `/reference/task` | 0.472 |
| `/swml/methods/ai/prompt/contexts` | `swml/pages/reference/methods/ai/prompt/index.mdx` | `/swml/methods/ai/prompt` | `/reference/ai/prompt` | 0.376 |
| `/swml/methods/ai/prompt/pom` | `swml/pages/reference/methods/bedrock/prompt/index.mdx` | `/swml/methods/amazon_bedrock/prompt` | `/reference/amazon-bedrock/prompt` | 0.399 |
| `/voice/faq` | `platform/pages/calling/voice/overview.mdx` | `/voice` | `/voice` | 0.607 |
| `/voice/getting-started/how-to-forward-calls` | `swml/pages/guides/recipes/forwarding-calls.mdx` | `/guides/recipes/forwarding-calls` | `/guides/forwarding-calls` | 0.678 |
| `/voice/getting-started/how-to-set-up-voicemail` | `swml/pages/guides/recipes/voicemail.mdx` | `/guides/recipes/voicemail` | `/guides/voicemail` | 0.391 |
| `/voice/getting-started/making-and-receiving-phone-calls` | `swml/pages/guides/recipes/making-and-receiving-calls.mdx` | `/guides/recipes/making-and-receiving-calls` | `/guides/making-and-receiving-calls` | 0.603 |
| `/voice/guides/general/how-to-set-caller-id-or-cnam` | `platform/pages/calling/voice/basics/caller-id-and-cnam.mdx` | `/platform/basics/general/how-to-set-caller-id-or-cnam` | `/basics/how-to-set-caller-id-or-cnam` | 0.327 |

## Likely deleted

Pages with no matching content in Fern.

- `/ai/guides` -- No Fern page above similarity threshold
- `/ai/guides/integrations` -- No Fern page above similarity threshold
- `/ai/guides/integrations/livekit` -- No Fern page above similarity threshold
- `/ai/guides/integrations/vapi` -- No Fern page above similarity threshold
- `/cantina/user-guide` -- No Fern page above similarity threshold
- `/cantina/user-guide-for-admin-rights` -- No Fern page above similarity threshold
- `/chat/getting-started` -- No Fern page above similarity threshold
- `/chat/getting-started/chat-first-steps` -- No Fern page above similarity threshold
- `/chat/guides` -- No Fern page above similarity threshold
- `/chat/guides/build-a-react-chat-application` -- No Fern page above similarity threshold
- `/chat/guides/using-chat-to-send-sms-and-make-calls` -- No Fern page above similarity threshold
- `/cluecon-2024` -- No Fern page above similarity threshold
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
- `/fax/getting-started/fax-to-email` -- No Fern page above similarity threshold
- `/fax/getting-started/fax-with-retries` -- No Fern page above similarity threshold
- `/fax/getting-started/filter-faxes-by-number-status-and-date` -- No Fern page above similarity threshold
- `/fax/getting-started/list-faxes-to-csv-in-all-languages` -- No Fern page above similarity threshold
- `/home/calling/voice/getting-started` -- No Fern page above similarity threshold
- `/home/calling/voice/guides` -- No Fern page above similarity threshold
- `/home/messaging/sms/guides` -- No Fern page above similarity threshold
- `/home/platform/dashboard/administration` -- No Fern page above similarity threshold
- `/livewire/integrate-zendesk-signalwire-ai` -- No Fern page above similarity threshold
- `/livewire/smart-biz-ai` -- No Fern page above similarity threshold
- `/messaging/get-started` -- No Fern page above similarity threshold
- `/messaging/getting-started/campaign-registry/faq` -- No Fern page above similarity threshold
- `/messaging/getting-started/campaign-registry/pricing` -- No Fern page above similarity threshold
- `/messaging/getting-started/how-to-troubleshoot-common-messaging-issues` -- No Fern page above similarity threshold
- `/messaging/getting-started/platform-free-trial` -- No Fern page above similarity threshold
- `/messaging/guides/campaign-registry` -- No Fern page above similarity threshold
- `/messaging/guides/general/how-to-build-a-private-url-shortener` -- No Fern page above similarity threshold
- `/messaging/guides/general/how-to-find-unregistered-numbers-on-your-project` -- No Fern page above similarity threshold
- `/messaging/guides/general/toll-free-number-overview` -- No Fern page above similarity threshold
- `/platform/basics` -- No Fern page above similarity threshold
- `/platform/basics/general` -- No Fern page above similarity threshold
- `/platform/basics/guides` -- No Fern page above similarity threshold
- `/platform/basics/guides/getting-started-without-code` -- No Fern page above similarity threshold
- `/platform/basics/guides/how-to-test-api-requests-on-postman` -- No Fern page above similarity threshold
- `/platform/basics/guides/technical-troubleshooting` -- No Fern page above similarity threshold
- `/platform/basics/guides/technical-troubleshooting/common-webhook-errors` -- No Fern page above similarity threshold
- `/platform/basics/guides/technical-troubleshooting/creating-a-publically-exposed-webhook` -- No Fern page above similarity threshold
- `/platform/basics/guides/technical-troubleshooting/how-to-test-webhooks-with-ngrok` -- No Fern page above similarity threshold
- `/platform/basics/guides/webrtc-with-sip-over-websockets` -- No Fern page above similarity threshold
- `/platform/basics/security-and-compliance` -- No Fern page above similarity threshold
- `/platform/basics/security-and-compliance/fraud` -- No Fern page above similarity threshold
- `/platform/basics/security-and-compliance/hipaapci-compliance` -- No Fern page above similarity threshold
- `/platform/call-fabric/resources/ai-agents` -- No Fern page above similarity threshold
- `/platform/call-fabric/resources/cxml-scripts` -- No Fern page above similarity threshold
- `/platform/call-fabric/resources/dialogflow-agents` -- No Fern page above similarity threshold
- `/platform/call-fabric/resources/freeswitch-connectors` -- No Fern page above similarity threshold
- `/platform/call-fabric/resources/relay-applications` -- No Fern page above similarity threshold
- `/platform/call-fabric/resources/sip-gateways` -- No Fern page above similarity threshold
- `/platform/call-fabric/resources/subscribers` -- No Fern page above similarity threshold
- `/platform/call-fabric/resources/swml-scripts` -- No Fern page above similarity threshold
- `/platform/call-fabric/resources/video-rooms` -- No Fern page above similarity threshold
- `/platform/dashboard` -- No Fern page above similarity threshold
- `/platform/dashboard/billing` -- No Fern page above similarity threshold
- `/platform/dashboard/guides/changing-settings-in-your-signalwire-space` -- No Fern page above similarity threshold
- `/platform/dashboard/guides/closing-a-signalwire-account` -- No Fern page above similarity threshold
- `/platform/dashboard/guides/export-logs-from-your-signalwire-space` -- No Fern page above similarity threshold
- `/platform/dashboard/guides/how-to-request-an-increase-to-your-signalwire-space-limits` -- No Fern page above similarity threshold
- `/platform/dashboard/guides/subprojects` -- No Fern page above similarity threshold
- `/platform/dashboard/guides/suspended-signalwire-cloud-space` -- No Fern page above similarity threshold
- `/platform/dashboard/guides/user-management` -- No Fern page above similarity threshold
- `/platform/dashboard/reference-app` -- No Fern page above similarity threshold
- `/platform/integrations` -- No Fern page above similarity threshold
- `/platform/integrations/carriers` -- No Fern page above similarity threshold
- `/platform/integrations/carriers/thinq` -- No Fern page above similarity threshold
- `/platform/integrations/crm` -- No Fern page above similarity threshold
- `/platform/integrations/crm/zoho-crm-click-to-call` -- No Fern page above similarity threshold
- `/platform/integrations/dialogflow` -- No Fern page above similarity threshold
- `/platform/integrations/dialogflow/dialogflow-agents` -- No Fern page above similarity threshold
- `/platform/integrations/dialogflow/dialogflow-using-nodejs-to-get-caller-id-send-sms` -- No Fern page above similarity threshold
- `/platform/integrations/freeswitch` -- No Fern page above similarity threshold
- `/platform/integrations/freeswitch/choosing-a-freeswitch-repository` -- No Fern page above similarity threshold
- `/platform/integrations/freeswitch/freeswitch-crash-getting-a-backtrace-from-a-core-dump` -- No Fern page above similarity threshold
- `/platform/integrations/freeswitch/freeswitch-memory-address-and-memory-pool-sanitizer` -- No Fern page above similarity threshold
- `/platform/integrations/messaging-services` -- No Fern page above similarity threshold
- `/platform/integrations/messaging-services/textable` -- No Fern page above similarity threshold
- `/platform/integrations/messaging-services/textit` -- No Fern page above similarity threshold
- `/platform/integrations/pbx-systems` -- No Fern page above similarity threshold
- `/platform/integrations/serverless-functions` -- No Fern page above similarity threshold
- `/platform/integrations/serverless-functions/google-cloud-functions` -- No Fern page above similarity threshold
- `/platform/integrations/serverless-functions/microsoft-azure-functions` -- No Fern page above similarity threshold
- `/platform/integrations/softphones` -- No Fern page above similarity threshold
- `/platform/integrations/softphones/connect-signalwire-with-3cx` -- No Fern page above similarity threshold
- `/platform/integrations/softphones/connect-signalwire-with-linphone` -- No Fern page above similarity threshold
- `/platform/integrations/softphones/microsip-softphone` -- No Fern page above similarity threshold
- `/platform/integrations/softphones/set-up-bria-softphone-with-signalwire` -- No Fern page above similarity threshold
- `/platform/integrations/softphones/set-up-zoiper-softphone-with-signalwire` -- No Fern page above similarity threshold
- `/platform/integrations/workflow-tools` -- No Fern page above similarity threshold
- `/platform/integrations/workflow-tools/how-to-integrate-signalwire-into-integromat` -- No Fern page above similarity threshold
- `/platform/integrations/workflow-tools/zapier` -- No Fern page above similarity threshold
- `/platform/integrations/workflow-tools/zapier/creating-a-zapier-zap` -- No Fern page above similarity threshold
- `/platform/integrations/workflow-tools/zapier/how-to-use-zapier-webhooks` -- No Fern page above similarity threshold
- `/platform/phone-numbers` -- No Fern page above similarity threshold
- `/platform/phone-numbers/getting-started` -- No Fern page above similarity threshold
- `/platform/phone-numbers/getting-started/buying-a-phone-number` -- No Fern page above similarity threshold
- `/platform/phone-numbers/guides` -- No Fern page above similarity threshold
- `/platform/phone-numbers/guides/caller-id` -- No Fern page above similarity threshold
- `/platform/phone-numbers/guides/number-groups` -- No Fern page above similarity threshold
- `/platform/phone-numbers/guides/porting-out-of-signalwire` -- No Fern page above similarity threshold
- `/platform/phone-numbers/guides/releasing-dids` -- No Fern page above similarity threshold
- `/platform/phone-numbers/guides/transferring-dids` -- No Fern page above similarity threshold
- `/rest/compatibility-api/overview/error-codes` -- No Fern page above similarity threshold
- `/rest/compatibility-api/overview/paging` -- No Fern page above similarity threshold
- `/rest/overview/authorization` -- No Fern page above similarity threshold
- `/rest/overview/base-url` -- No Fern page above similarity threshold
- `/rest/overview/data-formats` -- No Fern page above similarity threshold
- `/rest/signalwire-rest/guides/campaign-registry/assign-numbers-to-a-campaign-in-bulk` -- No Fern page above similarity threshold
- `/rest/signalwire-rest/guides/campaign-registry/delete-all-number-assignments` -- No Fern page above similarity threshold
- `/rest/signalwire-rest/guides/campaign-registry/delete-all-number-assignments-from-multiple-campaigns` -- No Fern page above similarity threshold
- `/rest/signalwire-rest/guides/campaign-registry/list-all-campaign-number-assignments-to-csv` -- No Fern page above similarity threshold
- `/rest/signalwire-rest/guides/campaign-registry/list-phone-numbers-assigned-to-a-specific-campaign` -- No Fern page above similarity threshold
- `/rest/signalwire-rest/guides/campaign-registry/release-campaign-numbers-from-csv` -- No Fern page above similarity threshold
- `/rest/signalwire-rest/guides/datasphere/curl-usage` -- No Fern page above similarity threshold
- `/rest/signalwire-rest/guides/datasphere/pdf-ingestion-best-practices` -- No Fern page above similarity threshold
- `/rest/signalwire-rest/overview/error-codes` -- No Fern page above similarity threshold
- `/rest/signalwire-rest/overview/paging` -- No Fern page above similarity threshold
- `/rest/signalwire-rest/overview/permissions` -- No Fern page above similarity threshold
- `/sdks/browser-sdk/chat/client` -- No Fern page above similarity threshold
- `/sdks/browser-sdk/guides/video` -- No Fern page above similarity threshold
- `/sdks/browser-sdk/guides/video/highlighting-whos-speaking` -- No Fern page above similarity threshold
- `/sdks/browser-sdk/guides/video/sharing-your-screen` -- No Fern page above similarity threshold
- `/sdks/browser-sdk/guides/video/video-overlays` -- No Fern page above similarity threshold
- `/sdks/browser-sdk/video/room-session` -- No Fern page above similarity threshold
- `/sdks/browser-sdk/webrtc` -- No Fern page above similarity threshold
- `/sdks/realtime-sdk/chat/client` -- No Fern page above similarity threshold
- `/sdks/realtime-sdk/guides/messaging` -- No Fern page above similarity threshold
- `/sdks/realtime-sdk/guides/messaging/forwarding-texts-to-email` -- No Fern page above similarity threshold
- `/sdks/realtime-sdk/guides/messaging/send-sms-from-the-browser` -- No Fern page above similarity threshold
- `/sdks/realtime-sdk/guides/voice` -- No Fern page above similarity threshold
- `/sdks/realtime-sdk/guides/voice/setting-up-voicemail` -- No Fern page above similarity threshold
- `/sdks/realtime-sdk/guides/voice/stop-robocalls` -- No Fern page above similarity threshold
- `/sdks/realtime-sdk/guides/voice/weather-phone` -- No Fern page above similarity threshold
- `/sdks/realtime-sdk/technical-reference` -- No Fern page above similarity threshold
- `/sdks/realtime-sdk/v2` -- No Fern page above similarity threshold
- `/sdks/realtime-sdk/v2/guides/voice/stop-robocalls` -- No Fern page above similarity threshold
- `/sdks/realtime-sdk/v3` -- No Fern page above similarity threshold
- `/sdks/realtime-sdk/v3/chat/client` -- No Fern page above similarity threshold
- `/sdks/realtime-sdk/v3/guides/messaging` -- No Fern page above similarity threshold
- `/sdks/realtime-sdk/v3/guides/messaging/forwarding-texts-to-email` -- No Fern page above similarity threshold
- `/sdks/realtime-sdk/v3/guides/messaging/send-sms-from-the-browser` -- No Fern page above similarity threshold
- `/sdks/realtime-sdk/v3/guides/voice/setting-up-voicemail` -- No Fern page above similarity threshold
- `/sdks/realtime-sdk/v3/guides/voice/weather-phone` -- No Fern page above similarity threshold
- `/sdks/realtime-sdk/v3/messaging/client` -- No Fern page above similarity threshold
- `/sdks/realtime-sdk/v3/technical-reference` -- No Fern page above similarity threshold
- `/sdks/realtime-sdk/v3/video/client` -- No Fern page above similarity threshold
- `/sdks/realtime-sdk/v3/video/room-session` -- No Fern page above similarity threshold
- `/sdks/realtime-sdk/v3/voice/call` -- No Fern page above similarity threshold
- `/sdks/realtime-sdk/video/roomsession` -- No Fern page above similarity threshold
- `/sdks/realtime-sdk/voice/call` -- No Fern page above similarity threshold
- `/sdks/realtime-sdk/voice/client` -- No Fern page above similarity threshold
- `/sms/carrier-fees` -- No Fern page above similarity threshold
- `/swml/guides` -- No Fern page above similarity threshold
- `/swml/guides/ai` -- No Fern page above similarity threshold
- `/swml/guides/ai/holiday-special-santa-ai` -- No Fern page above similarity threshold
- `/swml/guides/ai/swaig/functions` -- No Fern page above similarity threshold
- `/swml/guides/ai/voicemail-bot-example` -- No Fern page above similarity threshold
- `/swml/guides/methods` -- No Fern page above similarity threshold
- `/swml/methods/ai/hints` -- No Fern page above similarity threshold
- `/swml/methods/ai/languages/params` -- No Fern page above similarity threshold
- `/swml/methods/ai/params/conscience` -- No Fern page above similarity threshold
- `/swml/methods/ai/prompt/contexts/steps` -- No Fern page above similarity threshold
- `/swml/methods/ai/pronounce` -- No Fern page above similarity threshold
- `/swml/methods/ai/swaig/defaults` -- No Fern page above similarity threshold
- `/swml/methods/ai/swaig/functions/fillers` -- No Fern page above similarity threshold
- `/swml/methods/connect/headers` -- No Fern page above similarity threshold
- `/swml/methods/pay/parameters` -- No Fern page above similarity threshold
- `/swml/methods/pay/prompts` -- No Fern page above similarity threshold
- `/swml/methods/pay/prompts/actions` -- No Fern page above similarity threshold
- `/video/conference` -- No Fern page above similarity threshold
- `/video/conference/technical-reference` -- No Fern page above similarity threshold
- `/video/getting-started` -- No Fern page above similarity threshold
- `/video/getting-started/extending-rooms-with-custom-code` -- No Fern page above similarity threshold
- `/video/getting-started/managing-rooms-with-apis` -- No Fern page above similarity threshold
- `/video/getting-started/video-first-steps` -- No Fern page above similarity threshold
- `/video/guides` -- No Fern page above similarity threshold
- `/video/guides/layout-positions` -- No Fern page above similarity threshold
- `/video/guides/layouts` -- No Fern page above similarity threshold
- `/video/guides/setting-the-layout-of-your-signalwire-video-calls` -- No Fern page above similarity threshold
- `/voice/getting-started/sip/sip-gateways` -- No Fern page above similarity threshold
- `/voice/sip/get-started` -- No Fern page above similarity threshold

## Auto-generated API reference (401 pages)

These `/rest/` URLs were generated by the Docusaurus OpenAPI plugin, not from MDX source files. They are handled by Fern's API reference generation and do not need MDX redirects.

- `/rest`
- `/rest/compatibility-api`
- `/rest/compatibility-api/endpoints`
- `/rest/compatibility-api/endpoints/accounts`
- `/rest/compatibility-api/endpoints/applications`
- `/rest/compatibility-api/endpoints/available-phone-numbers`
- `/rest/compatibility-api/endpoints/c-xml-bins`
- `/rest/compatibility-api/endpoints/calls`
- `/rest/compatibility-api/endpoints/conference-participants`
- `/rest/compatibility-api/endpoints/conference-streams`
- `/rest/compatibility-api/endpoints/conferences`
- `/rest/compatibility-api/endpoints/create-a-call`
- `/rest/compatibility-api/endpoints/create-application`
- `/rest/compatibility-api/endpoints/create-conference-stream`
- `/rest/compatibility-api/endpoints/create-cxml-application`
- `/rest/compatibility-api/endpoints/create-imported-phone-number`
- `/rest/compatibility-api/endpoints/create-incoming-phone-number`
- `/rest/compatibility-api/endpoints/create-message`
- `/rest/compatibility-api/endpoints/create-queue`
- `/rest/compatibility-api/endpoints/create-recording`
- ... and 381 more

## Known deleted (98 pages)

These sections were not migrated to Fern.

- `/compatibility-api/guides`
- `/compatibility-api/guides/general`
- `/compatibility-api/guides/general/calltext-by-proxy`
- `/compatibility-api/guides/general/creating-and-using-cxml-scripts`
- `/compatibility-api/guides/general/phone-numbers`
- `/compatibility-api/guides/general/phone-numbers/how-to-purchase-numbers-in-bulk`
- `/compatibility-api/guides/general/phone-numbers/how-to-update-webhooks-in-bulk`
- `/compatibility-api/guides/general/phone-numbers/list-numbers-to-csv`
- `/compatibility-api/guides/general/phone-numbers/release-numbers`
- `/compatibility-api/guides/general/phone-numbers/release-project-numbers-based-off-csv`
- `/compatibility-api/guides/general/phone-numbers/remove-all-landlines-from-your-recipient-list`
- `/compatibility-api/guides/general/utilizing-mustache-templates`
- `/compatibility-api/guides/messaging`
- `/compatibility-api/guides/messaging/general`
- `/compatibility-api/guides/messaging/general/handling-incoming-messages-from-code`
- `/compatibility-api/guides/messaging/general/how-to-list-messages-filtered-by-multiple-from-numbers`
- `/compatibility-api/guides/messaging/general/how-to-list-messages-with-a-specific-error-code-to-csv`
- `/compatibility-api/guides/messaging/general/how-to-pull-undelivered-messages`
- `/compatibility-api/guides/messaging/general/how-to-redact-messages-for-hippa-compliancy`
- `/compatibility-api/guides/messaging/general/how-to-send-sms-from-google-sheets`
- ... and 78 more

## No source file found (36 pages)

- `/call-flow-builder/send-sms` -- No source file found in main/call-flow-builder docs dir
- `/platform/integrations/pbx-systems/set-up-chan-sip-freepbx-with-signalwire` -- No source file found in main docs dir
- `/swml/guides/ai/background-audio` -- No source file found in main/swml docs dir
- `/swml/methods/ai/params/hold-music` -- No source file found in main/swml docs dir
- `/swml/methods/ai/params/interrupt-prompt` -- No source file found in main/swml docs dir
- `/swml/methods/ai/post-prompt` -- No source file found in main/swml docs dir
- `/swml/methods/ai/post-prompt-url` -- No source file found in main/swml docs dir
- `/swml/methods/ai/swaig/defaults/web-hook-url` -- No source file found in main/swml docs dir
- `/swml/methods/ai/swaig/functions/data-map/expressions` -- No source file found in main/swml docs dir
- `/swml/methods/ai/swaig/functions/data-map/output` -- No source file found in main/swml docs dir
- `/swml/methods/ai/swaig/functions/data-map/webhooks` -- No source file found in main/swml docs dir
- `/swml/methods/ai/swaig/functions/data-map/webhooks/foreach` -- No source file found in main/swml docs dir
- `/swml/methods/ai/swaig/functions/web-hook-url` -- No source file found in main/swml docs dir
- `/swml/methods/ai/swaig/internal-fillers` -- No source file found in main/swml docs dir
- `/swml/methods/ai/swaig/native-functions` -- No source file found in main/swml docs dir
- `/swml/methods/amazon-bedrock/post-prompt` -- No source file found in main/swml docs dir
- `/swml/methods/amazon-bedrock/post-prompt-url` -- No source file found in main/swml docs dir
- `/swml/methods/amazon-bedrock/prompt/pom` -- No source file found in main/swml docs dir
- `/swml/methods/amazon-bedrock/swaig/defaults` -- No source file found in main/swml docs dir
- `/swml/methods/amazon-bedrock/swaig/defaults/web-hook-url` -- No source file found in main/swml docs dir
- `/swml/methods/amazon-bedrock/swaig/functions/data-map/expressions` -- No source file found in main/swml docs dir
- `/swml/methods/amazon-bedrock/swaig/functions/data-map/output` -- No source file found in main/swml docs dir
- `/swml/methods/amazon-bedrock/swaig/functions/data-map/webhooks` -- No source file found in main/swml docs dir
- `/swml/methods/amazon-bedrock/swaig/functions/data-map/webhooks/foreach` -- No source file found in main/swml docs dir
- `/swml/methods/amazon-bedrock/swaig/functions/web-hook-url` -- No source file found in main/swml docs dir
- `/swml/methods/amazon-bedrock/swaig/native-functions` -- No source file found in main/swml docs dir
- `/swml/methods/live-transcribe/action` -- No source file found in main/swml docs dir
- `/swml/methods/live-transcribe/action/start` -- No source file found in main/swml docs dir
- `/swml/methods/live-transcribe/action/stop` -- No source file found in main/swml docs dir
- `/swml/methods/live-transcribe/action/summarize` -- No source file found in main/swml docs dir
- ... and 6 more

## Output files

- `C:\Users\devon\projects\signalwire-fern-config\scripts\slug-reconciliation\reports\slug-matches.csv` -- full results (998 rows)

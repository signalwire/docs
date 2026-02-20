# Unmatched Page Matching Report

## Summary

| Category | Count | Description |
|----------|-------|-------------|
| **slug_changed** | 196 | Page exists in Fern under a different slug |
| already_mapped | 0 | Source file maps to a known slug via different URL |
| uncertain | 42 | Possible match, needs manual review |
| likely_deleted | 82 | No similar page found in Fern |
| autogen | 401 | OpenAPI-generated endpoint (no MDX source) |
| known_deleted | 98 | Section known to be not migrated |
| no_source | 0 | No Docusaurus source file found |
| **Total** | **819** | |

## Slug changed

Pages that exist in Fern but with a different URL.

| Old URL | Fern file | Current slug | New slug | Confidence |
|---------|-----------|--------------|----------|------------|
| `/call-flow-builder/version` | `call-flow-builder/pages/core/version.mdx` | `` | `/guides/version` | 0.984 |
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
| `/compatibility-api/cxml/fax/reject` | `compatibility-api/pages/cxml/fax/reject.mdx` | `cxml/fax/reject` | `/reference/cxml/fax/reject` | 0.904 |
| `/compatibility-api/cxml/messaging/redirect` | `compatibility-api/pages/cxml/messaging/redirect.mdx` | `cxml/messaging/redirect` | `/reference/cxml/messaging/redirect` | 0.858 |
| `/compatibility-api/cxml/voice/connect` | `compatibility-api/pages/cxml/voice/connect.mdx` | `cxml/voice/connect` | `/reference/cxml/voice/connect` | 0.878 |
| `/compatibility-api/cxml/voice/denoise` | `compatibility-api/pages/cxml/voice/denoise.mdx` | `cxml/voice/denoise` | `/reference/cxml/voice/denoise` | 0.987 |
| `/compatibility-api/cxml/voice/gather` | `compatibility-api/pages/cxml/voice/gather.mdx` | `cxml/voice/gather` | `/reference/cxml/voice/gather` | 0.740 |
| `/compatibility-api/cxml/voice/hangup` | `compatibility-api/pages/cxml/voice/hangup.mdx` | `cxml/voice/hangup` | `/reference/cxml/voice/hangup` | 0.953 |
| `/compatibility-api/cxml/voice/leave` | `compatibility-api/pages/cxml/voice/leave.mdx` | `cxml/voice/leave` | `/reference/cxml/voice/leave` | 0.957 |
| `/compatibility-api/cxml/voice/pause` | `compatibility-api/pages/cxml/voice/pause.mdx` | `cxml/voice/pause` | `/reference/cxml/voice/pause` | 0.906 |
| `/compatibility-api/cxml/voice/pay/parameter` | `compatibility-api/pages/cxml/voice/pay/parameter.mdx` | `cxml/voice/pay/parameter` | `/reference/cxml/voice/pay/parameter` | 0.986 |
| `/compatibility-api/cxml/voice/pay/prompt` | `compatibility-api/pages/cxml/voice/pay/prompt.mdx` | `cxml/voice/pay/prompt` | `/reference/cxml/voice/pay/prompt` | 0.776 |
| `/compatibility-api/cxml/voice/play` | `compatibility-api/pages/cxml/voice/play.mdx` | `cxml/voice/play` | `/reference/cxml/voice/play` | 0.804 |
| `/compatibility-api/cxml/voice/queue-noun` | `compatibility-api/pages/cxml/voice/queue-noun.mdx` | `cxml/voice/queue` | `/reference/cxml/voice/queue` | 0.770 |
| `/compatibility-api/cxml/voice/redirect` | `compatibility-api/pages/cxml/voice/redirect.mdx` | `cxml/voice/redirect` | `/reference/cxml/voice/redirect` | 0.913 |
| `/compatibility-api/cxml/voice/refer` | `compatibility-api/pages/cxml/voice/refer.mdx` | `cxml/voice/refer` | `/reference/cxml/voice/refer` | 0.745 |
| `/compatibility-api/cxml/voice/reject` | `compatibility-api/pages/cxml/voice/reject.mdx` | `cxml/voice/reject` | `/reference/cxml/voice/reject` | 0.829 |
| `/compatibility-api/cxml/voice/room-noun` | `compatibility-api/pages/cxml/voice/room-noun.mdx` | `cxml/voice/room` | `/reference/cxml/voice/room` | 0.886 |
| `/compatibility-api/cxml/voice/say` | `compatibility-api/pages/cxml/voice/say.mdx` | `cxml/voice/say` | `/reference/cxml/voice/say` | 0.729 |
| `/compatibility-api/cxml/voice/stream` | `compatibility-api/pages/cxml/voice/stream.mdx` | `cxml/voice/stream` | `/reference/cxml/voice/stream` | 0.859 |
| `/compatibility-api/cxml/voice/verto-noun` | `compatibility-api/pages/cxml/voice/verto-noun.mdx` | `cxml/voice/verto` | `/reference/cxml/voice/verto` | 0.992 |
| `/compatibility-api/cxml/voice/virtualagent-noun` | `compatibility-api/pages/cxml/voice/virtualagent-noun.mdx` | `cxml/voice/virtualagent` | `/reference/cxml/voice/virtualagent` | 0.802 |
| `/compatibility-api/sdks` | `compatibility-api\pages\sdks\core\overview.mdx` | `sdks` | -- | 1.000 |
| `/messaging/getting-started/receiving-your-first-sms` | `compatibility-api/pages/cxml/guides/receiving-your-first-sms.mdx` | `/cxml/guides/receiving-your-first-sms` | `/guides/receiving-your-first-sms` | 0.914 |
| `/messaging/getting-started/sending-your-first-sms` | `compatibility-api/pages/cxml/guides/sending-your-first-sms.mdx` | `/cxml/guides/sending-your-first-sms` | `/guides/sending-your-first-sms` | 0.966 |
| `/sdks/browser-sdk/chat` | `browser-sdk/pages/latest/reference/chat/index.mdx` | `` | `/reference/chat` | 0.951 |
| `/sdks/browser-sdk/chat/member` | `browser-sdk/pages/latest/reference/chat/chat-chatmember.mdx` | `` | `/reference/chat/chat-chatmember` | 0.900 |
| `/sdks/browser-sdk/chat/message` | `browser-sdk/pages/latest/reference/chat/chat-chatmessage.mdx` | `` | `/reference/chat/chat-chatmessage` | 0.845 |
| `/sdks/browser-sdk/guides/video/sharing-your-screen` | `browser-sdk/pages/latest/guides/video/sharing-your-screen-with-the-signalwire-video-sdk/index.mdx` | `` | `/guides/sharing-your-screen-with-the-signalwire-video-sdk` | 0.775 |
| `/sdks/browser-sdk/guides/video/switch-webcam-or-microphone` | `browser-sdk/pages/latest/guides/video/switch-webcam-or-microphone-with-signalwire-video-api.mdx` | `` | `/guides/switch-webcam-or-microphone-with-signalwire-video-api` | 0.900 |
| `/sdks/browser-sdk/pubsub` | `browser-sdk/pages/latest/reference/pubsub/index.mdx` | `` | `/reference/pubsub` | 0.962 |
| `/sdks/browser-sdk/signalwire-client` | `browser-sdk/pages/latest/reference/signalwire-client/index.mdx` | `` | `/reference/signalwire-client` | 0.951 |
| `/sdks/browser-sdk/signalwire-client/client` | `browser-sdk/pages/latest/reference/signalwire-client/client/index.mdx` | `` | `/reference/signalwire-client/client` | 0.987 |
| `/sdks/browser-sdk/signalwire-client/client/address` | `browser-sdk/pages/latest/reference/signalwire-client/client/address.mdx` | `` | `/reference/signalwire-client/client/address` | 1.000 |
| `/sdks/browser-sdk/signalwire-client/client/chat` | `browser-sdk/pages/latest/reference/signalwire-client/client/chat.mdx` | `` | `/reference/signalwire-client/client/chat` | 0.999 |
| `/sdks/browser-sdk/signalwire-client/client/conversation` | `browser-sdk/pages/latest/reference/signalwire-client/client/conversation.mdx` | `` | `/reference/signalwire-client/client/conversation` | 1.000 |
| `/sdks/browser-sdk/signalwire-client/notifications` | `browser-sdk/pages/latest/reference/signalwire-client/notifications.mdx` | `` | `/reference/signalwire-client/notifications` | 1.000 |
| `/sdks/browser-sdk/signalwire-client/utils` | `browser-sdk/pages/latest/reference/signalwire-client/utils.mdx` | `` | `/reference/signalwire-client/utils` | 0.996 |
| `/sdks/browser-sdk/technical-reference` | `browser-sdk/pages/latest/reference/index.mdx` | `` | `/reference` | 0.729 |
| `/sdks/browser-sdk/v2/call` | `browser-sdk/pages/v2/reference/call/index.mdx` | `` | `/reference/call` | 1.000 |
| `/sdks/browser-sdk/v2/client` | `browser-sdk/pages/v2/reference/relay-client.mdx` | `` | `/reference/relay-client` | 0.900 |
| `/sdks/browser-sdk/v2/guides/v2-vs-v3` | `browser-sdk/pages/v2/reference/v2-vs-v3.mdx` | `` | `/reference/v2-vs-v3` | 0.999 |
| `/sdks/browser-sdk/v2/notification` | `browser-sdk/pages/v2/reference/notification/index.mdx` | `` | `/reference/notification` | 1.000 |
| `/sdks/browser-sdk/webrtc` | `browser-sdk/pages/latest/reference/webrtc/index.mdx` | `` | `/reference/webrtc` | 0.891 |
| `/sdks/realtime-sdk/chat` | `realtime-sdk/pages/latest/tech-ref/chat/index.mdx` | `reference/chat` | `/reference/chat` | 0.805 |
| `/sdks/realtime-sdk/chat/chat-member` | `realtime-sdk/pages/latest/tech-ref/chat/chat-chatmember.mdx` | `reference/chat/chatmember` | `/reference/chat/chatmember` | 0.937 |
| `/sdks/realtime-sdk/chat/chat-message` | `realtime-sdk/pages/latest/tech-ref/chat/chat-chatmessage.mdx` | `reference/chat/chatmessage` | `/reference/chat/chatmessage` | 0.925 |
| `/sdks/realtime-sdk/chat/client` | `realtime-sdk/pages/latest/tech-ref/chat/chat-client.mdx` | `reference/chat/client` | `/reference/chat-client [COLLISION]` | 0.788 |
| `/sdks/realtime-sdk/guides/messaging/forwarding-texts-to-email` | `realtime-sdk/pages/latest/guides/messaging/forwarding-texts-to-email-nodejs.mdx` | `guides/messaging/forwarding-texts-to-email-nodejs` | `/guides/forwarding-texts-to-email-nodejs` | 0.881 |
| `/sdks/realtime-sdk/guides/messaging/send-sms-from-the-browser` | `realtime-sdk/pages/latest/guides/messaging/send-sms-from-the-browser-using-node-js.mdx` | `guides/messaging/send-sms-from-the-browser-using-node-js` | `/guides/send-sms-from-the-browser-using-node-js` | 0.887 |
| `/sdks/realtime-sdk/guides/voice/stop-robocalls` | `realtime-sdk/pages/latest/guides/voice/stop-robocalls-with-signalwires-communication-api.mdx` | `guides/voice/stop-robocalls-with-signalwires-communication-api` | `/guides/stop-robocalls-with-signalwires-communication-api` | 0.896 |
| `/sdks/realtime-sdk/guides/voice/weather-phone` | `realtime-sdk/pages/latest/guides/voice/weather-phone-with-signalwire-realtime-api.mdx` | `guides/voice/weather-phone-with-signalwire-realtime-api` | `/guides/weather-phone-with-signalwire-realtime-api` | 0.898 |
| `/sdks/realtime-sdk/messaging` | `realtime-sdk/pages/latest/tech-ref/messaging/index.mdx` | `reference/messaging` | `/reference/messaging` | 0.792 |
| `/sdks/realtime-sdk/messaging/client` | `realtime-sdk/pages/latest/tech-ref/messaging/messaging-client.mdx` | `reference/messaging/client` | `/reference/messaging-client [COLLISION]` | 0.856 |
| `/sdks/realtime-sdk/messaging/message-contract` | `realtime-sdk/pages/latest/tech-ref/messaging/messaging-messagecontract.mdx` | `reference/messaging/messagecontract` | `/reference/messaging/messagecontract` | 0.908 |
| `/sdks/realtime-sdk/messaging/messaging-sendresult` | `realtime-sdk/pages/latest/tech-ref/messaging/messaging-messagingsendresult.mdx` | `reference/messaging/messagingsendresult` | `/reference/messaging/messagingsendresult` | 0.901 |
| `/sdks/realtime-sdk/pubsub` | `realtime-sdk/pages/latest/tech-ref/pubsub/index.mdx` | `reference/pubsub` | `/reference/pubsub` | 0.786 |
| `/sdks/realtime-sdk/pubsub/client` | `realtime-sdk/pages/latest/tech-ref/pubsub/pubsub-client.mdx` | `reference/pubsub/client` | `/reference/pubsub-client [COLLISION]` | 0.790 |
| `/sdks/realtime-sdk/pubsub/pubsubmessage` | `realtime-sdk/pages/latest/tech-ref/pubsub/pubsub-pubsubmessage.mdx` | `reference/pubsub/pubsubmessage` | `/reference/pubsub/pubsubmessage` | 0.828 |
| `/sdks/realtime-sdk/task` | `realtime-sdk/pages/latest/tech-ref/task/index.mdx` | `reference/task` | `/reference/task` | 0.862 |
| `/sdks/realtime-sdk/task/client` | `realtime-sdk/pages/latest/tech-ref/task/task-client.mdx` | `reference/task/client` | `/reference/task-client [COLLISION]` | 0.768 |
| `/sdks/realtime-sdk/v2/guides/voice/stop-robocalls` | `realtime-sdk/pages/v2/guides/voice/stop-robocalls-with-signalwires-communication-api.mdx` | `guides/stop-robocalls` | `/guides/stop-robocalls` | 0.897 |
| `/sdks/realtime-sdk/v3/chat` | `realtime-sdk/pages/v3/tech-ref/chat/index.mdx` | `reference/chat` | `/reference/chat` | 0.732 |
| `/sdks/realtime-sdk/v3/chat/client` | `realtime-sdk/pages/v3/tech-ref/chat/chat-client.mdx` | `reference/chat/client` | `/reference/chat-client [COLLISION]` | 0.840 |
| `/sdks/realtime-sdk/v3/chat/member` | `realtime-sdk/pages/v3/tech-ref/chat/chat-chatmember.mdx` | `reference/chat/chatmember` | `/reference/chat/chatmember` | 0.900 |
| `/sdks/realtime-sdk/v3/chat/message` | `realtime-sdk/pages/v3/tech-ref/chat/chat-chatmessage.mdx` | `reference/chat/chatmessage` | `/reference/chat/chatmessage` | 0.900 |
| `/sdks/realtime-sdk/v3/guides/messaging/forwarding-texts-to-email` | `realtime-sdk/pages/v3/guides/messaging/forwarding-texts-to-email-nodejs.mdx` | `guides/messaging/forwarding-texts-to-email-nodejs` | `/guides/forwarding-texts-to-email-nodejs` | 0.842 |
| `/sdks/realtime-sdk/v3/guides/messaging/send-sms-from-the-browser` | `realtime-sdk/pages/v3/guides/messaging/send-sms-from-the-browser-using-node-js.mdx` | `guides/messaging/send-sms-from-the-browser-using-node-js` | `/guides/send-sms-from-the-browser-using-node-js` | 0.871 |
| `/sdks/realtime-sdk/v3/guides/voice/weather-phone` | `realtime-sdk/pages/v3/guides/voice/weather-phone-with-signalwire-realtime-api.mdx` | `guides/voice/weather-phone-with-signalwire-realtime-api` | `/guides/weather-phone-with-signalwire-realtime-api` | 0.884 |
| `/sdks/realtime-sdk/v3/messaging` | `realtime-sdk/pages/v3/tech-ref/messaging/index.mdx` | `reference/messaging` | `/reference/messaging` | 0.795 |
| `/sdks/realtime-sdk/v3/messaging/client` | `realtime-sdk/pages/v3/tech-ref/messaging/messaging-client.mdx` | `reference/messaging/client` | `/reference/messaging-client [COLLISION]` | 0.822 |
| `/sdks/realtime-sdk/v3/messaging/message-contract` | `realtime-sdk/pages/v3/tech-ref/messaging/messaging-messagecontract.mdx` | `reference/messaging/messagecontract` | `/reference/messaging/messagecontract` | 0.946 |
| `/sdks/realtime-sdk/v3/messaging/messaging-sendresult` | `realtime-sdk/pages/v3/tech-ref/messaging/messaging-messagingsendresult.mdx` | `reference/messaging/messagingsendresult` | `/reference/messaging/messagingsendresult` | 0.963 |
| `/sdks/realtime-sdk/v3/pubsub` | `realtime-sdk/pages/v3/tech-ref/pubsub/index.mdx` | `reference/pubsub` | `/reference/pubsub` | 0.781 |
| `/sdks/realtime-sdk/v3/pubsub/client` | `realtime-sdk/pages/v3/tech-ref/pubsub/pubsub-client.mdx` | `reference/pubsub/client` | `/reference/pubsub-client [COLLISION]` | 0.811 |
| `/sdks/realtime-sdk/v3/realtime-client` | `realtime-sdk/pages/v3/tech-ref/realtime-client/index.mdx` | `reference/realtime-client` | `/reference/realtime-client` | 0.792 |
| `/sdks/realtime-sdk/v3/task` | `realtime-sdk/pages/v3/tech-ref/task/index.mdx` | `reference/task` | `/reference/task` | 0.940 |
| `/sdks/realtime-sdk/v3/task/client` | `realtime-sdk/pages/v3/tech-ref/task/task-client.mdx` | `reference/task/client` | `/reference/task-client [COLLISION]` | 0.789 |
| `/sdks/realtime-sdk/v3/video` | `realtime-sdk/pages/v3/tech-ref/video/index.mdx` | `reference/video` | `/reference/video` | 0.702 |
| `/sdks/realtime-sdk/v3/video/room-session` | `realtime-sdk/pages/v3/tech-ref/video/video-roomsession.mdx` | `reference/video/roomsession` | `/reference/video-roomsession [COLLISION]` | 0.939 |
| `/sdks/realtime-sdk/v3/video/roomsession-fullstate` | `realtime-sdk/pages/v3/tech-ref/video/video-roomsessionfullstate.mdx` | `reference/video/roomsessionfullstate` | `/reference/video/roomsessionfullstate` | 0.932 |
| `/sdks/realtime-sdk/v3/video/roomsession-member` | `realtime-sdk/pages/v3/tech-ref/video/video-roomsessionmember.mdx` | `reference/video/roomsessionmember` | `/reference/video/roomsessionmember` | 0.958 |
| `/sdks/realtime-sdk/v3/video/roomsession-playback` | `realtime-sdk/pages/v3/tech-ref/video/video-roomsessionplayback.mdx` | `reference/video/roomsessionplayback` | `/reference/video/roomsessionplayback` | 0.965 |
| `/sdks/realtime-sdk/v3/video/roomsession-recording` | `realtime-sdk/pages/v3/tech-ref/video/video-roomsessionrecording.mdx` | `reference/video/roomsessionrecording` | `/reference/video/roomsessionrecording` | 0.970 |
| `/sdks/realtime-sdk/v3/video/roomsession-stream` | `realtime-sdk/pages/v3/tech-ref/video/video-roomsessionstream.mdx` | `reference/video/roomsessionstream` | `/reference/video/roomsessionstream` | 0.966 |
| `/sdks/realtime-sdk/v3/voice/call` | `realtime-sdk/pages/v3/tech-ref/voice/voice-call.mdx` | `reference/voice/call` | `/reference/voice-call [COLLISION]` | 0.868 |
| `/sdks/realtime-sdk/v3/voice/call-collect` | `realtime-sdk/pages/v3/tech-ref/voice/callcollect.mdx` | `reference/voice/callcollect` | `/reference/voice/callcollect` | 0.991 |
| `/sdks/realtime-sdk/v3/voice/call-detect` | `realtime-sdk/pages/v3/tech-ref/voice/calldetect.mdx` | `reference/voice/calldetect` | `/reference/voice/calldetect` | 0.981 |
| `/sdks/realtime-sdk/v3/voice/call-playback` | `realtime-sdk/pages/v3/tech-ref/voice/callplayback.mdx` | `reference/voice/callplayback` | `/reference/voice/callplayback` | 0.983 |
| `/sdks/realtime-sdk/v3/voice/call-prompt` | `realtime-sdk/pages/v3/tech-ref/voice/callprompt.mdx` | `reference/voice/callprompt` | `/reference/voice/callprompt` | 0.981 |
| `/sdks/realtime-sdk/v3/voice/call-recording` | `realtime-sdk/pages/v3/tech-ref/voice/callrecording.mdx` | `reference/voice/callrecording` | `/reference/voice/callrecording` | 0.982 |
| `/sdks/realtime-sdk/v3/voice/call-state` | `realtime-sdk/pages/v3/tech-ref/voice/callstate.mdx` | `reference/voice/callstate` | `/reference/voice/callstate` | 0.950 |
| `/sdks/realtime-sdk/v3/voice/call-tap` | `realtime-sdk/pages/v3/tech-ref/voice/calltap.mdx` | `reference/voice/calltap` | `/reference/voice/calltap` | 0.984 |
| `/sdks/realtime-sdk/v3/voice/client` | `realtime-sdk/pages/v3/tech-ref/voice/voice-client.mdx` | `reference/voice/client` | `/reference/voice-client [COLLISION]` | 0.856 |
| `/sdks/realtime-sdk/v3/voice/device-builder` | `realtime-sdk/pages/v3/tech-ref/voice/voice-devicebuilder.mdx` | `reference/voice/devicebuilder` | `/reference/voice/devicebuilder` | 0.948 |
| `/sdks/realtime-sdk/v3/voice/playlist` | `realtime-sdk/pages/v3/tech-ref/voice/voice-playlist.mdx` | `reference/voice/playlist` | `/reference/voice/playlist` | 0.840 |
| `/sdks/realtime-sdk/v3/voice/types` | `realtime-sdk/pages/v3/tech-ref/voice/types.mdx` | `reference/voice/types` | `/reference/voice/types` | 0.981 |
| `/sdks/realtime-sdk/video` | `realtime-sdk/pages/latest/tech-ref/video/index.mdx` | `reference/video` | `/reference/video` | 0.782 |
| `/sdks/realtime-sdk/video/room-session-member` | `realtime-sdk/pages/latest/tech-ref/video/video-roomsessionmember.mdx` | `reference/video/roomsessionmember` | `/reference/video/roomsessionmember` | 0.936 |
| `/sdks/realtime-sdk/video/room-session-playback` | `realtime-sdk/pages/latest/tech-ref/video/video-roomsessionplayback.mdx` | `reference/video/roomsessionplayback` | `/reference/video/roomsessionplayback` | 0.943 |
| `/sdks/realtime-sdk/video/roomsession` | `realtime-sdk/pages/latest/tech-ref/video/video-roomsession.mdx` | `reference/video/roomsession` | `/reference/video-roomsession [COLLISION]` | 0.868 |
| `/sdks/realtime-sdk/video/roomsession-fullstate` | `realtime-sdk/pages/latest/tech-ref/video/video-roomsessionfullstate.mdx` | `reference/video/roomsessionfullstate` | `/reference/video/roomsessionfullstate` | 0.904 |
| `/sdks/realtime-sdk/video/roomsession-recording` | `realtime-sdk/pages/latest/tech-ref/video/video-roomsessionrecording.mdx` | `reference/video/roomsessionrecording` | `/reference/video/roomsessionrecording` | 0.954 |
| `/sdks/realtime-sdk/video/roomsession-stream` | `realtime-sdk/pages/latest/tech-ref/video/video-roomsessionstream.mdx` | `reference/video/roomsessionstream` | `/reference/video/roomsessionstream` | 0.935 |
| `/sdks/realtime-sdk/voice/call` | `realtime-sdk/pages/latest/tech-ref/voice/voice-call.mdx` | `reference/voice/call` | `/reference/voice-call [COLLISION]` | 0.830 |
| `/sdks/realtime-sdk/voice/call-collect` | `realtime-sdk/pages/latest/tech-ref/voice/callcollect.mdx` | `reference/voice/callcollect` | `/reference/voice/callcollect` | 0.955 |
| `/sdks/realtime-sdk/voice/call-detect` | `realtime-sdk/pages/latest/tech-ref/voice/calldetect.mdx` | `reference/voice/calldetect` | `/reference/voice/calldetect` | 0.968 |
| `/sdks/realtime-sdk/voice/call-playback` | `realtime-sdk/pages/latest/tech-ref/voice/callplayback.mdx` | `reference/voice/callplayback` | `/reference/voice/callplayback` | 0.974 |
| `/sdks/realtime-sdk/voice/call-prompt` | `realtime-sdk/pages/latest/tech-ref/voice/callprompt.mdx` | `reference/voice/callprompt` | `/reference/voice/callprompt` | 0.961 |
| `/sdks/realtime-sdk/voice/call-recording` | `realtime-sdk/pages/latest/tech-ref/voice/callrecording.mdx` | `reference/voice/callrecording` | `/reference/voice/callrecording` | 0.976 |
| `/sdks/realtime-sdk/voice/call-state` | `realtime-sdk/pages/latest/tech-ref/voice/callstate.mdx` | `reference/voice/callstate` | `/reference/voice/callstate` | 0.945 |
| `/sdks/realtime-sdk/voice/call-tap` | `realtime-sdk/pages/latest/tech-ref/voice/calltap.mdx` | `reference/voice/calltap` | `/reference/voice/calltap` | 0.974 |
| `/sdks/realtime-sdk/voice/client` | `realtime-sdk/pages/latest/tech-ref/voice/voice-client.mdx` | `reference/voice/client` | `/reference/voice-client [COLLISION]` | 0.798 |
| `/sdks/realtime-sdk/voice/device-builder` | `realtime-sdk/pages/latest/tech-ref/voice/voice-devicebuilder.mdx` | `reference/voice/devicebuilder` | `/reference/voice/devicebuilder` | 0.927 |
| `/sdks/realtime-sdk/voice/playlist` | `realtime-sdk/pages/latest/tech-ref/voice/voice-playlist.mdx` | `reference/voice/playlist` | `/reference/voice/playlist` | 0.790 |
| `/sdks/realtime-sdk/voice/types` | `realtime-sdk/pages/latest/tech-ref/voice/types.mdx` | `reference/voice/types` | `/reference/voice/types` | 0.864 |
| `/voice/getting-started/how-to-gather-keypad-input-from-user` | `compatibility-api/pages/cxml/guides/gathering-user-input.mdx` | `/cxml/guides/gathering-user-input` | `/guides/gathering-user-input` | 0.702 |

## Uncertain matches (manual review needed)

| Old URL | Fern file | Current slug | New slug | Confidence |
|---------|-----------|--------------|----------|------------|
| `/chat/getting-started` | `platform/pages/calling/video/get-started/index.mdx` | `/video/getting-started` | `/video/getting-started` | 0.350 |
| `/chat/guides` | `realtime-sdk/pages/v2/guides/index.mdx` | `guides` | `/guides` | 0.357 |
| `/compatibility-api/client-sdks/api/available-phone-numbers/find-toll-free` | `compatibility-api/pages/sdks/methods/available-phone-numbers/toll-free.mdx` | `sdks/methods/available-phone-numbers/find-toll-free` | `/reference/available-phone-numbers/find-toll-free` | 0.685 |
| `/compatibility-api/client-sdks/api/available-phone-numbers/search-local` | `compatibility-api/pages/sdks/methods/available-phone-numbers/local.mdx` | `sdks/methods/available-phone-numbers/search-local` | `/reference/available-phone-numbers/search-local` | 0.464 |
| `/compatibility-api/client-sdks/methods/fax-media/list-all` | `compatibility-api/pages/sdks/methods/fax-media/list-all-media.mdx` | `sdks/methods/fax-media/list-all` | `/reference/fax-media/list-all` | 0.592 |
| `/compatibility-api/cxml` | `compatibility-api/pages/cxml/core/cxml-spec.mdx` | `cxml` | `/reference/cxml` | 0.458 |
| `/compatibility-api/cxml/fax` | `compatibility-api/pages/cxml/fax/overview.mdx` | `cxml/fax` | `/reference/cxml/fax` | 0.489 |
| `/compatibility-api/cxml/fax/receive` | `compatibility-api/pages/cxml/fax/receive.mdx` | `cxml/fax/receive` | `/reference/cxml/fax/receive` | 0.700 |
| `/compatibility-api/cxml/messaging` | `compatibility-api/pages/cxml/fax/overview.mdx` | `cxml/fax` | `/reference/cxml/fax` | 0.311 |
| `/compatibility-api/cxml/messaging/message` | `compatibility-api/pages/cxml/messaging/message.mdx` | `cxml/messaging/message` | `/reference/cxml/messaging/message` | 0.533 |
| `/compatibility-api/cxml/voice` | `compatibility-api/pages/cxml/voice/overview.mdx` | `cxml/voice` | `/reference/cxml/voice` | 0.427 |
| `/compatibility-api/cxml/voice/conference-noun` | `compatibility-api/pages/cxml/voice/conference-noun.mdx` | `cxml/voice/conference` | `/reference/cxml/voice/conference` | 0.561 |
| `/compatibility-api/cxml/voice/dial` | `compatibility-api/pages/cxml/voice/dial.mdx` | `cxml/voice/dial` | `/reference/cxml/voice/dial` | 0.578 |
| `/compatibility-api/cxml/voice/echo` | `compatibility-api/pages/cxml/voice/echo.mdx` | `cxml/voice/echo` | `/reference/cxml/voice/echo` | 0.656 |
| `/compatibility-api/cxml/voice/enqueue` | `compatibility-api/pages/cxml/voice/enqueue.mdx` | `cxml/voice/enqueue` | `/reference/cxml/voice/enqueue` | 0.477 |
| `/compatibility-api/cxml/voice/number-noun` | `compatibility-api/pages/cxml/voice/number-noun.mdx` | `cxml/voice/number` | `/reference/cxml/voice/number` | 0.559 |
| `/compatibility-api/cxml/voice/pay` | `compatibility-api/pages/cxml/voice/pay/index.mdx` | `cxml/voice/pay` | `/reference/cxml/voice/pay` | 0.694 |
| `/compatibility-api/cxml/voice/record` | `compatibility-api/pages/cxml/voice/record.mdx` | `cxml/voice/record` | `/reference/cxml/voice/record` | 0.625 |
| `/compatibility-api/cxml/voice/sip-noun` | `compatibility-api/pages/cxml/voice/sip-noun.mdx` | `cxml/voice/sip` | `/reference/cxml/voice/sip` | 0.671 |
| `/compatibility-api/cxml/voice/sms` | `compatibility-api/pages/cxml/voice/sms.mdx` | `cxml/voice/sms` | `/reference/cxml/voice/sms` | 0.587 |
| `/fax/get-started` | `platform/pages/calling/video/get-started/index.mdx` | `/video/getting-started` | `/video/getting-started` | 0.381 |
| `/fax/getting-started/first-steps-with-fax` | `platform/pages/calling/fax/overview.mdx` | `/fax` | `/fax` | 0.499 |
| `/fax/getting-started/securing-callback-for-inbound-fax-with-cxml` | `compatibility-api/pages/cxml/guides/securing-callback-for-inbound-fax.mdx` | `/cxml/guides/securing-callback-for-inbound-fax` | `/guides/securing-callback-for-inbound-fax` | 0.367 |
| `/messaging/get-started` | `platform/pages/calling/video/get-started/index.mdx` | `/video/getting-started` | `/video/getting-started` | 0.380 |
| `/platform/phone-numbers/getting-started` | `platform/pages/calling/video/get-started/index.mdx` | `/video/getting-started` | `/video/getting-started` | 0.311 |
| `/sdks/browser-sdk/chat/client` | `browser-sdk/pages/latest/reference/pubsub/pubsub-client.mdx` | `` | `/reference/pubsub/pubsub-client` | 0.332 |
| `/sdks/browser-sdk/chat/member-entity` | `browser-sdk/pages/latest/reference/chat/chatmemberentity.mdx` | `` | `/reference/chat/chatmemberentity` | 0.482 |
| `/sdks/browser-sdk/chat/message-entity` | `browser-sdk/pages/latest/reference/chat/chatmessageentity.mdx` | `` | `/reference/chat/chatmessageentity` | 0.462 |
| `/sdks/browser-sdk/pubsub/client` | `browser-sdk/pages/latest/reference/pubsub/pubsub-client.mdx` | `` | `/reference/pubsub/pubsub-client` | 0.511 |
| `/sdks/browser-sdk/v2/guides` | `browser-sdk/pages/latest/reference/video/RoomSession/methods/destroy.mdx` | `` | `/reference/video/roomsession/methods/destroy` | 0.301 |
| `/sdks/browser-sdk/video` | `browser-sdk/pages/latest/reference/video/index.mdx` | `` | `/reference/video` | 0.516 |
| `/sdks/browser-sdk/video/room-session-stream` | `browser-sdk/pages/latest/reference/video/video-roomsessionstream.mdx` | `` | `/reference/video/video-roomsessionstream` | 0.592 |
| `/sdks/realtime-sdk/realtime-client` | `realtime-sdk/pages/latest/tech-ref/core/realtime-client/index.mdx` | `reference/realtime-client` | `/reference/realtime-client` | 0.411 |
| `/sdks/realtime-sdk/v3/guides/voice` | `realtime-sdk/pages/v3/tech-ref/video/client/methods/once.mdx` | `v3/reference/video/client/methods/once` | `/reference/video/client/methods/once` | 0.301 |
| `/sdks/realtime-sdk/v3/video/client` | `realtime-sdk/pages/v3/tech-ref/task/task-client.mdx` | `reference/task/client` | `/reference/task-client [COLLISION]` | 0.391 |
| `/sdks/realtime-sdk/v3/voice` | `realtime-sdk/pages/v3/tech-ref/voice/index.mdx` | `reference/voice` | `/reference/voice` | 0.679 |
| `/sdks/realtime-sdk/video/client` | `realtime-sdk/pages/latest/tech-ref/video/client/methods/listen.mdx` | `reference/video/client/methods/listen` | `/reference/video/client/methods/listen` | 0.396 |
| `/sdks/realtime-sdk/voice` | `realtime-sdk/pages/latest/tech-ref/voice/index.mdx` | `reference/voice` | `/reference/voice` | 0.562 |
| `/swml/methods/ai/swaig/defaults/web_hook_url` | `swml/pages/reference/methods/ai/ai_swaig/functions/functions.web_hook_url.mdx` | `/swml/methods/ai/swaig/functions/web_hook_url` | `/reference/ai/swaig/functions-web-hook-url` | 0.494 |
| `/swml/methods/amazon_bedrock/swaig/defaults/web_hook_url` | `swml/pages/reference/methods/ai/ai_swaig/functions/functions.web_hook_url.mdx` | `/swml/methods/ai/swaig/functions/web_hook_url` | `/reference/ai/swaig/functions-web-hook-url` | 0.495 |
| `/video/guides` | `realtime-sdk/pages/v2/guides/index.mdx` | `guides` | `/guides` | 0.334 |
| `/voice/guides/general/how-to-set-caller-id-or-cnam` | `platform/pages/platform/basics/general/how-to-set-caller-id-or-cnam.mdx` | `/platform/basics/general/how-to-set-caller-id-or-cnam` | `/basics/how-to-set-caller-id-or-cnam` | 0.437 |

## Likely deleted

Pages with no matching content in Fern.

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
- `/platform/basics/guides/technical-troubleshooting` -- No Fern page above similarity threshold
- `/platform/basics/security-and-compliance` -- No Fern page above similarity threshold
- `/platform/dashboard/reference-app` -- No Fern page above similarity threshold
- `/platform/integrations` -- No Fern page above similarity threshold
- `/platform/integrations/carriers` -- No Fern page above similarity threshold
- `/platform/integrations/crm` -- No Fern page above similarity threshold
- `/platform/integrations/dialogflow` -- No Fern page above similarity threshold
- `/platform/integrations/freeswitch` -- No Fern page above similarity threshold
- `/platform/integrations/messaging-services` -- No Fern page above similarity threshold
- `/platform/integrations/pbx-systems` -- No Fern page above similarity threshold
- `/platform/integrations/serverless-functions` -- No Fern page above similarity threshold
- `/platform/integrations/softphones` -- No Fern page above similarity threshold
- `/platform/integrations/workflow-tools` -- No Fern page above similarity threshold
- `/platform/integrations/workflow-tools/zapier` -- No Fern page above similarity threshold
- `/platform/phone-numbers/guides` -- No Fern page above similarity threshold
- `/rest/compatibility-api/overview/error-codes` -- No Fern page above similarity threshold
- `/rest/compatibility-api/overview/paging` -- No Fern page above similarity threshold
- `/rest/overview/authorization` -- No Fern page above similarity threshold
- `/rest/overview/base-url` -- No Fern page above similarity threshold
- `/rest/overview/data-formats` -- No Fern page above similarity threshold
- `/rest/signalwire-rest/guides` -- No Fern page above similarity threshold
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
- `/sdks/browser-sdk` -- No Fern page above similarity threshold
- `/sdks/browser-sdk/guides/video` -- No Fern page above similarity threshold
- `/sdks/browser-sdk/video/room-session` -- No Fern page above similarity threshold
- `/sdks/realtime-sdk/guides/messaging` -- No Fern page above similarity threshold
- `/sdks/realtime-sdk/guides/voice` -- No Fern page above similarity threshold
- `/sdks/realtime-sdk/technical-reference` -- No Fern page above similarity threshold
- `/sdks/realtime-sdk/v2` -- No Fern page above similarity threshold
- `/sdks/realtime-sdk/v3/guides/messaging` -- No Fern page above similarity threshold
- `/sdks/realtime-sdk/v3/technical-reference` -- No Fern page above similarity threshold
- `/swml/guides` -- No Fern page above similarity threshold
- `/swml/guides/ai` -- No Fern page above similarity threshold
- `/swml/guides/ai/background_audio` -- No Fern page above similarity threshold
- `/swml/guides/ai/holiday_special_santa_ai` -- No Fern page above similarity threshold
- `/swml/guides/ai/swaig/functions` -- No Fern page above similarity threshold
- `/swml/guides/ai/voicemail_bot_example` -- No Fern page above similarity threshold
- `/swml/guides/methods` -- No Fern page above similarity threshold
- `/swml/methods/ai/languages/params` -- No Fern page above similarity threshold
- `/swml/methods/ai/params/conscience` -- No Fern page above similarity threshold
- `/swml/methods/ai/params/hold_music` -- No Fern page above similarity threshold
- `/swml/methods/ai/params/interrupt_prompt` -- No Fern page above similarity threshold

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

## Output files

- `C:\Users\devon\projects\signalwire-fern-config\scripts\slug-reconciliation\reports\slug-matches.csv` -- full results (819 rows)

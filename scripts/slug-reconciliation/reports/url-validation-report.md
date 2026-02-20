# URL Validation Report

Validated `cur_full_url` from `slug-final-report.csv` against the live site.

**Sitemap:** `https://signalwire.docs.buildwithfern.com/sitemap.xml`

## Summary

| Metric | Count |
|--------|-------|
| Sitemap URLs | 1519 |
| Unique `cur_full_url` in report | 884 |
| **In sitemap** | **841** (95.1%) |
| **Accessible (not indexed)** | **43** |
| **Redirected** | **0** |
| **Not found (404)** | **0** |
| **Total verified** | **884** (100.0%) |

## Accessible but not in sitemap

These pages respond with 200 OK but are not in the sitemap XML.
This is expected for section index pages and some navigation-only pages.

### realtime-sdk (35)

| cur_full_url | Category | Page slug | Fern file |
|-------------|----------|-----------|----------|
| `/realtime-sdk/v2/guides` | matched_changed | `/guides` | `realtime-sdk/pages/v2/guides/index.mdx` |
| `/realtime-sdk/v3/guides` | matched_changed | `/guides` | `realtime-sdk/pages/v3/guides/index.mdx` |
| `/realtime-sdk/v3/guides/messaging/first-steps-with-messaging` | matched_changed | `/guides/messaging/first-steps-with-messaging` | `realtime-sdk/pages/v3/guides/messaging/first-steps-with-messaging.mdx` |
| `/realtime-sdk/v3/reference/chat` | slug_changed | `/reference/chat` | `realtime-sdk/pages/v3/tech-ref/chat/index.mdx` |
| `/realtime-sdk/v3/reference/chat/chat-member` | slug_changed | `/reference/chat/chat-member` | `realtime-sdk/pages/v3/tech-ref/chat/chat-chatmember.mdx` |
| `/realtime-sdk/v3/reference/chat/chat-message` | slug_changed | `/reference/chat/chat-message` | `realtime-sdk/pages/v3/tech-ref/chat/chat-chatmessage.mdx` |
| `/realtime-sdk/v3/reference/chat/client` | slug_changed | `/reference/chat/client` | `realtime-sdk/pages/v3/tech-ref/chat/chat-client.mdx` |
| `/realtime-sdk/v3/reference/messaging` | slug_changed | `/reference/messaging` | `realtime-sdk/pages/v3/tech-ref/messaging/index.mdx` |
| `/realtime-sdk/v3/reference/messaging/client` | slug_changed | `/reference/messaging/client` | `realtime-sdk/pages/v3/tech-ref/messaging/messaging-client.mdx` |
| `/realtime-sdk/v3/reference/messaging/message-contract` | slug_changed | `/reference/messaging/message-contract` | `realtime-sdk/pages/v3/tech-ref/messaging/messaging-messagecontract.mdx` |
| `/realtime-sdk/v3/reference/messaging/messaging-send-result` | slug_changed | `/reference/messaging/messaging-send-result` | `realtime-sdk/pages/v3/tech-ref/messaging/messaging-messagingsendresult.mdx` |
| `/realtime-sdk/v3/reference/pubsub` | slug_changed | `/reference/pubsub` | `realtime-sdk/pages/v3/tech-ref/pubsub/index.mdx` |
| `/realtime-sdk/v3/reference/pubsub/client` | slug_changed | `/reference/pubsub/client` | `realtime-sdk/pages/v3/tech-ref/pubsub/pubsub-client.mdx` |
| `/realtime-sdk/v3/reference/pubsub/pubsub-message` | matched_changed | `/reference/pubsub/pubsub-message` | `realtime-sdk/pages/v3/tech-ref/pubsub/pubsub-pubsubmessage.mdx` |
| `/realtime-sdk/v3/reference/task` | slug_changed | `/reference/task` | `realtime-sdk/pages/v3/tech-ref/task/index.mdx` |
| `/realtime-sdk/v3/reference/task/client` | slug_changed | `/reference/task/client` | `realtime-sdk/pages/v3/tech-ref/task/task-client.mdx` |
| `/realtime-sdk/v3/reference/video` | slug_changed | `/reference/video` | `realtime-sdk/pages/v3/tech-ref/video/index.mdx` |
| `/realtime-sdk/v3/reference/video/room-session` | slug_changed | `/reference/video/room-session` | `realtime-sdk/pages/v3/tech-ref/video/video-roomsession.mdx` |
| `/realtime-sdk/v3/reference/video/room-session-full-state` | slug_changed | `/reference/video/room-session-full-state` | `realtime-sdk/pages/v3/tech-ref/video/video-roomsessionfullstate.mdx` |
| `/realtime-sdk/v3/reference/video/room-session-member` | slug_changed | `/reference/video/room-session-member` | `realtime-sdk/pages/v3/tech-ref/video/video-roomsessionmember.mdx` |
| `/realtime-sdk/v3/reference/video/room-session-playback` | slug_changed | `/reference/video/room-session-playback` | `realtime-sdk/pages/v3/tech-ref/video/video-roomsessionplayback.mdx` |
| `/realtime-sdk/v3/reference/video/room-session-recording` | slug_changed | `/reference/video/room-session-recording` | `realtime-sdk/pages/v3/tech-ref/video/video-roomsessionrecording.mdx` |
| `/realtime-sdk/v3/reference/video/room-session-stream` | slug_changed | `/reference/video/room-session-stream` | `realtime-sdk/pages/v3/tech-ref/video/video-roomsessionstream.mdx` |
| `/realtime-sdk/v3/reference/voice` | uncertain | `/reference/voice` | `realtime-sdk/pages/v3/tech-ref/voice/index.mdx` |
| `/realtime-sdk/v3/reference/voice/call` | slug_changed | `/reference/voice/call` | `realtime-sdk/pages/v3/tech-ref/voice/voice-call.mdx` |
| `/realtime-sdk/v3/reference/voice/call-collect` | slug_changed | `/reference/voice/call-collect` | `realtime-sdk/pages/v3/tech-ref/voice/callcollect.mdx` |
| `/realtime-sdk/v3/reference/voice/call-detect` | slug_changed | `/reference/voice/call-detect` | `realtime-sdk/pages/v3/tech-ref/voice/calldetect.mdx` |
| `/realtime-sdk/v3/reference/voice/call-playback` | slug_changed | `/reference/voice/call-playback` | `realtime-sdk/pages/v3/tech-ref/voice/callplayback.mdx` |
| `/realtime-sdk/v3/reference/voice/call-prompt` | slug_changed | `/reference/voice/call-prompt` | `realtime-sdk/pages/v3/tech-ref/voice/callprompt.mdx` |
| `/realtime-sdk/v3/reference/voice/call-recording` | slug_changed | `/reference/voice/call-recording` | `realtime-sdk/pages/v3/tech-ref/voice/callrecording.mdx` |
| `/realtime-sdk/v3/reference/voice/call-state` | slug_changed | `/reference/voice/call-state` | `realtime-sdk/pages/v3/tech-ref/voice/callstate.mdx` |
| `/realtime-sdk/v3/reference/voice/call-tap` | slug_changed | `/reference/voice/call-tap` | `realtime-sdk/pages/v3/tech-ref/voice/calltap.mdx` |
| `/realtime-sdk/v3/reference/voice/client` | slug_changed | `/reference/voice/client` | `realtime-sdk/pages/v3/tech-ref/voice/voice-client.mdx` |
| `/realtime-sdk/v3/reference/voice/playlist` | slug_changed | `/reference/voice/playlist` | `realtime-sdk/pages/v3/tech-ref/voice/voice-playlist.mdx` |
| `/realtime-sdk/v3/reference/voice/types` | slug_changed | `/reference/voice/types` | `realtime-sdk/pages/v3/tech-ref/voice/types.mdx` |

### browser-sdk (8)

| cur_full_url | Category | Page slug | Fern file |
|-------------|----------|-----------|----------|
| `/browser-sdk/reference` | slug_changed | `/reference` | `browser-sdk/pages/latest/reference/index.mdx` |
| `/browser-sdk/reference/chat/chat-member` | slug_changed | `/reference/chat/chat-member` | `browser-sdk/pages/latest/reference/chat/chat-chatmember.mdx` |
| `/browser-sdk/reference/chat/chat-message` | slug_changed | `/reference/chat/chat-message` | `browser-sdk/pages/latest/reference/chat/chat-chatmessage.mdx` |
| `/browser-sdk/reference/pubsub/pubsub-message` | slug_changed | `/reference/pubsub/pubsub-message` | `browser-sdk/pages/latest/reference/pubsub/pubsub-pubsubmessage.mdx` |
| `/browser-sdk/reference/video/room-session-playback` | slug_changed | `/reference/video/room-session-playback` | `browser-sdk/pages/latest/reference/video/video-roomsessionplayback.mdx` |
| `/browser-sdk/reference/video/room-session-recording` | uncertain | `/reference/video/room-session-recording` | `browser-sdk/pages/latest/reference/video/video-roomsessionrecording.mdx` |
| `/browser-sdk/reference/video/room-session-stream` | uncertain | `/reference/video/room-session-stream` | `browser-sdk/pages/latest/reference/video/video-roomsessionstream.mdx` |
| `/browser-sdk/v2` | matched_changed | `/` | `browser-sdk/pages/v2/index.mdx` |

## Verified URLs

884 URLs verified (841 in sitemap + 43 accessible via HTTP).

Sample (first 15):

- `/agents-sdk`
- `/agents-sdk/advanced/call-recording`
- `/agents-sdk/advanced/call-transfer`
- `/agents-sdk/advanced/contexts-workflows`
- `/agents-sdk/advanced/mcp-gateway`
- `/agents-sdk/advanced/multi-agent`
- `/agents-sdk/advanced/search-knowledge`
- `/agents-sdk/advanced/state-management`
- `/agents-sdk/api/agent-base`
- `/agents-sdk/api/cli-sw-agent-init`
- `/agents-sdk/api/cli-sw-search`
- `/agents-sdk/api/cli/swaig-test`
- `/agents-sdk/api/configuration`
- `/agents-sdk/api/contexts`
- `/agents-sdk/api/data-map`
- ... and 826 more

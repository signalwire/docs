---
title: "CallErrorKind"
---

# Type Alias: CallErrorKind

> **CallErrorKind** = `"media"` \| `"signaling"` \| `"timeout"` \| `"rejected"` \| `"network"` \| `"internal"`

Defined in: [core/errors.ts:241](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/errors.ts#L241)

Semantic category of a call-lifecycle error.

- `'media'`     – RTCPeerConnection / media device failure
- `'signaling'` – Verto / JSON-RPC protocol error
- `'timeout'`   – Call setup timed out waiting for a response
- `'rejected'`  – Remote side rejected the call
- `'network'`   – Transport lost during an active call
- `'internal'`  – Unexpected / unknown error

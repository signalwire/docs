---
title: "ResilienceCallStatus"
---

# Type Alias: ResilienceCallStatus

> **ResilienceCallStatus** = `"new"` \| `"trying"` \| `"ringing"` \| `"connecting"` \| `"connected"` \| `"recovering"` \| `"disconnecting"` \| `"disconnected"` \| `"failed"` \| `"destroyed"`

Defined in: [core/types/resilience.types.ts:35](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L35)

Extended call status that includes the 'recovering' state.

Used when the SDK is attempting to recover a call after a network
disruption or media failure.

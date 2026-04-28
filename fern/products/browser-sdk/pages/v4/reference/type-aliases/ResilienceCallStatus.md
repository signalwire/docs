# Type Alias: ResilienceCallStatus

> **ResilienceCallStatus** = `"new"` \| `"trying"` \| `"ringing"` \| `"connecting"` \| `"connected"` \| `"recovering"` \| `"disconnecting"` \| `"disconnected"` \| `"failed"` \| `"destroyed"`

Defined in: [core/types/resilience.types.ts:35](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/types/resilience.types.ts#L35)

Extended call status that includes the 'recovering' state.

Used when the SDK is attempting to recover a call after a network
disruption or media failure.

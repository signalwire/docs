---
title: "resetToDefaults"
---

# resetToDefaults

> **resetToDefaults**(): `Promise`\<`void`\>

Defined in: [clients/SignalWire.ts:1421](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/clients/SignalWire.ts#L1421)

Clears all SDK-persisted state and resets to defaults.

This clears device preferences, device history, authorization state,
attached call IDs, and all SDK storage keys, then re-enumerates devices.

#### Returns

`Promise`\<`void`\>

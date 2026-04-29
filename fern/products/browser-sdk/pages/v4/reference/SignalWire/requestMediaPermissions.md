---
title: "requestMediaPermissions"
---

# requestMediaPermissions

> **requestMediaPermissions**(`options?`): `Promise`\<[`PermissionResult`](../interfaces/PermissionResult.md)\>

Defined in: [clients/SignalWire.ts:1340](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/clients/SignalWire.ts#L1340)

Triggers the browser's media permission dialog and captures the user's device selections.

#### Parameters

| Parameter | Type | Description |
| ------ | ------ | ------ |
| `options` | \{ `audio?`: `boolean`; `video?`: `boolean`; \} | Which permissions to request. |
| `options.audio?` | `boolean` | Whether to request audio permission. |
| `options.video?` | `boolean` | Whether to request video permission. |

#### Returns

`Promise`\<[`PermissionResult`](../interfaces/PermissionResult.md)\>

The permission result with selected devices.

---
title: "SATClaims"
---

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/crypto.types.ts#L18)</sub>

SAT claims returned by /api/fabric/subscriber/info.

## Properties

| Property | Type | Description | Defined in |
| ------ | ------ | ------ | ------ |
| `cnf?` | `object` | Confirmation claim binding the token to a key. | [core/types/crypto.types.ts:22](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/crypto.types.ts#L22) |
| `cnf.jkt` | `string` | - | [core/types/crypto.types.ts:22](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/crypto.types.ts#L22) |
| `expires_at?` | `number` | Token expiry timestamp in seconds since epoch. | [core/types/crypto.types.ts:24](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/crypto.types.ts#L24) |
| `scope?` | `string`[] | Token scopes (e.g., ["sat:refresh"]). | [core/types/crypto.types.ts:20](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/crypto.types.ts#L20) |

---
title: "SDKCredential"
---

# Interface: SDKCredential

Defined in: [core/types/common.types.ts:112](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/common.types.ts#L112)

Authentication credentials for the SDK.

At least one of `token` or `authorizationState` must be provided.

## Properties

| Property | Type | Description | Defined in |
| ------ | ------ | ------ | ------ |
| <a id="authorizationstate"></a> `authorizationState?` | `string` | Pre-authorized session state (alternative to token). | [core/types/common.types.ts:116](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/common.types.ts#L116) |
| <a id="expiry_at"></a> `expiry_at?` | `number` | Token expiry timestamp in milliseconds since epoch. When set, the SDK attempts credential refresh before expiry. | [core/types/common.types.ts:118](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/common.types.ts#L118) |
| <a id="token"></a> `token?` | `string` | JWT subscriber access token (SAT). | [core/types/common.types.ts:114](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/common.types.ts#L114) |

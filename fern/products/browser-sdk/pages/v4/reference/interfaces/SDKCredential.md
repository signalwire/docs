# Interface: SDKCredential

Defined in: [core/types/common.types.ts:112](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/types/common.types.ts#L112)

Authentication credentials for the SDK.

At least one of `token` or `authorizationState` must be provided.

## Properties

| Property | Type | Description | Defined in |
| ------ | ------ | ------ | ------ |
| <a id="authorizationstate"></a> `authorizationState?` | `string` | Pre-authorized session state (alternative to token). | [core/types/common.types.ts:116](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/types/common.types.ts#L116) |
| <a id="expiry_at"></a> `expiry_at?` | `number` | Token expiry timestamp in milliseconds since epoch. When set, the SDK attempts credential refresh before expiry. | [core/types/common.types.ts:118](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/types/common.types.ts#L118) |
| <a id="token"></a> `token?` | `string` | JWT subscriber access token (SAT). | [core/types/common.types.ts:114](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/types/common.types.ts#L114) |

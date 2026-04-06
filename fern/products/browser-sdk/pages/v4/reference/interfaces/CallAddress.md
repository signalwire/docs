# Interface: CallAddress

Defined in: [core/entities/types/call.types.ts:139](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L139)

Minimal address interface for call context
Avoids circular dependency with full Address class

## Properties

| Property | Modifier | Type | Defined in |
| ------ | ------ | ------ | ------ |
| <a id="displayname"></a> `displayName?` | `readonly` | `string` | [core/entities/types/call.types.ts:141](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L141) |
| <a id="id"></a> `id` | `readonly` | `string` | [core/entities/types/call.types.ts:140](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L140) |
| <a id="textmessages"></a> `textMessages$` | `readonly` | `Observable`\<`CallTextMessageCollection` \| `undefined`\> | [core/entities/types/call.types.ts:144](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L144) |
| <a id="type"></a> `type?` | `readonly` | `string` | [core/entities/types/call.types.ts:142](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L142) |

## Methods

### sendText()

> **sendText**(`text`): `Promise`\<`void`\>

Defined in: [core/entities/types/call.types.ts:143](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L143)

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `text` | `string` |

#### Returns

`Promise`\<`void`\>

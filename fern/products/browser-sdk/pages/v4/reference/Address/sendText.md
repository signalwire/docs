---
title: "sendText"
---

# sendText

> **sendText**(`text`): `Promise`\<`void`\>

Defined in: [core/entities/Address.ts:270](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Address.ts#L270)

Sends a text message to this address.

#### Parameters

| Parameter | Type | Description |
| ------ | ------ | ------ |
| `text` | `string` | The message text to send. |

#### Returns

`Promise`\<`void`\>

#### Example

```ts
await address.sendText('Hello!');
```

---
title: "sendText"
---

> **sendText**(`text`): `Promise`\<`void`\>

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Address.ts#L270)</sub>

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

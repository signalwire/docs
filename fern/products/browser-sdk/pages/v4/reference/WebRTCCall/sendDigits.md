---
title: "sendDigits"
---

> **sendDigits**(`dtmf`): `Promise`\<`void`\>

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Call.ts#L1223)</sub>

Sends DTMF digits on the call.

#### Parameters

| Parameter | Type | Description |
| ------ | ------ | ------ |
| `dtmf` | `string` | The digit string to send (e.g. `'1234#'`). |

#### Returns

`Promise`\<`void`\>

#### Example

```ts
await call.sendDigits('1234#');
```


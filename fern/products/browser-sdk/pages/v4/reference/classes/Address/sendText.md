# sendText

> **sendText**(`text`): `Promise`\<`void`\>

Defined in: [core/entities/Address.ts:270](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/Address.ts#L270)

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

# dial

> **dial**(`destination`, `options?`): `Promise`\<[`Call`](../../interfaces/Call.md)\>

Defined in: [clients/SignalWire.ts:1053](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/clients/SignalWire.ts#L1053)

Places an outbound call to the given destination.

Waits for authentication before dialing. Media options are merged from
saved preferences, destination query parameters (e.g. `?channel=video`),
and the provided `options` (highest priority).

Returns a [Call](../../interfaces/Call.md) in `'ringing'` state. Subscribe to [Call.status$](../../interfaces/Call.md#status-1)
to track progression through `'connected'` → `'disconnected'`.

#### Parameters

| Parameter | Type | Description |
| ------ | ------ | ------ |
| `destination` | `string` \| [`Address`](Address.md) | Address URI string (e.g. `'/public/my-room'`) or [Address](Address.md) instance. |
| `options` | [`DialOptions`](../../interfaces/DialOptions.md) | Media and dial options (audio/video, device constraints). Overrides defaults. |

#### Returns

`Promise`\<[`Call`](../../interfaces/Call.md)\>

The created [Call](../../interfaces/Call.md) instance.

#### Throws

If authentication is not complete or call creation fails.

#### Example

```ts
const call = await client.dial('/public/conference', {
  audio: true,
  video: true,
});
call.status$.subscribe(status => console.log('Call:', status));
```

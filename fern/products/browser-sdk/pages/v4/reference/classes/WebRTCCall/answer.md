# answer

> **answer**(`options?`): `void`

Defined in: [core/entities/Call.ts:1249](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/Call.ts#L1249)

Accepts an inbound call, optionally overriding media options for the answer.

#### Parameters

| Parameter | Type | Description |
| ------ | ------ | ------ |
| `options?` | [`MediaOptions`](../../interfaces/MediaOptions.md) | Optional media constraints for the answer (audio/video). |

#### Returns

`void`

#### Example

```ts
// Accept with defaults
call.answer();

// Accept audio-only
call.answer({ audio: true, video: false });
```

#### See

 - [reject](#reject) to decline the call instead.
 - [answered$](#answered) to observe the acceptance state.

#### Implementation of

`CallManager.answer`

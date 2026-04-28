# subscribe

> **subscribe**(`eventType`): `Observable`\<`Record`\<`string`, `unknown`\>\>

Defined in: [core/entities/Call.ts:1133](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/Call.ts#L1133)

Subscribe to a custom signaling event type on this call.

Returns a cached observable that filters `callSessionEvents$` for events
whose `event_type` matches the given string. The observable completes
when the call is destroyed.

Unlike `signalingEvent$` (which only emits known call-level event types),
this method also matches custom/user-defined event types.

The SDK does not validate event type strings --- the server decides
whether a given type is valid.

#### Parameters

| Parameter | Type | Description |
| ------ | ------ | ------ |
| `eventType` | `string` | The event type to subscribe to (e.g. `'my.custom.event'`). |

#### Returns

`Observable`\<`Record`\<`string`, `unknown`\>\>

An observable that emits matching signaling events.

#### Example

```ts
call.subscribe('my.custom.event').subscribe(event => {
  console.log('Custom event:', event);
});
```

#### Implementation of

`CallManager.subscribe`

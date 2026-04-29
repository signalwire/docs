# localStream$

#### Get Signature

> **get** **localStream$**(): `Observable`\<`MediaStream`\>

Defined in: [core/entities/Call.ts:583](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/Call.ts#L583)

Observable of the local media stream (camera/microphone).

##### Returns

`Observable`\<`MediaStream`\>

#### Implementation of

`CallManager.localStream$`

## localStream

#### Get Signature

> **get** **localStream**(): `MediaStream` \| `null`

Defined in: [core/entities/Call.ts:587](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/Call.ts#L587)

Current local media stream, or `null` if not available.

##### Returns

`MediaStream` \| `null`

#### Implementation of

`CallManager.localStream`

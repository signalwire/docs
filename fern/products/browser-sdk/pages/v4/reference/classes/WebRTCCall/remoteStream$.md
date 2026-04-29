# remoteStream$

#### Get Signature

> **get** **remoteStream$**(): `Observable`\<`MediaStream`\>

Defined in: [core/entities/Call.ts:591](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/Call.ts#L591)

Observable of the remote media stream from the far end.

##### Returns

`Observable`\<`MediaStream`\>

#### Implementation of

`CallManager.remoteStream$`

## remoteStream

#### Get Signature

> **get** **remoteStream**(): `MediaStream` \| `null`

Defined in: [core/entities/Call.ts:595](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/Call.ts#L595)

Current remote media stream, or `null` if not available.

##### Returns

`MediaStream` \| `null`

#### Implementation of

`CallManager.remoteStream`

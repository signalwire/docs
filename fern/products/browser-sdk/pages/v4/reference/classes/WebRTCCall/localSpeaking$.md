# localSpeaking$

#### Get Signature

> **get** **localSpeaking$**(): `Observable`\<`boolean`\>

Defined in: [core/entities/Call.ts:1384](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/Call.ts#L1384)

Observable that is `true` while the local participant is speaking
(RMS level above the VAD threshold, with hold time to avoid flicker).

##### Returns

`Observable`\<`boolean`\>

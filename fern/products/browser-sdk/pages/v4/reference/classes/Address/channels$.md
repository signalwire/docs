# channels$

#### Get Signature

> **get** **channels$**(): `Observable`\<\{ `audio?`: `string`; `messaging?`: `string`; `video?`: `string`; \}\>

Defined in: [core/entities/Address.ts:213](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/Address.ts#L213)

Observable of available communication channels (audio, video, messaging).

##### Returns

`Observable`\<\{ `audio?`: `string`; `messaging?`: `string`; `video?`: `string`; \}\>

## channels

#### Get Signature

> **get** **channels**(): `object`

Defined in: [core/entities/Address.ts:229](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/Address.ts#L229)

Available communication channels.

##### Returns

`object`

###### audio?

> `optional` **audio?**: `string`

###### messaging?

> `optional` **messaging?**: `string`

###### video?

> `optional` **video?**: `string`

Defined in: [packages/core/src/types/index.ts:20](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/types/index.ts#L20)

## Type Parameters

### EventTypes

`EventTypes` *extends* `EventEmitter.ValidEventTypes`

## Methods

### emit()

> **emit**\<`E`\>(`event`, ...`args`): `void`

Defined in: [packages/core/src/types/index.ts:43](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/types/index.ts#L43)

**`Internal`**

#### Type Parameters

##### E

`E` *extends* `string` \| `symbol`

#### Parameters

##### event

`E`

##### args

...`Parameters`\<`EventListener`\<`EventTypes`, `E`\>\>

#### Returns

`void`

***

### off()

> **off**\<`T`\>(`event`, `fn?`): `EmitterContract`\<`EventTypes`\>

Defined in: [packages/core/src/types/index.ts:33](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/types/index.ts#L33)

#### Type Parameters

##### T

`T` *extends* `string` \| `symbol`

#### Parameters

##### event

`T`

##### fn?

`EventListener`\<`EventTypes`, `T`\>

#### Returns

`EmitterContract`\<`EventTypes`\>

***

### on()

> **on**\<`T`\>(`event`, `fn`): `EmitterContract`\<`EventTypes`\>

Defined in: [packages/core/src/types/index.ts:23](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/types/index.ts#L23)

#### Type Parameters

##### T

`T` *extends* `string` \| `symbol`

#### Parameters

##### event

`T`

##### fn

`EventListener`\<`EventTypes`, `T`\>

#### Returns

`EmitterContract`\<`EventTypes`\>

***

### once()

> **once**\<`T`\>(`event`, `fn`): `EmitterContract`\<`EventTypes`\>

Defined in: [packages/core/src/types/index.ts:28](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/types/index.ts#L28)

#### Type Parameters

##### T

`T` *extends* `string` \| `symbol`

#### Parameters

##### event

`T`

##### fn

`EventListener`\<`EventTypes`, `T`\>

#### Returns

`EmitterContract`\<`EventTypes`\>

***

### removeAllListeners()

> **removeAllListeners**\<`T`\>(`event?`): `EmitterContract`\<`EventTypes`\>

Defined in: [packages/core/src/types/index.ts:38](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/types/index.ts#L38)

#### Type Parameters

##### T

`T` *extends* `string` \| `symbol`

#### Parameters

##### event?

`T`

#### Returns

`EmitterContract`\<`EventTypes`\>

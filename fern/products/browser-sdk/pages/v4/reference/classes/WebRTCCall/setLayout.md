# setLayout

> **setLayout**(`layout`, `positions`): `Promise`\<`void`\>

Defined in: [core/entities/Call.ts:1288](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/Call.ts#L1288)

Sets the call layout and participant positions.

#### Parameters

| Parameter | Type | Description |
| ------ | ------ | ------ |
| `layout` | `string` | Layout name (must be one of [layouts](#layouts)). |
| `positions` | `Record`\<`string`, [`VideoPosition`](../../type-aliases/VideoPosition.md)\> | Map of member IDs to [VideoPosition](../../type-aliases/VideoPosition.md) values. |

#### Returns

`Promise`\<`void`\>

#### Throws

If the layout is not in the available [layouts](#layouts).

#### Example

```ts
await call.setLayout('grid-responsive', {
  [participantId]: 'reserved-0',
});
```

#### Implementation of

`CallManager.setLayout`

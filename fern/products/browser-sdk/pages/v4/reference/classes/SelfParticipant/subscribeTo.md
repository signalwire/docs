# subscribeTo

> `protected` **subscribeTo**\<`T`\>(`observable`, `observerOrNext`): `void`

Defined in: [behaviors/Destroyable.ts:65](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/behaviors/Destroyable.ts#L65)

#### Type Parameters

| Type Parameter |
| ------ |
| `T` |

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `observable` | `Observable`\<`T`\> |
| `observerOrNext` | `Partial`\<`Observer`\<`T`\>\> \| ((`value`) => `void`) \| `undefined` |

#### Returns

`void`

#### Inherited from

[`Participant`](Participant.md).[`subscribeTo`](Participant.md#subscribeto)

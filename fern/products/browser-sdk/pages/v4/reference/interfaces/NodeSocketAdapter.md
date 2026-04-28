# Interface: NodeSocketAdapter

Defined in: [core/types/common.types.ts:92](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/types/common.types.ts#L92)

There's a difference in `searchParams` between URL from
`lib` and URL from `url` (node) that makes using the same
not possible for us.

## Constructors

### Constructor

> **new NodeSocketAdapter**(`address`, `options?`): `NodeSocketClient`

Defined in: [core/types/common.types.ts:93](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/types/common.types.ts#L93)

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `address` | `string` \| `URL` |
| `options?` | `unknown` |

#### Returns

`NodeSocketClient`

### Constructor

> **new NodeSocketAdapter**(`address`, `protocols?`, `options?`): `NodeSocketClient`

Defined in: [core/types/common.types.ts:94](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/types/common.types.ts#L94)

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `address` | `string` \| `URL` |
| `protocols?` | `string` \| `string`[] |
| `options?` | `unknown` |

#### Returns

`NodeSocketClient`

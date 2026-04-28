# Interface: SATClaims

Defined in: [core/types/crypto.types.ts:18](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/types/crypto.types.ts#L18)

SAT claims returned by /api/fabric/subscriber/info.

## Properties

| Property | Type | Description | Defined in |
| ------ | ------ | ------ | ------ |
| <a id="cnf"></a> `cnf?` | `object` | Confirmation claim binding the token to a key. | [core/types/crypto.types.ts:22](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/types/crypto.types.ts#L22) |
| `cnf.jkt` | `string` | - | [core/types/crypto.types.ts:22](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/types/crypto.types.ts#L22) |
| <a id="expires_at"></a> `expires_at?` | `number` | Token expiry timestamp in seconds since epoch. | [core/types/crypto.types.ts:24](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/types/crypto.types.ts#L24) |
| <a id="scope"></a> `scope?` | `string`[] | Token scopes (e.g., ["sat:refresh"]). | [core/types/crypto.types.ts:20](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/types/crypto.types.ts#L20) |

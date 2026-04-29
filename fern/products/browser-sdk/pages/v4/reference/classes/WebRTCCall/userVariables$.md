# userVariables$

#### Get Signature

> **get** **userVariables$**(): `Observable`\<`Record`\<`string`, `unknown`\>\>

Defined in: [core/entities/Call.ts:600](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/Call.ts#L600)

Observable of custom user variables associated with the call.

##### Returns

`Observable`\<`Record`\<`string`, `unknown`\>\>

#### Implementation of

`CallManager.userVariables$`

## userVariables

#### Get Signature

> **get** **userVariables**(): `Record`\<`string`, `unknown`\>

Defined in: [core/entities/Call.ts:605](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/Call.ts#L605)

a copy of the current custom user variables of the call.

##### Returns

`Record`\<`string`, `unknown`\>

#### Set Signature

> **set** **userVariables**(`variables`): `void`

Defined in: [core/entities/Call.ts:610](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/Call.ts#L610)

Merge current custom user variables of the call.

##### Parameters

| Parameter | Type |
| ------ | ------ |
| `variables` | `Record`\<`string`, `unknown`\> |

##### Returns

`void`

#### Implementation of

`CallManager.userVariables`

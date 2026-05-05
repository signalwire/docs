---
title: "userVariables$"
---

#### Get Signature

> **get** **userVariables$**(): `Observable`\<`Record`\<`string`, `unknown`\>\>

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Call.ts#L600)</sub>

Observable of custom user variables associated with the call.

##### Returns

`Observable`\<`Record`\<`string`, `unknown`\>\>

## userVariables

#### Get Signature

> **get** **userVariables**(): `Record`\<`string`, `unknown`\>

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Call.ts#L605)</sub>

a copy of the current custom user variables of the call.

##### Returns

`Record`\<`string`, `unknown`\>

#### Set Signature

> **set** **userVariables**(`variables`): `void`

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Call.ts#L610)</sub>

Merge current custom user variables of the call.

##### Parameters

| Parameter | Type |
| ------ | ------ |
| `variables` | `Record`\<`string`, `unknown`\> |

##### Returns

`void`


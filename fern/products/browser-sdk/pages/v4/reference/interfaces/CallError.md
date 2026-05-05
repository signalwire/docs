---
title: "CallError"
---

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/errors.ts#L249)</sub>

Structured error emitted on `call.errors$`.

Provides actionable metadata so consumers can react without
resorting to `instanceof` checks on raw `Error` objects.

## Properties

| Property | Modifier | Type | Description | Defined in |
| ------ | ------ | ------ | ------ | ------ |
| `callId` | `readonly` | `string` | ID of the call that produced this error. | [core/errors.ts:261](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/errors.ts#L261) |
| `error` | `readonly` | `Error` | The underlying error. | [core/errors.ts:259](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/errors.ts#L259) |
| `fatal` | `readonly` | `boolean` | Whether the error terminates the call. When `true`, the call will automatically transition to `'failed'` and be destroyed — no further action is needed from the consumer. | [core/errors.ts:257](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/errors.ts#L257) |
| `kind` | `readonly` | [`CallErrorKind`](../type-aliases/CallErrorKind.md) | Semantic category of the error. | [core/errors.ts:251](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/errors.ts#L251) |

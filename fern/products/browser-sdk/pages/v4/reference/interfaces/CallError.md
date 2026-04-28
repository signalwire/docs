# Interface: CallError

Defined in: [core/errors.ts:249](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/errors.ts#L249)

Structured error emitted on `call.errors$`.

Provides actionable metadata so consumers can react without
resorting to `instanceof` checks on raw `Error` objects.

## Properties

| Property | Modifier | Type | Description | Defined in |
| ------ | ------ | ------ | ------ | ------ |
| <a id="callid"></a> `callId` | `readonly` | `string` | ID of the call that produced this error. | [core/errors.ts:261](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/errors.ts#L261) |
| <a id="error"></a> `error` | `readonly` | `Error` | The underlying error. | [core/errors.ts:259](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/errors.ts#L259) |
| <a id="fatal"></a> `fatal` | `readonly` | `boolean` | Whether the error terminates the call. When `true`, the call will automatically transition to `'failed'` and be destroyed — no further action is needed from the consumer. | [core/errors.ts:257](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/errors.ts#L257) |
| <a id="kind"></a> `kind` | `readonly` | [`CallErrorKind`](../type-aliases/CallErrorKind.md) | Semantic category of the error. | [core/errors.ts:251](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/errors.ts#L251) |

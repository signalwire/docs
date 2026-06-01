---
slug: "/reference/typescript/relay/action/action/constructor"
title: "constructor"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "relay.Action.Action.constructor"
  parent: "relay.Action.Action"
  module: "relay.Action"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Action.ts"
---
# `constructor`

## Signature

```typescript
constructor(
  call: CallLike,
  controlId: string,
  terminalEvent: string,
  terminalStates: readonly string[]
): Action
```

## Parameters

| Name             | Type                | Required | Default | Description                                                                                          |
| ---------------- | ------------------- | -------- | ------- | ---------------------------------------------------------------------------------------------------- |
| `call`           | `CallLike`          | yes      | —       | Owning call (via the structural [CallLike](/reference/typescript/relay/action/call-like) interface). |
| `controlId`      | `string`            | yes      | —       | Unique control ID the server will echo on events.                                                    |
| `terminalEvent`  | `string`            | yes      | —       | Event type that carries terminal state transitions.                                                  |
| `terminalStates` | `readonly string[]` | yes      | —       | State values that mark this action as completed.                                                     |

## Returns

`Action`

## Source

[`src/relay/Action.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Action.ts)

Line 75.

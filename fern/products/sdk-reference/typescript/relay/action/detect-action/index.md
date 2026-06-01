---
slug: "/reference/typescript/relay/action/detect-action"
title: "DetectAction"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "class"
  language: "typescript"
  qualified_name: "relay.Action.DetectAction"
  parent: "relay.Action"
  module: "relay.Action"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Action.ts"
---
# `DetectAction`

Async handle for a `calling.call.detect` action (machine / fax / digit).

## Signature

```typescript
class DetectAction extends Action
```

## Inheritance

**Extends:** [Action](/reference/typescript/relay/action/action)

## Properties

| Name        | Type                    | Required | Default | Description                                                               |
| ----------- | ----------------------- | -------- | ------- | ------------------------------------------------------------------------- |
| `call`      | `CallLike`              | yes      | —       | Reference to the owning call.                                             |
| `completed` | `boolean`               | yes      | —       | Whether the action has reached a terminal state.                          |
| `controlId` | `string`                | yes      | —       | Unique control ID used by the server to route events back to this action. |
| `isDone`    | `get isDone(): boolean` | yes      | —       | True once the action has reached a terminal state.                        |
| `result`    | `RelayEvent \| null`    | yes      | —       | Final event once the action terminates, or `null` while still running.    |

## Methods

- [`_checkEvent`](/reference/typescript/relay/action/detect-action/check-event) — Resolve on first meaningful result OR terminal state.
- [`constructor`](/reference/typescript/relay/action/detect-action/constructor)
- [`stop`](/reference/typescript/relay/action/detect-action/stop) — Stop detection before the timeout elapses.
- [`wait`](/reference/typescript/relay/action/detect-action/wait) — Wait for the action to complete.

## Source

[`src/relay/Action.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Action.ts)

Line 249.

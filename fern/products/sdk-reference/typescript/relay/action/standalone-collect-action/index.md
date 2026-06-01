---
slug: "/reference/typescript/relay/action/standalone-collect-action"
title: "StandaloneCollectAction"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "class"
  language: "typescript"
  qualified_name: "relay.Action.StandaloneCollectAction"
  parent: "relay.Action"
  module: "relay.Action"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Action.ts"
---
# `StandaloneCollectAction`

Async handle for a bare `calling.call.collect` action (no accompanying play).

## Signature

```typescript
class StandaloneCollectAction extends Action
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

- [`constructor`](/reference/typescript/relay/action/standalone-collect-action/constructor)
- [`startInputTimers`](/reference/typescript/relay/action/standalone-collect-action/start-input-timers) — Start the collect input timers.
- [`stop`](/reference/typescript/relay/action/standalone-collect-action/stop) — Stop the collect operation before input is received.
- [`wait`](/reference/typescript/relay/action/standalone-collect-action/wait) — Wait for the action to complete.

## Source

[`src/relay/Action.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Action.ts)

Line 332.

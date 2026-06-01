---
slug: "/reference/typescript/relay/action/collect-action"
title: "CollectAction"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "class"
  language: "typescript"
  qualified_name: "relay.Action.CollectAction"
  parent: "relay.Action"
  module: "relay.Action"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Action.ts"
---
# `CollectAction`

Async handle for a `play_and_collect` action (combined playback + input collection).

## Signature

```typescript
class CollectAction extends Action
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

- [`_checkEvent`](/reference/typescript/relay/action/collect-action/check-event) — play\_and\_collect shares a control\_id across play and collect phases. Only resolve on collect events, not play events.
- [`constructor`](/reference/typescript/relay/action/collect-action/constructor)
- [`startInputTimers`](/reference/typescript/relay/action/collect-action/start-input-timers) — Start the collect input timers (useful when `initial_timeout` should be reset after an async side effect completes).
- [`stop`](/reference/typescript/relay/action/collect-action/stop) — Stop the play\_and\_collect operation.
- [`volume`](/reference/typescript/relay/action/collect-action/volume) — Adjust playback volume of the prompt audio mid-collect.
- [`wait`](/reference/typescript/relay/action/collect-action/wait) — Wait for the action to complete.

## Source

[`src/relay/Action.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Action.ts)

Line 277.

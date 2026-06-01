---
slug: "/reference/typescript/relay/action/play-action"
title: "PlayAction"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "class"
  language: "typescript"
  qualified_name: "relay.Action.PlayAction"
  parent: "relay.Action"
  module: "relay.Action"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Action.ts"
---
# `PlayAction`

Async handle for a `calling.call.play` action — controls playback in progress.

## Signature

```typescript
class PlayAction extends Action
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

- [`constructor`](/reference/typescript/relay/action/play-action/constructor)
- [`pause`](/reference/typescript/relay/action/play-action/pause) — Pause active playback (resumable with [resume](/reference/typescript/relay/action/play-action/resume)).
- [`resume`](/reference/typescript/relay/action/play-action/resume) — Resume playback paused by [pause](/reference/typescript/relay/action/play-action/pause).
- [`stop`](/reference/typescript/relay/action/play-action/stop) — Stop the playback.
- [`volume`](/reference/typescript/relay/action/play-action/volume) — Adjust playback volume.
- [`wait`](/reference/typescript/relay/action/play-action/wait) — Wait for the action to complete.

## Source

[`src/relay/Action.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Action.ts)

Line 156.

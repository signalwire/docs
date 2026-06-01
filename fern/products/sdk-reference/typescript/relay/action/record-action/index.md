---
slug: "/reference/typescript/relay/action/record-action"
title: "RecordAction"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "class"
  language: "typescript"
  qualified_name: "relay.Action.RecordAction"
  parent: "relay.Action"
  module: "relay.Action"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Action.ts"
---
# `RecordAction`

Async handle for a `calling.call.record` action — controls recording in progress.

## Signature

```typescript
class RecordAction extends Action
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

- [`constructor`](/reference/typescript/relay/action/record-action/constructor)
- [`pause`](/reference/typescript/relay/action/record-action/pause) — Pause the recording (resumable with [resume](/reference/typescript/relay/action/record-action/resume)).
- [`resume`](/reference/typescript/relay/action/record-action/resume) — Resume recording paused by [pause](/reference/typescript/relay/action/record-action/pause).
- [`stop`](/reference/typescript/relay/action/record-action/stop) — Stop the recording and finalise the file.
- [`wait`](/reference/typescript/relay/action/record-action/wait) — Wait for the action to complete.

## Source

[`src/relay/Action.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Action.ts)

Line 206.

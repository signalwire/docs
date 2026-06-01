---
slug: "/reference/typescript/relay/action/action"
title: "Action"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "class"
  language: "typescript"
  qualified_name: "relay.Action.Action"
  parent: "relay.Action"
  module: "relay.Action"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Action.ts"
---
# `Action`

Async handle for a controllable call operation (play, record, tap, detect, etc.).

An Action is returned from the async variants on [Call](/reference/typescript/relay/call) (e.g. `call.playAsync`).
It resolves when the server emits a terminal event for its `controlId`. Use
[Action.wait](/reference/typescript/relay/action/action/wait) to await completion, or register an `onCompleted` callback.

## Signature

```typescript
class Action
```

## Examples

```typescript
const play = await call.playAsync({ play: [{ type: 'tts', text: 'Hello!' }] });
// do other work while the greeting plays...
const event = await play.wait(10); // seconds
console.log('Playback finished with state', event.params.state);
```

## Properties

| Name        | Type                    | Required | Default | Description                                                               |
| ----------- | ----------------------- | -------- | ------- | ------------------------------------------------------------------------- |
| `call`      | `CallLike`              | yes      | —       | Reference to the owning call.                                             |
| `completed` | `boolean`               | yes      | —       | Whether the action has reached a terminal state.                          |
| `controlId` | `string`                | yes      | —       | Unique control ID used by the server to route events back to this action. |
| `isDone`    | `get isDone(): boolean` | yes      | —       | True once the action has reached a terminal state.                        |
| `result`    | `RelayEvent \| null`    | yes      | —       | Final event once the action terminates, or `null` while still running.    |

## Methods

- [`constructor`](/reference/typescript/relay/action/action/constructor)
- [`wait`](/reference/typescript/relay/action/action/wait) — Wait for the action to complete.

## Source

[`src/relay/Action.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Action.ts)

Line 55.

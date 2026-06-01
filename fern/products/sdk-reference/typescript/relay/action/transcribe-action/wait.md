---
slug: "/reference/typescript/relay/action/transcribe-action/wait"
title: "wait"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "relay.Action.TranscribeAction.wait"
  parent: "relay.Action.TranscribeAction"
  module: "relay.Action"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Action.ts"
---
# `wait`

Wait for the action to complete.

## Signature

```typescript
wait(timeout?: number): Promise<RelayEvent>
```

## Parameters

| Name      | Type     | Required | Default | Description                                                                                 |
| --------- | -------- | -------- | ------- | ------------------------------------------------------------------------------------------- |
| `timeout` | `number` | no       | —       | Maximum time to wait in **seconds** (matches the Python SDK convention — not milliseconds). |

## Returns

`Promise<RelayEvent>` — The terminal [RelayEvent](/reference/typescript/relay/relay-event) for this action.

## Throws

- When the optional timeout elapses before the action ends.

## Source

[`src/relay/Action.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Action.ts)

Line 125.

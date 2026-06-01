---
slug: "/reference/typescript/relay/call/call/record"
title: "record"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "relay.Call.Call.record"
  parent: "relay.Call.Call"
  module: "relay.Call"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Call.ts"
---
# `record`

Record audio from the call.

## Signature

```typescript
record(
  audio?: Record<string, unknown>,
  options: { ...2 fields } = {}
): Promise<RecordAction>
```

## Parameters

| Name                  | Type                                                      | Required | Default | Description                                                                                   |
| --------------------- | --------------------------------------------------------- | -------- | ------- | --------------------------------------------------------------------------------------------- |
| `audio`               | `Record<string, unknown>`                                 | no       | —       | Platform-shaped audio recording options (direction, codec, timeouts, etc.). Defaults to `{}`. |
| `options`             | `{ controlId?: string; onCompleted?: CompletedCallback }` | yes      | `{}`    | Recording behaviour.                                                                          |
| `options.controlId`   | `string`                                                  | no       | —       | Explicit control ID. Auto-generated when omitted.                                             |
| `options.onCompleted` | `CompletedCallback`                                       | no       | —       | Callback fired when the recording reaches a terminal state.                                   |

## Returns

`Promise<RecordAction>` — A [RecordAction](/reference/typescript/relay/action/record-action) for control and completion tracking.

## Throws

- When the record command is rejected.

## Source

[`src/relay/Call.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Call.ts)

Line 403.

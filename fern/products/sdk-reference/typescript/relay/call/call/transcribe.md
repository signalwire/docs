---
slug: "/reference/typescript/relay/call/call/transcribe"
title: "transcribe"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "relay.Call.Call.transcribe"
  parent: "relay.Call.Call"
  module: "relay.Call"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Call.ts"
---
# `transcribe`

Start transcribing the call.

## Signature

```typescript
transcribe(options: { ...3 fields } = {}): Promise<TranscribeAction>
```

## Parameters

| Name                  | Type                                                                          | Required | Default | Description                                       |
| --------------------- | ----------------------------------------------------------------------------- | -------- | ------- | ------------------------------------------------- |
| `options`             | `{ controlId?: string; onCompleted?: CompletedCallback; statusUrl?: string }` | yes      | `{}`    | Transcription behaviour.                          |
| `options.controlId`   | `string`                                                                      | no       | —       | Explicit control ID. Auto-generated when omitted. |
| `options.onCompleted` | `CompletedCallback`                                                           | no       | —       | Callback fired when transcription completes.      |
| `options.statusUrl`   | `string`                                                                      | no       | —       | Webhook URL for transcription status events.      |

## Returns

`Promise<TranscribeAction>` — A [TranscribeAction](/reference/typescript/relay/action/transcribe-action) for control and completion tracking.

## Throws

- When the transcribe command is rejected.

## Source

[`src/relay/Call.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Call.ts)

Line 933.

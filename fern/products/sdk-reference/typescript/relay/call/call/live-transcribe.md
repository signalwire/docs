---
slug: "/reference/typescript/relay/call/call/live-transcribe"
title: "liveTranscribe"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "relay.Call.Call.liveTranscribe"
  parent: "relay.Call.Call"
  module: "relay.Call"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Call.ts"
---
# `liveTranscribe`

Start or stop live transcription on the call.

## Signature

```typescript
liveTranscribe(
  action: Record<string, unknown>,
  extra?: Record<string, unknown>
): Promise<Record<string, unknown>>
```

## Parameters

| Name     | Type                      | Required | Default | Description                                                          |
| -------- | ------------------------- | -------- | ------- | -------------------------------------------------------------------- |
| `action` | `Record<string, unknown>` | yes      | —       | Platform-shaped action block (`start` or `stop` plus configuration). |
| `extra`  | `Record<string, unknown>` | no       | —       | Optional additional params merged into the request.                  |

## Returns

`Promise<Record<string, unknown>>` — The platform's live\_transcribe response.

## Throws

- When the live\_transcribe command is rejected.

## Source

[`src/relay/Call.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Call.ts)

Line 1023.

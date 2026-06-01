---
slug: "/reference/typescript/relay/call/call/play"
title: "play"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "relay.Call.Call.play"
  parent: "relay.Call.Call"
  module: "relay.Call"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Call.ts"
---
# `play`

Play audio content on the call.

Returns immediately with a [PlayAction](/reference/typescript/relay/action/play-action) — `await action.wait()` to
block until playback finishes, or call `stop()` / `pause()` / `resume()`
/ `volume()` on it to control playback.

## Signature

```typescript
play(
  media: Record<string, unknown>[],
  options: { ...5 fields } = {}
): Promise<PlayAction>
```

## Parameters

| Name                  | Type                                                                                                          | Required | Default | Description                                                  |
| --------------------- | ------------------------------------------------------------------------------------------------------------- | -------- | ------- | ------------------------------------------------------------ |
| `media`               | `Record<string, unknown>[]`                                                                                   | yes      | —       | Platform-shaped play items (TTS, audio URLs, silence, etc.). |
| `options`             | `{ controlId?: string; direction?: string; loop?: number; onCompleted?: CompletedCallback; volume?: number }` | yes      | `{}`    | Optional playback controls.                                  |
| `options.controlId`   | `string`                                                                                                      | no       | —       | Explicit control ID. Auto-generated when omitted.            |
| `options.direction`   | `string`                                                                                                      | no       | —       | `"speak"`, `"hear"`, or `"both"`.                            |
| `options.loop`        | `number`                                                                                                      | no       | —       | Number of times to loop the playback.                        |
| `options.onCompleted` | `CompletedCallback`                                                                                           | no       | —       | Callback fired when playback reaches a terminal state.       |
| `options.volume`      | `number`                                                                                                      | no       | —       | Volume adjustment in dB.                                     |

## Returns

`Promise<PlayAction>` — A [PlayAction](/reference/typescript/relay/action/play-action) for control and completion tracking.

## Throws

- When the play command is rejected.

## Source

[`src/relay/Call.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Call.ts)

Line 367.

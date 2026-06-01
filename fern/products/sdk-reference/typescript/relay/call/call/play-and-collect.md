---
slug: "/reference/typescript/relay/call/call/play-and-collect"
title: "playAndCollect"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "relay.Call.Call.playAndCollect"
  parent: "relay.Call.Call"
  module: "relay.Call"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Call.ts"
---
# `playAndCollect`

Play audio and collect digit / speech input in a single operation.

Convenient for IVR prompts — playback stops as soon as input is received.

## Signature

```typescript
playAndCollect(
  media: Record<string, unknown>[],
  collect: Record<string, unknown>,
  options: { ...3 fields } = {}
): Promise<CollectAction>
```

## Parameters

| Name                  | Type                                                                       | Required | Default | Description                                                |
| --------------------- | -------------------------------------------------------------------------- | -------- | ------- | ---------------------------------------------------------- |
| `media`               | `Record<string, unknown>[]`                                                | yes      | —       | Audio items to play while collecting.                      |
| `collect`             | `Record<string, unknown>`                                                  | yes      | —       | Platform-shaped collect config (`digits`, `speech`, etc.). |
| `options`             | `{ controlId?: string; onCompleted?: CompletedCallback; volume?: number }` | yes      | `{}`    | Playback and collection behaviour.                         |
| `options.controlId`   | `string`                                                                   | no       | —       | Explicit control ID. Auto-generated when omitted.          |
| `options.onCompleted` | `CompletedCallback`                                                        | no       | —       | Callback fired when collect completes.                     |
| `options.volume`      | `number`                                                                   | no       | —       | Playback volume adjustment in dB.                          |

## Returns

`Promise<CollectAction>` — A [CollectAction](/reference/typescript/relay/action/collect-action) for the combined play-and-collect flow.

## Throws

- When the play\_and\_collect command is rejected.

## Source

[`src/relay/Call.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Call.ts)

Line 433.

---
slug: "/reference/typescript/relay/call/call/collect"
title: "collect"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "relay.Call.Call.collect"
  parent: "relay.Call.Call"
  module: "relay.Call"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Call.ts"
---
# `collect`

Collect digit / speech input without playing media.

## Signature

```typescript
collect(options: { ...9 fields } = {}): Promise<StandaloneCollectAction>
```

## Parameters

| Name                       | Type                                                                                                                                                                                                                                                           | Required | Default | Description                                       |
| -------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- | ------- | ------------------------------------------------- |
| `options`                  | `{ continuous?: boolean; controlId?: string; digits?: Record<string, unknown>; initialTimeout?: number; onCompleted?: CompletedCallback; partialResults?: boolean; sendStartOfInput?: boolean; speech?: Record<string, unknown>; startInputTimers?: boolean }` | yes      | `{}`    | Collect configuration.                            |
| `options.continuous`       | `boolean`                                                                                                                                                                                                                                                      | no       | —       | Keep collecting until explicitly stopped.         |
| `options.controlId`        | `string`                                                                                                                                                                                                                                                       | no       | —       | Explicit control ID. Auto-generated when omitted. |
| `options.digits`           | `Record<string, unknown>`                                                                                                                                                                                                                                      | no       | —       | DTMF digit-collection config.                     |
| `options.initialTimeout`   | `number`                                                                                                                                                                                                                                                       | no       | —       | Seconds to wait for the first input.              |
| `options.onCompleted`      | `CompletedCallback`                                                                                                                                                                                                                                            | no       | —       | Callback fired when collect completes.            |
| `options.partialResults`   | `boolean`                                                                                                                                                                                                                                                      | no       | —       | Emit partial (interim) results.                   |
| `options.sendStartOfInput` | `boolean`                                                                                                                                                                                                                                                      | no       | —       | Emit a start-of-input event when detected.        |
| `options.speech`           | `Record<string, unknown>`                                                                                                                                                                                                                                      | no       | —       | Speech-recognition config.                        |
| `options.startInputTimers` | `boolean`                                                                                                                                                                                                                                                      | no       | —       | Start input timers immediately.                   |

## Returns

`Promise<StandaloneCollectAction>` — A [StandaloneCollectAction](/reference/typescript/relay/action/standalone-collect-action) for control and completion tracking.

## Throws

- When the collect command is rejected.

## Source

[`src/relay/Call.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Call.ts)

Line 469.

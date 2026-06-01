---
slug: "/reference/typescript/relay/call/call/detect"
title: "detect"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "relay.Call.Call.detect"
  parent: "relay.Call.Call"
  module: "relay.Call"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Call.ts"
---
# `detect`

Start audio detection (answering machine, fax, DTMF).

## Signature

```typescript
detect(
  detect: Record<string, unknown>,
  options: { ...3 fields } = {}
): Promise<DetectAction>
```

## Parameters

| Name                  | Type                                                                        | Required | Default | Description                                       |
| --------------------- | --------------------------------------------------------------------------- | -------- | ------- | ------------------------------------------------- |
| `detect`              | `Record<string, unknown>`                                                   | yes      | —       | Platform-shaped detect configuration.             |
| `options`             | `{ controlId?: string; onCompleted?: CompletedCallback; timeout?: number }` | yes      | `{}`    | Detection behaviour.                              |
| `options.controlId`   | `string`                                                                    | no       | —       | Explicit control ID. Auto-generated when omitted. |
| `options.onCompleted` | `CompletedCallback`                                                         | no       | —       | Callback fired when detection completes.          |
| `options.timeout`     | `number`                                                                    | no       | —       | Detection timeout in seconds.                     |

## Returns

`Promise<DetectAction>` — A [DetectAction](/reference/typescript/relay/action/detect-action) for control and completion tracking.

## Throws

- When the detect command is rejected.

## Source

[`src/relay/Call.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Call.ts)

Line 566.

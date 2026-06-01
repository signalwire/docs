---
slug: "/reference/typescript/relay/call/call/tap"
title: "tap"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "relay.Call.Call.tap"
  parent: "relay.Call.Call"
  module: "relay.Call"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Call.ts"
---
# `tap`

Intercept call media and stream it to an external destination.

## Signature

```typescript
tap(
  tap: Record<string, unknown>,
  device: Record<string, unknown>,
  options: { ...2 fields } = {}
): Promise<TapAction>
```

## Parameters

| Name                  | Type                                                      | Required | Default | Description                                                 |
| --------------------- | --------------------------------------------------------- | -------- | ------- | ----------------------------------------------------------- |
| `tap`                 | `Record<string, unknown>`                                 | yes      | —       | Platform-shaped tap configuration (direction, codec, etc.). |
| `device`              | `Record<string, unknown>`                                 | yes      | —       | Destination device descriptor (WebSocket URL, etc.).        |
| `options`             | `{ controlId?: string; onCompleted?: CompletedCallback }` | yes      | `{}`    | Tap behaviour.                                              |
| `options.controlId`   | `string`                                                  | no       | —       | Explicit control ID. Auto-generated when omitted.           |
| `options.onCompleted` | `CompletedCallback`                                       | no       | —       | Callback fired when the tap completes.                      |

## Returns

`Promise<TapAction>` — A [TapAction](/reference/typescript/relay/action/tap-action) for control and completion tracking.

## Throws

- When the tap command is rejected.

## Source

[`src/relay/Call.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Call.ts)

Line 728.

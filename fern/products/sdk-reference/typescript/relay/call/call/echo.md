---
slug: "/reference/typescript/relay/call/call/echo"
title: "echo"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "relay.Call.Call.echo"
  parent: "relay.Call.Call"
  module: "relay.Call"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Call.ts"
---
# `echo`

Echo audio back to the caller (useful for testing network round-trip).

## Signature

```typescript
echo(options: { ...2 fields } = {}): Promise<Record<string, unknown>>
```

## Parameters

| Name                | Type                                       | Required | Default | Description                         |
| ------------------- | ------------------------------------------ | -------- | ------- | ----------------------------------- |
| `options`           | `{ statusUrl?: string; timeout?: number }` | yes      | `{}`    | Echo behaviour.                     |
| `options.statusUrl` | `string`                                   | no       | —       | Webhook URL for echo status events. |
| `options.timeout`   | `number`                                   | no       | —       | How long to echo, in seconds.       |

## Returns

`Promise<Record<string, unknown>>` — The platform's echo response.

## Throws

- When the echo command is rejected.

## Source

[`src/relay/Call.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Call.ts)

Line 958.

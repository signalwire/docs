---
slug: "/reference/typescript/relay/call/call/join-room"
title: "joinRoom"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "relay.Call.Call.joinRoom"
  parent: "relay.Call.Call"
  module: "relay.Call"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Call.ts"
---
# `joinRoom`

Join a video / audio room.

## Signature

```typescript
joinRoom(
  name: string,
  options: { ...1 fields } = {}
): Promise<Record<string, unknown>>
```

## Parameters

| Name                | Type                     | Required | Default | Description                                               |
| ------------------- | ------------------------ | -------- | ------- | --------------------------------------------------------- |
| `name`              | `string`                 | yes      | —       | Room name — callers on the same name share the same room. |
| `options`           | `{ statusUrl?: string }` | yes      | `{}`    | Room behaviour.                                           |
| `options.statusUrl` | `string`                 | no       | —       | Webhook URL for room status events.                       |

## Returns

`Promise<Record<string, unknown>>` — The platform's join\_room response.

## Throws

- When the join\_room command is rejected.

## Source

[`src/relay/Call.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Call.ts)

Line 1057.

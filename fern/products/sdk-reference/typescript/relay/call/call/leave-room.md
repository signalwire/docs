---
slug: "/reference/typescript/relay/call/call/leave-room"
title: "leaveRoom"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "relay.Call.Call.leaveRoom"
  parent: "relay.Call.Call"
  module: "relay.Call"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Call.ts"
---
# `leaveRoom`

Leave the current room.

## Signature

```typescript
leaveRoom(extra?: Record<string, unknown>): Promise<Record<string, unknown>>
```

## Parameters

| Name    | Type                      | Required | Default | Description                                         |
| ------- | ------------------------- | -------- | ------- | --------------------------------------------------- |
| `extra` | `Record<string, unknown>` | no       | —       | Optional additional params merged into the request. |

## Returns

`Promise<Record<string, unknown>>` — The platform's leave\_room response.

## Throws

- When the leave\_room command is rejected.

## Source

[`src/relay/Call.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Call.ts)

Line 1073.

---
slug: "/reference/typescript/relay/call/call/user-event"
title: "userEvent"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "relay.Call.Call.userEvent"
  parent: "relay.Call.Call"
  module: "relay.Call"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Call.ts"
---
# `userEvent`

Emit a custom user-defined event on the call for your webhooks.

## Signature

```typescript
userEvent(
  options: { event?: string } & Record<string, unknown> = {}
): Promise<Record<string, unknown>>
```

## Parameters

| Name      | Type                                           | Required | Default | Description                                                                                                            |
| --------- | ---------------------------------------------- | -------- | ------- | ---------------------------------------------------------------------------------------------------------------------- |
| `options` | `{ event?: string } & Record<string, unknown>` | yes      | `{}`    | Freeform event payload. Set `options.event` for the event name and include any additional fields your webhook expects. |

## Returns

`Promise<Record<string, unknown>>` — The platform's user\_event response.

## Throws

- When the user\_event command is rejected.

## Source

[`src/relay/Call.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Call.ts)

Line 1216.

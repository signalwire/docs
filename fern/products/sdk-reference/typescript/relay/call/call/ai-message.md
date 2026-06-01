---
slug: "/reference/typescript/relay/call/call/ai-message"
title: "aiMessage"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "relay.Call.Call.aiMessage"
  parent: "relay.Call.Call"
  module: "relay.Call"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Call.ts"
---
# `aiMessage`

Send a message into an active AI agent session.

## Signature

```typescript
aiMessage(options: { ...4 fields } = {}): Promise<Record<string, unknown>>
```

## Parameters

| Name                  | Type                                                                                                             | Required | Default | Description                                            |
| --------------------- | ---------------------------------------------------------------------------------------------------------------- | -------- | ------- | ------------------------------------------------------ |
| `options`             | `{ globalData?: Record<string, unknown>; messageText?: string; reset?: Record<string, unknown>; role?: string }` | yes      | `{}`    | Message parameters.                                    |
| `options.globalData`  | `Record<string, unknown>`                                                                                        | no       | —       | Global-data updates to merge.                          |
| `options.messageText` | `string`                                                                                                         | no       | —       | Text content to inject into the conversation.          |
| `options.reset`       | `Record<string, unknown>`                                                                                        | no       | —       | Reset directives for the conversation state.           |
| `options.role`        | `string`                                                                                                         | no       | —       | Speaker role (`"system"`, `"user"`, or `"assistant"`). |

## Returns

`Promise<Record<string, unknown>>` — The platform's ai\_message response.

## Throws

- When the ai\_message command is rejected.

## Source

[`src/relay/Call.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Call.ts)

Line 1162.

---
slug: "/reference/typescript/relay/call/call/ai-hold"
title: "aiHold"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "relay.Call.Call.aiHold"
  parent: "relay.Call.Call"
  module: "relay.Call"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Call.ts"
---
# `aiHold`

Put the AI agent session on hold (pause turn-taking).

## Signature

```typescript
aiHold(options: { ...2 fields } = {}): Promise<Record<string, unknown>>
```

## Parameters

| Name              | Type                                    | Required | Default | Description                                  |
| ----------------- | --------------------------------------- | -------- | ------- | -------------------------------------------- |
| `options`         | `{ prompt?: string; timeout?: string }` | yes      | `{}`    | Hold behaviour.                              |
| `options.prompt`  | `string`                                | no       | —       | Prompt played to the caller during the hold. |
| `options.timeout` | `string`                                | no       | —       | Maximum hold duration.                       |

## Returns

`Promise<Record<string, unknown>>` — The platform's ai\_hold response.

## Throws

- When the ai\_hold command is rejected.

## Source

[`src/relay/Call.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Call.ts)

Line 1185.

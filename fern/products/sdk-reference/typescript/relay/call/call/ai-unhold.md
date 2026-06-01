---
slug: "/reference/typescript/relay/call/call/ai-unhold"
title: "aiUnhold"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "relay.Call.Call.aiUnhold"
  parent: "relay.Call.Call"
  module: "relay.Call"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Call.ts"
---
# `aiUnhold`

Resume an AI agent session from hold.

## Signature

```typescript
aiUnhold(options: { ...1 fields } = {}): Promise<Record<string, unknown>>
```

## Parameters

| Name             | Type                  | Required | Default | Description                            |
| ---------------- | --------------------- | -------- | ------- | -------------------------------------- |
| `options`        | `{ prompt?: string }` | yes      | `{}`    | Unhold behaviour.                      |
| `options.prompt` | `string`              | no       | —       | Prompt played to the caller on resume. |

## Returns

`Promise<Record<string, unknown>>` — The platform's ai\_unhold response.

## Throws

- When the ai\_unhold command is rejected.

## Source

[`src/relay/Call.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Call.ts)

Line 1200.

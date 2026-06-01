---
slug: "/reference/typescript/relay/call/call/amazon-bedrock"
title: "amazonBedrock"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "relay.Call.Call.amazonBedrock"
  parent: "relay.Call.Call"
  module: "relay.Call"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Call.ts"
---
# `amazonBedrock`

Connect the call to an Amazon Bedrock AI agent.

## Signature

```typescript
amazonBedrock(options: { ...6 fields } = {}): Promise<Record<string, unknown>>
```

## Parameters

| Name                    | Type                                                                                                                                                                                            | Required | Default | Description                                      |
| ----------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- | ------- | ------------------------------------------------ |
| `options`               | `{ aiParams?: Record<string, unknown>; globalData?: Record<string, unknown>; postPrompt?: Record<string, unknown>; postPromptUrl?: string; prompt?: unknown; SWAIG?: Record<string, unknown> }` | yes      | `{}`    | Bedrock agent configuration.                     |
| `options.aiParams`      | `Record<string, unknown>`                                                                                                                                                                       | no       | —       | AI engine parameters.                            |
| `options.globalData`    | `Record<string, unknown>`                                                                                                                                                                       | no       | —       | Global-data object available to SWAIG tools.     |
| `options.postPrompt`    | `Record<string, unknown>`                                                                                                                                                                       | no       | —       | Post-prompt configuration.                       |
| `options.postPromptUrl` | `string`                                                                                                                                                                                        | no       | —       | URL to POST the final summary to.                |
| `options.prompt`        | `unknown`                                                                                                                                                                                       | no       | —       | Prompt to send to the Bedrock agent.             |
| `options.SWAIG`         | `Record<string, unknown>`                                                                                                                                                                       | no       | —       | SWAIG configuration (functions, includes, etc.). |

## Returns

`Promise<Record<string, unknown>>` — The platform's amazon\_bedrock response.

## Throws

- When the amazon\_bedrock command is rejected.

## Source

[`src/relay/Call.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Call.ts)

Line 1133.

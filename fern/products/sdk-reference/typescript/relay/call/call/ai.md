---
slug: "/reference/typescript/relay/call/call/ai"
title: "ai"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "relay.Call.Call.ai"
  parent: "relay.Call.Call"
  module: "relay.Call"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Call.ts"
---
# `ai`

Start an AI agent session on the call.

## Signature

```typescript
ai(options: { ...14 fields } = {}): Promise<AIAction>
```

## Parameters

| Name                             | Type                                                                                                                                                                                                                                                                                                                                                                                                                                               | Required | Default | Description                                                |
| -------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- | ------- | ---------------------------------------------------------- |
| `options`                        | `{ agent?: string; aiParams?: Record<string, unknown>; controlId?: string; globalData?: Record<string, unknown>; hints?: string[]; languages?: Record<string, unknown>[]; onCompleted?: CompletedCallback; postPrompt?: Record<string, unknown>; postPromptAuthPassword?: string; postPromptAuthUser?: string; postPromptUrl?: string; prompt?: Record<string, unknown>; pronounce?: Record<string, unknown>[]; SWAIG?: Record<string, unknown> }` | yes      | `{}`    | AI configuration — prompts, voices, tools, languages, etc. |
| `options.agent`                  | `string`                                                                                                                                                                                                                                                                                                                                                                                                                                           | no       | —       | —                                                          |
| `options.aiParams`               | `Record<string, unknown>`                                                                                                                                                                                                                                                                                                                                                                                                                          | no       | —       | —                                                          |
| `options.controlId`              | `string`                                                                                                                                                                                                                                                                                                                                                                                                                                           | no       | —       | —                                                          |
| `options.globalData`             | `Record<string, unknown>`                                                                                                                                                                                                                                                                                                                                                                                                                          | no       | —       | —                                                          |
| `options.hints`                  | `string[]`                                                                                                                                                                                                                                                                                                                                                                                                                                         | no       | —       | —                                                          |
| `options.languages`              | `Record<string, unknown>[]`                                                                                                                                                                                                                                                                                                                                                                                                                        | no       | —       | —                                                          |
| `options.onCompleted`            | `CompletedCallback`                                                                                                                                                                                                                                                                                                                                                                                                                                | no       | —       | —                                                          |
| `options.postPrompt`             | `Record<string, unknown>`                                                                                                                                                                                                                                                                                                                                                                                                                          | no       | —       | —                                                          |
| `options.postPromptAuthPassword` | `string`                                                                                                                                                                                                                                                                                                                                                                                                                                           | no       | —       | —                                                          |
| `options.postPromptAuthUser`     | `string`                                                                                                                                                                                                                                                                                                                                                                                                                                           | no       | —       | —                                                          |
| `options.postPromptUrl`          | `string`                                                                                                                                                                                                                                                                                                                                                                                                                                           | no       | —       | —                                                          |
| `options.prompt`                 | `Record<string, unknown>`                                                                                                                                                                                                                                                                                                                                                                                                                          | no       | —       | —                                                          |
| `options.pronounce`              | `Record<string, unknown>[]`                                                                                                                                                                                                                                                                                                                                                                                                                        | no       | —       | —                                                          |
| `options.SWAIG`                  | `Record<string, unknown>`                                                                                                                                                                                                                                                                                                                                                                                                                          | no       | —       | —                                                          |

## Returns

`Promise<AIAction>` — An [AIAction](/reference/typescript/relay/action/ai-action) for control and completion tracking.

## Throws

- When the ai command is rejected.

## Source

[`src/relay/Call.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Call.ts)

Line 1086.

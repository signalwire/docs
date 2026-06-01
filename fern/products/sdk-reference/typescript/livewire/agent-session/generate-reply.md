---
slug: "/reference/typescript/livewire/agent-session/generate-reply"
title: "generateReply"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "livewire.AgentSession.generateReply"
  parent: "livewire.AgentSession"
  module: "livewire"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/livewire/index.ts"
---
# `generateReply`

Trigger the agent to generate a reply, optionally with extra instructions.

## Signature

```typescript
generateReply(options?: { ...1 fields }): void
```

## Parameters

| Name                   | Type                        | Required | Default | Description                                                                   |
| ---------------------- | --------------------------- | -------- | ------- | ----------------------------------------------------------------------------- |
| `options`              | `{ instructions?: string }` | no       | —       | Generation options.                                                           |
| `options.instructions` | `string`                    | no       | —       | Extra instructions injected as a new prompt section before the next LLM turn. |

## Returns

`void`

## Source

[`src/livewire/index.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/livewire/index.ts)

Line 619.

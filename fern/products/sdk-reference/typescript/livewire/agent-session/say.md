---
slug: "/reference/typescript/livewire/agent-session/say"
title: "say"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "livewire.AgentSession.say"
  parent: "livewire.AgentSession"
  module: "livewire"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/livewire/index.ts"
---
# `say`

Queue text to be spoken by the agent.

Before [start](/reference/typescript/livewire/agent-session/start) is called, text is buffered and injected at start
time as the agent's initial greeting. After start, text is added as an
additional prompt section.

## Signature

```typescript
say(text: string): void
```

## Parameters

| Name   | Type     | Required | Default | Description                  |
| ------ | -------- | -------- | ------- | ---------------------------- |
| `text` | `string` | yes      | —       | Line for the agent to speak. |

## Returns

`void`

## Source

[`src/livewire/index.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/livewire/index.ts)

Line 602.

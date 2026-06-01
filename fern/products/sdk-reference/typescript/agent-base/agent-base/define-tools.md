---
slug: "/reference/typescript/agent-base/agent-base/define-tools"
title: "defineTools"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "AgentBase.AgentBase.defineTools"
  parent: "AgentBase.AgentBase"
  module: "AgentBase"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts"
  visibility: "protected"
---
# `defineTools`

Lifecycle method to register tools. Subclasses should call this at the
end of their own constructor (after all fields are initialized).
Not called automatically — call `this.defineTools()` explicitly.

## Signature

```typescript
defineTools(): void
```

## Returns

`void`

## Source

[`src/AgentBase.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts)

Line 358.

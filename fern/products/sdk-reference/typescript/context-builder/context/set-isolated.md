---
slug: "/reference/typescript/context-builder/context/set-isolated"
title: "setIsolated"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "ContextBuilder.Context.setIsolated"
  parent: "ContextBuilder.Context"
  module: "ContextBuilder"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/ContextBuilder.ts"
---
# `setIsolated`

Mark this context as isolated — entering it wipes conversation history.

When `isolated=true` and the context is entered via change\_context, the
runtime wipes the conversation array. The model starts fresh with only
the new context's systemPrompt + step instructions, with no memory of
prior turns.

EXCEPTION — `reset` overrides the wipe:
If the context also has a `reset` configuration (via consolidate or
full\_reset), the wipe is skipped in favor of the reset behavior. Use
reset with consolidate=true to summarize prior history into a single
message instead of dropping it entirely.

Use cases:

- Switching to a sensitive billing flow that should not see prior
  small-talk
- Handing off to a different agent persona
- Resetting after a long off-topic detour

## Signature

```typescript
setIsolated(isolated: boolean): this
```

## Parameters

| Name       | Type      | Required | Default | Description                                                                                |
| ---------- | --------- | -------- | ------- | ------------------------------------------------------------------------------------------ |
| `isolated` | `boolean` | yes      | —       | True to wipe conversation history on context entry (subject to the reset exception above). |

## Returns

`this` — This context for chaining.

## Source

[`src/ContextBuilder.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/ContextBuilder.ts)

Line 699.

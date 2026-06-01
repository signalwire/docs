---
slug: "/reference/typescript/context-builder"
title: "ContextBuilder"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "module"
  language: "typescript"
  qualified_name: "ContextBuilder"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/ContextBuilder.ts"
---
# `ContextBuilder`

## Signature

```typescript
module ContextBuilder
```

## Constants

| Name                         | Type                  | Required | Default | Description                                                                                                                                                                                                                                                                                                               |
| ---------------------------- | --------------------- | -------- | ------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `RESERVED_NATIVE_TOOL_NAMES` | `ReadonlySet<string>` | yes      | —       | Reserved tool names auto-injected by the runtime when contexts/steps are present. User-defined SWAIG tools must not collide with these names. ContextBuilder.validate() rejects any agent that registers a user tool sharing one of these names — the runtime would never call the user tool because the native one wins. |

## Functions

- [`createSimpleContext`](/reference/typescript/context-builder/create-simple-context) — Creates a standalone Context instance without a ContextBuilder.

## Classes

- [`Context`](/reference/typescript/context-builder/context) — A named context containing ordered steps, prompt configuration, and navigation rules.
- [`ContextBuilder`](/reference/typescript/context-builder/context-builder) — Builder for multi-step, multi-context AI agent workflows.
- [`GatherInfo`](/reference/typescript/context-builder/gather-info) — Collects structured information from the user through a series of questions.
- [`GatherQuestion`](/reference/typescript/context-builder/gather-question) — Represents a single question within a gather operation.
- [`Step`](/reference/typescript/context-builder/step) — A single step within a context, with prompt content, criteria, function restrictions, and navigation rules.

## Source

[`src/ContextBuilder.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/ContextBuilder.ts)

Line 1.

---
slug: "/reference/typescript/agent-base/agent-base/add-language"
title: "addLanguage"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "AgentBase.AgentBase.addLanguage"
  parent: "AgentBase.AgentBase"
  module: "AgentBase"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts"
---
# `addLanguage`

Add a supported language to the AI configuration.

## Signature

```typescript
addLanguage(config: LanguageConfig): this
```

## Parameters

| Name     | Type             | Required | Default | Description                                                                                                                                                                                                                                                                                                                                  |
| -------- | ---------------- | -------- | ------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `config` | `LanguageConfig` | yes      | —       | Language configuration including name, code, voice, and optional fillers. `params` may be set to attach engine-specific tuning (voice stability, similarity boost, model knobs, etc.); only emitted into SWML when non-empty so existing entries stay byte-identical when no params are passed (Python ai\_config\_mixin.py `add_language`). |

## Returns

`this` — This agent instance for chaining.

## Source

[`src/AgentBase.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts)

Line 693.

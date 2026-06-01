---
slug: "/reference/typescript/types/language-config"
title: "LanguageConfig"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "interface"
  language: "typescript"
  qualified_name: "types.LanguageConfig"
  parent: "types"
  module: "types"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/types.ts"
---
# `LanguageConfig`

Configuration for a supported language in the AI agent.

## Signature

```typescript
interface LanguageConfig
```

## Properties

| Name              | Type                                       | Required | Default | Description                                                                                                                                                                                                                                                    |
| ----------------- | ------------------------------------------ | -------- | ------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `code`            | `string`                                   | yes      | —       | BCP-47 language code (e.g. "en-US").                                                                                                                                                                                                                           |
| `engine`          | `string`                                   | no       | —       | TTS engine identifier.                                                                                                                                                                                                                                         |
| `fillers`         | `Record<string, string[]>`                 | no       | —       | Filler phrases keyed by category for this language.                                                                                                                                                                                                            |
| `functionFillers` | `Record<string, Record<string, string[]>>` | no       | —       | Per-function filler phrases, keyed by function name then language code.                                                                                                                                                                                        |
| `name`            | `string`                                   | yes      | —       | Human-readable language name (e.g. "English").                                                                                                                                                                                                                 |
| `params`          | `Record<string, unknown>`                  | no       | —       | Optional per-language params dict (engine-specific tuning, voice settings, etc.). Emitted as the language object's `params` key in SWML — only present in the wire payload when non-empty so existing entries remain byte-identical when no params are passed. |
| `speechModel`     | `string`                                   | no       | —       | Speech recognition model identifier.                                                                                                                                                                                                                           |
| `voice`           | `string`                                   | no       | —       | Voice identifier to use for this language.                                                                                                                                                                                                                     |

## Source

[`src/types.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/types.ts)

Line 98.

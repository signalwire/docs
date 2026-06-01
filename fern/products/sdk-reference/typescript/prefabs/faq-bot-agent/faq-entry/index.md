---
slug: "/reference/typescript/prefabs/faq-bot-agent/faq-entry"
title: "FAQEntry"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "interface"
  language: "typescript"
  qualified_name: "prefabs.FAQBotAgent.FAQEntry"
  parent: "prefabs.FAQBotAgent"
  module: "prefabs.FAQBotAgent"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/prefabs/FAQBotAgent.ts"
---
# `FAQEntry`

A single frequently-asked-question entry consumed by [FAQBotAgent](/reference/typescript/prefabs/faq-bot-agent/faq-bot-agent).

## Signature

```typescript
interface FAQEntry
```

## Properties

| Name         | Type       | Required | Default | Description                                                             |
| ------------ | ---------- | -------- | ------- | ----------------------------------------------------------------------- |
| `answer`     | `string`   | yes      | —       | The answer to provide when this FAQ matches.                            |
| `categories` | `string[]` | no       | —       | Taxonomy categories this FAQ belongs to (used for filtering and hints). |
| `keywords`   | `string[]` | no       | —       | Additional keywords to boost matching accuracy.                         |
| `question`   | `string`   | yes      | —       | The representative question text.                                       |

## Source

[`src/prefabs/FAQBotAgent.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/prefabs/FAQBotAgent.ts)

Line 18.

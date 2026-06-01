---
slug: "/reference/typescript/prefabs/faq-bot-agent/faq-bot-config"
title: "FAQBotConfig"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "interface"
  language: "typescript"
  qualified_name: "prefabs.FAQBotAgent.FAQBotConfig"
  parent: "prefabs.FAQBotAgent"
  module: "prefabs.FAQBotAgent"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/prefabs/FAQBotAgent.ts"
---
# `FAQBotConfig`

Configuration for the [FAQBotAgent](/reference/typescript/prefabs/faq-bot-agent/faq-bot-agent).

## Signature

```typescript
interface FAQBotConfig
```

## Properties

| Name                | Type                    | Required | Default | Description                                                                             |
| ------------------- | ----------------------- | -------- | ------- | --------------------------------------------------------------------------------------- |
| `agentOptions`      | `Partial<AgentOptions>` | no       | —       | Additional AgentBase options forwarded to super().                                      |
| `escalationMessage` | `string`                | no       | —       | Message spoken when no FAQ matches the query.                                           |
| `escalationNumber`  | `string`                | no       | —       | Phone number to transfer to on escalation. If not set, escalate tool is not registered. |
| `faqs`              | `FAQEntry[]`            | yes      | —       | List of FAQ entries for the knowledge base.                                             |
| `name`              | `string`                | no       | —       | Agent display name (defaults to `"faq_bot"`).                                           |
| `persona`           | `string`                | no       | —       | Custom personality description for the agent's "Personality" prompt section.            |
| `route`             | `string`                | no       | —       | HTTP route for this agent (defaults to `"/faq"`).                                       |
| `suggestRelated`    | `boolean`               | no       | —       | Whether to suggest related questions alongside a match. Default `true`.                 |
| `threshold`         | `number`                | no       | —       | Minimum match score (0-1) for an FAQ to be considered a match. Default 0.5.             |

## Source

[`src/prefabs/FAQBotAgent.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/prefabs/FAQBotAgent.ts)

Line 30.

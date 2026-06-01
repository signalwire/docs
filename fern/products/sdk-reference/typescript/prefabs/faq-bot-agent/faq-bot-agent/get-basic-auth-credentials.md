---
slug: "/reference/typescript/prefabs/faq-bot-agent/faq-bot-agent/get-basic-auth-credentials"
title: "getBasicAuthCredentials"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "prefabs.FAQBotAgent.FAQBotAgent.getBasicAuthCredentials"
  parent: "prefabs.FAQBotAgent.FAQBotAgent"
  module: "prefabs.FAQBotAgent"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts"
---
# `getBasicAuthCredentials`

Get the basic-auth credentials used by this agent.

## Signature

**Overload 1**

```typescript
getBasicAuthCredentials(includeSource?: false): [string, string]
```

**Overload 2**

```typescript
getBasicAuthCredentials(
  includeSource: true
): [string, string, "provided" | "environment" | "generated"]
```

## Parameters (Overload 1)

| Name            | Type    | Required | Default | Description                                                              |
| --------------- | ------- | -------- | ------- | ------------------------------------------------------------------------ |
| `includeSource` | `false` | no       | —       | When true, a third element indicating the credential source is appended. |

## Parameters (Overload 2)

| Name            | Type   | Required | Default | Description                                                              |
| --------------- | ------ | -------- | ------- | ------------------------------------------------------------------------ |
| `includeSource` | `true` | yes      | —       | When true, a third element indicating the credential source is appended. |

## Returns (Overload 1)

`[string, string]` — A tuple of \[username, password] or \[username, password, source].

## Returns (Overload 2)

`[string, string, "provided" | "environment" | "generated"]` — A tuple of \[username, password] or \[username, password, source].

## Source

[`src/AgentBase.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts)

Line 2775.

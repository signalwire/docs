---
slug: "/reference/typescript/rest/namespaces/phone-numbers/phone-numbers-resource/set-ai-agent"
title: "setAiAgent"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.phone-numbers.PhoneNumbersResource.setAiAgent"
  parent: "rest.namespaces.phone-numbers.PhoneNumbersResource"
  module: "rest.namespaces.phone-numbers"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/phone-numbers.ts"
---
# `setAiAgent`

Route inbound calls to an AI Agent Fabric resource by ID.

## Signature

```typescript
setAiAgent(
  resourceId: string,
  agentId: string,
  extra: Record<string, unknown> = {}
): Promise<any>
```

## Parameters

| Name         | Type                      | Required | Default | Description                                        |
| ------------ | ------------------------- | -------- | ------- | -------------------------------------------------- |
| `resourceId` | `string`                  | yes      | —       | Unique phone-number resource ID.                   |
| `agentId`    | `string`                  | yes      | —       | AI agent Fabric resource ID.                       |
| `extra`      | `Record<string, unknown>` | yes      | `{}`    | Additional wire-level fields merged into the body. |

## Returns

`Promise<any>` — The updated phone-number resource.

## Source

[`src/rest/namespaces/phone-numbers.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/phone-numbers.ts)

Line 227.

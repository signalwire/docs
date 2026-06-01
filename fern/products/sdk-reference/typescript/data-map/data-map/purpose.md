---
slug: "/reference/typescript/data-map/data-map/purpose"
title: "purpose"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "DataMap.DataMap.purpose"
  parent: "DataMap.DataMap"
  module: "DataMap"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/DataMap.ts"
---
# `purpose`

Set the purpose (description) for this data-map tool — READ BY THE LLM.

This string is rendered into the OpenAI tool schema `description`
field and sent to the model on every turn. The model uses it to
decide WHEN to call this tool. It is **prompt engineering**, not
developer documentation.

A vague `purpose()` is the #1 cause of "the model has the right tool
but doesn't call it" failures with data-map tools.

### Bad vs good

```text
BAD : .purpose('weather api')
GOOD: .purpose('Get the current weather conditions and forecast for
a specific city. Use this whenever the user asks about weather,
temperature, rain, or similar conditions in a named location.')
```

## Signature

```typescript
purpose(description: string): this
```

## Parameters

| Name          | Type     | Required | Default | Description                                               |
| ------------- | -------- | -------- | ------- | --------------------------------------------------------- |
| `description` | `string` | yes      | —       | Prompt-engineering description of when to call this tool. |

## Returns

`this` — This instance for chaining.

## Source

[`src/DataMap.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/DataMap.ts)

Line 160.

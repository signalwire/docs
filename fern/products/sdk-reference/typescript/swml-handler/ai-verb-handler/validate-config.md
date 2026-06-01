---
slug: "/reference/typescript/swml-handler/ai-verb-handler/validate-config"
title: "validateConfig"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "SWMLHandler.AIVerbHandler.validateConfig"
  parent: "SWMLHandler.AIVerbHandler"
  module: "SWMLHandler"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/SWMLHandler.ts"
---
# `validateConfig`

Validate the configuration for the AI verb.

Checks that:

- `prompt` is present and is an object
- `prompt` contains exactly one of `text` or `pom` (mutually exclusive)
- `prompt.contexts`, if present, is an object
- `SWAIG`, if present, is an object

## Signature

```typescript
validateConfig(config: Record<string, unknown>): [boolean, string[]]
```

## Parameters

| Name     | Type                      | Required | Default | Description                                   |
| -------- | ------------------------- | -------- | ------- | --------------------------------------------- |
| `config` | `Record<string, unknown>` | yes      | —       | The configuration dictionary for the AI verb. |

## Returns

`[boolean, string[]]` — A \[isValid, errorMessages] tuple.

## Source

[`src/SWMLHandler.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/SWMLHandler.ts)

Line 106.

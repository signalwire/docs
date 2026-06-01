---
slug: "/reference/typescript/swml-service/swml-verb-handler/validate-config"
title: "validateConfig"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "SWMLService.SWMLVerbHandler.validateConfig"
  parent: "SWMLService.SWMLVerbHandler"
  module: "SWMLService"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/SWMLService.ts"
---
# `validateConfig`

Validate a verb configuration. Returns \[isValid, errorMessages].

## Signature

```typescript
validateConfig(config: Record<string, unknown>): [boolean, string[]]
```

## Parameters

| Name     | Type                      | Required | Default | Description |
| -------- | ------------------------- | -------- | ------- | ----------- |
| `config` | `Record<string, unknown>` | yes      | —       | —           |

## Returns

`[boolean, string[]]`

## Source

[`src/SWMLService.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/SWMLService.ts)

Line 32.

---
slug: "/reference/typescript/swaig-function/swaig-function/execute"
title: "execute"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "SwaigFunction.SwaigFunction.execute"
  parent: "SwaigFunction.SwaigFunction"
  module: "SwaigFunction"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/SwaigFunction.ts"
---
# `execute`

Invoke the handler with the given arguments and return a serialized result.

## Signature

```typescript
execute(
  args: Record<string, unknown>,
  rawData?: Record<string, unknown>
): Promise<Record<string, unknown>>
```

## Parameters

| Name      | Type                      | Required | Default | Description                   |
| --------- | ------------------------- | -------- | ------- | ----------------------------- |
| `args`    | `Record<string, unknown>` | yes      | —       | Parsed arguments from the AI. |
| `rawData` | `Record<string, unknown>` | no       | —       | The full raw request payload. |

## Returns

`Promise<Record<string, unknown>>` — A serialized result dictionary suitable for the SWAIG response.

## Source

[`src/SwaigFunction.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/SwaigFunction.ts)

Line 213.

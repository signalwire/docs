---
slug: "/reference/typescript/swaig-function/swaig-handler"
title: "SwaigHandler"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "type_alias"
  language: "typescript"
  qualified_name: "SwaigFunction.SwaigHandler"
  parent: "SwaigFunction"
  module: "SwaigFunction"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/SwaigFunction.ts"
---
# `SwaigHandler`

Handler function for a SWAIG tool invocation.

## Signature

```typescript
type SwaigHandler = (args: Record<string, unknown>, rawData: Record<string, unknown>) => FunctionResult | Record<string, unknown> | string | Promise<FunctionResult | Record<string, unknown> | string>
```

## Source

[`src/SwaigFunction.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/SwaigFunction.ts)

Line 19.

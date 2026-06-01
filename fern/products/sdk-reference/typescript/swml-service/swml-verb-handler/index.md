---
slug: "/reference/typescript/swml-service/swml-verb-handler"
title: "SWMLVerbHandler"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "interface"
  language: "typescript"
  qualified_name: "SWMLService.SWMLVerbHandler"
  parent: "SWMLService"
  module: "SWMLService"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/SWMLService.ts"
---
# `SWMLVerbHandler`

Interface for custom SWML verb handlers.
Mirrors Python SDK's `SWMLVerbHandler` abstract base class.

## Signature

```typescript
interface SWMLVerbHandler
```

## Methods

- [`buildConfig`](/reference/typescript/swml-service/swml-verb-handler/build-config) — Build a verb configuration from keyword arguments.
- [`getVerbName`](/reference/typescript/swml-service/swml-verb-handler/get-verb-name) — Return the verb name this handler manages.
- [`validateConfig`](/reference/typescript/swml-service/swml-verb-handler/validate-config) — Validate a verb configuration. Returns \[isValid, errorMessages].

## Source

[`src/SWMLService.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/SWMLService.ts)

Line 28.

---
slug: "/reference/typescript/swml-handler/swml-verb-handler"
title: "SWMLVerbHandler"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "class"
  language: "typescript"
  qualified_name: "SWMLHandler.SWMLVerbHandler"
  parent: "SWMLHandler"
  module: "SWMLHandler"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/SWMLHandler.ts"
---
# `SWMLVerbHandler`

Abstract base class for pluggable SWML verb handlers.

Each concrete handler owns one verb name and provides validate/build
logic for that verb's configuration. Subclass this to create handlers
for custom or complex SWML verbs that require specialized handling
beyond generic schema-driven validation.

**Modifiers:** `abstract`

## Signature

```typescript
class SWMLVerbHandler
```

## Examples

```typescript
class MyVerbHandler extends SWMLVerbHandler {
  getVerbName(): string { return 'my_verb'; }
  validateConfig(config: Record<string, unknown>): [boolean, string[]] {
    const errors: string[] = [];
    if (!config['url']) errors.push("Missing required field 'url'");
    return [errors.length === 0, errors];
  }
  buildConfig(opts: Record<string, unknown>): Record<string, unknown> {
    return { url: opts['url'] };
  }
}
```

## Methods

- [`buildConfig`](/reference/typescript/swml-handler/swml-verb-handler/build-config) — Build a configuration object for this verb from the provided arguments.
- [`constructor`](/reference/typescript/swml-handler/swml-verb-handler/constructor)
- [`getVerbName`](/reference/typescript/swml-handler/swml-verb-handler/get-verb-name) — Get the name of the SWML verb this handler handles.
- [`validateConfig`](/reference/typescript/swml-handler/swml-verb-handler/validate-config) — Validate the configuration for this verb.

## Source

[`src/SWMLHandler.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/SWMLHandler.ts)

Line 43.

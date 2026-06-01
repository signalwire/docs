---
slug: "/reference/typescript/swml-handler/verb-handler-registry"
title: "VerbHandlerRegistry"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "class"
  language: "typescript"
  qualified_name: "SWMLHandler.VerbHandlerRegistry"
  parent: "SWMLHandler"
  module: "SWMLHandler"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/SWMLHandler.ts"
---
# `VerbHandlerRegistry`

Registry for SWML verb handlers.

This class maintains a registry of handlers for special SWML verbs
and provides methods for accessing and using them. The "ai" verb handler
([AIVerbHandler](/reference/typescript/swml-handler/ai-verb-handler)) is registered automatically on construction.

## Signature

```typescript
class VerbHandlerRegistry
```

## Examples

```typescript
const registry = new VerbHandlerRegistry();

// The "ai" handler is already registered
registry.hasHandler('ai'); // true

// Register a custom handler
registry.registerHandler(new MyCustomVerbHandler());

// Look up a handler
const handler = registry.getHandler('ai');
if (handler) {
  const [valid, errors] = handler.validateConfig(config);
}
```

## Methods

- [`constructor`](/reference/typescript/swml-handler/verb-handler-registry/constructor) — Initialize the registry with default handlers.
- [`getHandler`](/reference/typescript/swml-handler/verb-handler-registry/get-handler) — Get the handler for a specific verb.
- [`hasHandler`](/reference/typescript/swml-handler/verb-handler-registry/has-handler) — Check if a handler exists for a specific verb.
- [`registerHandler`](/reference/typescript/swml-handler/verb-handler-registry/register-handler) — Register a new verb handler, replacing any existing handler for the same verb name.

## Source

[`src/SWMLHandler.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/SWMLHandler.ts)

Line 263.

---
slug: "/reference/typescript/schema-utils/schema-utils"
title: "SchemaUtils"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "class"
  language: "typescript"
  qualified_name: "SchemaUtils.SchemaUtils"
  parent: "SchemaUtils"
  module: "SchemaUtils"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/SchemaUtils.ts"
---
# `SchemaUtils`

Validates SWML documents against structural rules with an LRU-style result cache.

## Signature

```typescript
class SchemaUtils
```

## Methods

- [`clearCache`](/reference/typescript/schema-utils/schema-utils/clear-cache) — Clear the validation cache
- [`constructor`](/reference/typescript/schema-utils/schema-utils/constructor) — Create a SchemaUtils instance.
- [`getCacheSize`](/reference/typescript/schema-utils/schema-utils/get-cache-size) — Get the number of cached validation results.
- [`getVerbDescription`](/reference/typescript/schema-utils/schema-utils/get-verb-description) — Get the description text for a verb.
- [`getVerbNames`](/reference/typescript/schema-utils/schema-utils/get-verb-names) — Get all verb names defined in the schema.
- [`getVerbProperties`](/reference/typescript/schema-utils/schema-utils/get-verb-properties) — Get the inner properties schema for a specific verb. For example, for "hangup" this returns `{ type: "object", properties: { reason: ... }, ... }`.
- [`getVerbRequiredProperties`](/reference/typescript/schema-utils/schema-utils/get-verb-required-properties) — Get the required properties for a verb's inner config.
- [`hasVerb`](/reference/typescript/schema-utils/schema-utils/has-verb) — Check if a verb name is defined in the schema.
- [`validate`](/reference/typescript/schema-utils/schema-utils/validate) — Validate a SWML document against structural rules.
- [`validateVerb`](/reference/typescript/schema-utils/schema-utils/validate-verb) — Lightweight validation of a verb config against the schema. Checks that the verb exists and required properties are present. Mirrors Python SDK's `_validate_verb_lightweight()`.

## Source

[`src/SchemaUtils.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/SchemaUtils.ts)

Line 34.

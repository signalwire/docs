---
slug: "/reference/typescript/rest/namespaces/lookup/lookup-resource"
title: "LookupResource"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "class"
  language: "typescript"
  qualified_name: "rest.namespaces.lookup.LookupResource"
  parent: "rest.namespaces.lookup"
  module: "rest.namespaces.lookup"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/lookup.ts"
---
# `LookupResource`

Phone number lookup (carrier, CNAM).

Access via `client.lookup.*`.

## Signature

```typescript
class LookupResource extends BaseResource
```

## Inheritance

**Extends:** `BaseResource`

## Examples

```typescript
const info = await client.lookup.phoneNumber('+15551234567', { include: 'carrier,caller-name' });
```

## Methods

- [`constructor`](/reference/typescript/rest/namespaces/lookup/lookup-resource/constructor)
- [`phoneNumber`](/reference/typescript/rest/namespaces/lookup/lookup-resource/phone-number) — Look up carrier and CNAM information for a phone number.

## Source

[`src/rest/namespaces/lookup.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/lookup.ts)

Line 21.

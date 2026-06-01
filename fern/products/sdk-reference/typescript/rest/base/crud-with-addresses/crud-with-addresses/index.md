---
slug: "/reference/typescript/rest/base/crud-with-addresses/crud-with-addresses"
title: "CrudWithAddresses"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "class"
  language: "typescript"
  qualified_name: "rest.base.CrudWithAddresses.CrudWithAddresses"
  parent: "rest.base.CrudWithAddresses"
  module: "rest.base.CrudWithAddresses"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/base/CrudWithAddresses.ts"
---
# `CrudWithAddresses`

[CrudResource](/reference/typescript/rest/base/crud-resource) extended with a `listAddresses()` helper for resources that
have associated Address records (e.g. fabric resources).

## Signature

```typescript
class CrudWithAddresses<TList = any, TItem = any, TCreate = any, TUpdate = any> extends CrudResource<TList, TItem, TCreate, TUpdate>
```

## Type Parameters

| Name      | Type | Required | Default | Description |
| --------- | ---- | -------- | ------- | ----------- |
| `TList`   | —    | yes      | `any`   | —           |
| `TItem`   | —    | yes      | `any`   | —           |
| `TCreate` | —    | yes      | `any`   | —           |
| `TUpdate` | —    | yes      | `any`   | —           |

## Inheritance

**Extends:** `CrudResource<TList, TItem, TCreate, TUpdate>`

## Methods

- [`constructor`](/reference/typescript/rest/base/crud-with-addresses/crud-with-addresses/constructor)
- [`create`](/reference/typescript/rest/base/crud-with-addresses/crud-with-addresses/create) — Create a new resource.
- [`delete`](/reference/typescript/rest/base/crud-with-addresses/crud-with-addresses/delete) — Delete a resource by ID.
- [`get`](/reference/typescript/rest/base/crud-with-addresses/crud-with-addresses/get) — Fetch a single resource by ID.
- [`list`](/reference/typescript/rest/base/crud-with-addresses/crud-with-addresses/list) — List resources with optional query parameters.
- [`listAddresses`](/reference/typescript/rest/base/crud-with-addresses/crud-with-addresses/list-addresses) — List addresses associated with a specific resource instance.
- [`update`](/reference/typescript/rest/base/crud-with-addresses/crud-with-addresses/update) — Update a resource by ID.

## Source

[`src/rest/base/CrudWithAddresses.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/base/CrudWithAddresses.ts)

Line 15.

---
slug: "/reference/typescript/rest/base/crud-resource/crud-resource"
title: "CrudResource"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "class"
  language: "typescript"
  qualified_name: "rest.base.CrudResource.CrudResource"
  parent: "rest.base.CrudResource"
  module: "rest.base.CrudResource"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/base/CrudResource.ts"
---
# `CrudResource`

Generic CRUD resource with configurable update method.

Provides `list()`, `create()`, `get()`, `update()`, and `delete()` out of the
box — most namespace resources extend this and narrow the generic types.
`_updateMethod` may be overridden to `'PUT'` for APIs that replace instead
of patch.

## Signature

```typescript
class CrudResource<TList = any, TItem = any, TCreate = any, TUpdate = any> extends BaseResource
```

## Type Parameters

| Name      | Type | Required | Default | Description                          |
| --------- | ---- | -------- | ------- | ------------------------------------ |
| `TList`   | —    | yes      | `any`   | Type of the paginated list response. |
| `TItem`   | —    | yes      | `any`   | Type of a single resource item.      |
| `TCreate` | —    | yes      | `any`   | Request body type for `create()`.    |
| `TUpdate` | —    | yes      | `any`   | Request body type for `update()`.    |

## Inheritance

**Extends:** [BaseResource](/reference/typescript/rest/base/base-resource)

## Methods

- [`constructor`](/reference/typescript/rest/base/crud-resource/crud-resource/constructor)
- [`create`](/reference/typescript/rest/base/crud-resource/crud-resource/create) — Create a new resource.
- [`delete`](/reference/typescript/rest/base/crud-resource/crud-resource/delete) — Delete a resource by ID.
- [`get`](/reference/typescript/rest/base/crud-resource/crud-resource/get) — Fetch a single resource by ID.
- [`list`](/reference/typescript/rest/base/crud-resource/crud-resource/list) — List resources with optional query parameters.
- [`update`](/reference/typescript/rest/base/crud-resource/crud-resource/update) — Update a resource by ID.

## Source

[`src/rest/base/CrudResource.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/base/CrudResource.ts)

Line 24.

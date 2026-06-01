---
slug: "/reference/typescript/rest/base/crud-resource/crud-resource/constructor"
title: "constructor"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.base.CrudResource.CrudResource.constructor"
  parent: "rest.base.CrudResource.CrudResource"
  module: "rest.base.CrudResource"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/base/CrudResource.ts"
---
# `constructor`

## Signature

```typescript
constructor<TList, TItem, TCreate, TUpdate>(
  http: HttpClient,
  basePath: string
): CrudResource<TList, TItem, TCreate, TUpdate>
```

## Type Parameters

| Name      | Type | Required | Default | Description                          |
| --------- | ---- | -------- | ------- | ------------------------------------ |
| `TList`   | —    | yes      | `any`   | Type of the paginated list response. |
| `TItem`   | —    | yes      | `any`   | Type of a single resource item.      |
| `TCreate` | —    | yes      | `any`   | Request body type for `create()`.    |
| `TUpdate` | —    | yes      | `any`   | Request body type for `update()`.    |

## Parameters

| Name       | Type         | Required | Default | Description |
| ---------- | ------------ | -------- | ------- | ----------- |
| `http`     | `HttpClient` | yes      | —       | —           |
| `basePath` | `string`     | yes      | —       | —           |

## Returns

`CrudResource<TList, TItem, TCreate, TUpdate>`

## Source

[`src/rest/base/CrudResource.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/base/CrudResource.ts)

Line 33.

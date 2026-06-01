---
slug: "/reference/typescript/rest/base/crud-resource/crud-resource/create"
title: "create"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.base.CrudResource.CrudResource.create"
  parent: "rest.base.CrudResource.CrudResource"
  module: "rest.base.CrudResource"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/base/CrudResource.ts"
---
# `create`

Create a new resource.

## Signature

```typescript
create(body: TCreate): Promise<TItem>
```

## Parameters

| Name   | Type      | Required | Default | Description                                     |
| ------ | --------- | -------- | ------- | ----------------------------------------------- |
| `body` | `TCreate` | yes      | —       | Request body describing the resource to create. |

## Returns

`Promise<TItem>` — The newly-created resource.

## Throws

- On any non-2xx HTTP response.

## Source

[`src/rest/base/CrudResource.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/base/CrudResource.ts)

Line 55.

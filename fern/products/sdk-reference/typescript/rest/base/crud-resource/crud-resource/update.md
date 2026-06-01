---
slug: "/reference/typescript/rest/base/crud-resource/crud-resource/update"
title: "update"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.base.CrudResource.CrudResource.update"
  parent: "rest.base.CrudResource.CrudResource"
  module: "rest.base.CrudResource"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/base/CrudResource.ts"
---
# `update`

Update a resource by ID.

Uses HTTP `PATCH` by default; subclasses may set `_updateMethod = 'PUT'`
when the remote API requires a full-replacement semantics.

## Signature

```typescript
update(resourceId: string, body: TUpdate): Promise<TItem>
```

## Parameters

| Name         | Type      | Required | Default | Description                        |
| ------------ | --------- | -------- | ------- | ---------------------------------- |
| `resourceId` | `string`  | yes      | —       | Unique identifier of the resource. |
| `body`       | `TUpdate` | yes      | —       | Request body with updated fields.  |

## Returns

`Promise<TItem>` — The updated resource.

## Throws

- On any non-2xx HTTP response.

## Source

[`src/rest/base/CrudResource.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/base/CrudResource.ts)

Line 81.

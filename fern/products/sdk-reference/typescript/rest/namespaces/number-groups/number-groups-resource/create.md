---
slug: "/reference/typescript/rest/namespaces/number-groups/number-groups-resource/create"
title: "create"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.number-groups.NumberGroupsResource.create"
  parent: "rest.namespaces.number-groups.NumberGroupsResource"
  module: "rest.namespaces.number-groups"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/base/CrudResource.ts"
---
# `create`

Create a new resource.

## Signature

```typescript
create(body: any): Promise<any>
```

## Parameters

| Name   | Type  | Required | Default | Description                                     |
| ------ | ----- | -------- | ------- | ----------------------------------------------- |
| `body` | `any` | yes      | —       | Request body describing the resource to create. |

## Returns

`Promise<any>` — The newly-created resource.

## Throws

- On any non-2xx HTTP response.

## Source

[`src/rest/base/CrudResource.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/base/CrudResource.ts)

Line 55.

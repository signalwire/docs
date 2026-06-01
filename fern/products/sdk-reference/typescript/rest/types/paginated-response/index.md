---
slug: "/reference/typescript/rest/types/paginated-response"
title: "PaginatedResponse"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "interface"
  language: "typescript"
  qualified_name: "rest.types.PaginatedResponse"
  parent: "rest.types"
  module: "rest.types"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/types.ts"
---
# `PaginatedResponse`

Standard paginated response with links-based navigation (relay REST).

## Signature

```typescript
interface PaginatedResponse<T>
```

## Type Parameters

| Name | Type | Required | Default | Description |
| ---- | ---- | -------- | ------- | ----------- |
| `T`  | —    | yes      | —       | —           |

## Properties

| Name    | Type                                                              | Required | Default | Description |
| ------- | ----------------------------------------------------------------- | -------- | ------- | ----------- |
| `data`  | `T[]`                                                             | yes      | —       | —           |
| `links` | `{ first?: string; last?: string; next?: string; self?: string }` | no       | —       | —           |

## Source

[`src/rest/types.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/types.ts)

Line 41.

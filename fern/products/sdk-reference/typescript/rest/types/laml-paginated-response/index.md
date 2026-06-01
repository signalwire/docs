---
slug: "/reference/typescript/rest/types/laml-paginated-response"
title: "LamlPaginatedResponse"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "interface"
  language: "typescript"
  qualified_name: "rest.types.LamlPaginatedResponse"
  parent: "rest.types"
  module: "rest.types"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/types.ts"
---
# `LamlPaginatedResponse`

LAML-style paginated response with next\_page\_uri.

## Signature

```typescript
interface LamlPaginatedResponse<T>
```

## Type Parameters

| Name | Type | Required | Default | Description |
| ---- | ---- | -------- | ------- | ----------- |
| `T`  | —    | yes      | —       | —           |

## Properties

| Name            | Type             | Required | Default | Description |
| --------------- | ---------------- | -------- | ------- | ----------- |
| `next_page_uri` | `string \| null` | no       | —       | —           |
| `page`          | `number`         | no       | —       | —           |
| `page_size`     | `number`         | no       | —       | —           |
| `uri`           | `string`         | no       | —       | —           |

## Source

[`src/rest/types.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/types.ts)

Line 52.

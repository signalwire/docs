---
slug: "/reference/typescript/rest/namespaces/compat/compat-recordings/list"
title: "list"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.compat.CompatRecordings.list"
  parent: "rest.namespaces.compat.CompatRecordings"
  module: "rest.namespaces.compat"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/compat.ts"
---
# `list`

List recordings in the account.

## Signature

```typescript
list(params?: QueryParams): Promise<any>
```

## Parameters

| Name     | Type          | Required | Default | Description                                                                                 |
| -------- | ------------- | -------- | ------- | ------------------------------------------------------------------------------------------- |
| `params` | `QueryParams` | no       | —       | Optional filter / pagination query parameters (date range, call SID, conference SID, etc.). |

## Returns

`Promise<any>` — A paginated list of recordings.

## Throws

- On any non-2xx HTTP response.

## Source

[`src/rest/namespaces/compat.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/compat.ts)

Line 645.

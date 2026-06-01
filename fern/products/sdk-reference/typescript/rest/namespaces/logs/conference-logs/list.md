---
slug: "/reference/typescript/rest/namespaces/logs/conference-logs/list"
title: "list"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.logs.ConferenceLogs.list"
  parent: "rest.namespaces.logs.ConferenceLogs"
  module: "rest.namespaces.logs"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/logs.ts"
---
# `list`

List conference log entries.

## Signature

```typescript
list(params?: QueryParams): Promise<any>
```

## Parameters

| Name     | Type          | Required | Default | Description                                    |
| -------- | ------------- | -------- | ------- | ---------------------------------------------- |
| `params` | `QueryParams` | no       | —       | Optional filter / pagination query parameters. |

## Returns

`Promise<any>` — A paginated list of conference log entries.

## Throws

- On any non-2xx HTTP response.

## Source

[`src/rest/namespaces/logs.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/logs.ts)

Line 124.

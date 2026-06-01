---
slug: "/reference/typescript/rest/namespaces/logs/message-logs/get"
title: "get"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.logs.MessageLogs.get"
  parent: "rest.namespaces.logs.MessageLogs"
  module: "rest.namespaces.logs"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/logs.ts"
---
# `get`

Fetch a single message log entry by ID.

## Signature

```typescript
get(logId: string): Promise<any>
```

## Parameters

| Name    | Type     | Required | Default | Description                         |
| ------- | -------- | -------- | ------- | ----------------------------------- |
| `logId` | `string` | yes      | —       | Unique identifier of the log entry. |

## Returns

`Promise<any>` — The log entry record.

## Throws

- On any non-2xx HTTP response (including `404`).

## Source

[`src/rest/namespaces/logs.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/logs.ts)

Line 36.

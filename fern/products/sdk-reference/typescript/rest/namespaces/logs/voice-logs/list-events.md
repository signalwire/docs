---
slug: "/reference/typescript/rest/namespaces/logs/voice-logs/list-events"
title: "listEvents"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.logs.VoiceLogs.listEvents"
  parent: "rest.namespaces.logs.VoiceLogs"
  module: "rest.namespaces.logs"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/logs.ts"
---
# `listEvents`

List events captured during a voice log entry.

## Signature

```typescript
listEvents(logId: string, params?: QueryParams): Promise<any>
```

## Parameters

| Name     | Type          | Required | Default | Description                                    |
| -------- | ------------- | -------- | ------- | ---------------------------------------------- |
| `logId`  | `string`      | yes      | —       | Unique identifier of the log entry.            |
| `params` | `QueryParams` | no       | —       | Optional filter / pagination query parameters. |

## Returns

`Promise<any>` — A paginated list of events for the log entry.

## Throws

- On any non-2xx HTTP response.

## Source

[`src/rest/namespaces/logs.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/logs.ts)

Line 77.

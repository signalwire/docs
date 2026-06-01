---
slug: "/reference/typescript/rest/namespaces/logs/logs-namespace"
title: "LogsNamespace"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "class"
  language: "typescript"
  qualified_name: "rest.namespaces.logs.LogsNamespace"
  parent: "rest.namespaces.logs"
  module: "rest.namespaces.logs"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/logs.ts"
---
# `LogsNamespace`

Logs API namespace.

Access via `client.logs.*`. Read-only access to message, voice, fax, and
conference logs for auditing and observability.

## Signature

```typescript
class LogsNamespace
```

## Properties

| Name          | Type             | Required | Default | Description                                   |
| ------------- | ---------------- | -------- | ------- | --------------------------------------------- |
| `conferences` | `ConferenceLogs` | yes      | —       | Conference log queries.                       |
| `fax`         | `FaxLogs`        | yes      | —       | Fax log queries.                              |
| `messages`    | `MessageLogs`    | yes      | —       | SMS/MMS message log queries.                  |
| `voice`       | `VoiceLogs`      | yes      | —       | Voice call log queries with event drill-down. |

## Methods

- [`constructor`](/reference/typescript/rest/namespaces/logs/logs-namespace/constructor)

## Source

[`src/rest/namespaces/logs.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/logs.ts)

Line 135.

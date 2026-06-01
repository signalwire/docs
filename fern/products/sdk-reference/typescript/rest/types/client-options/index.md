---
slug: "/reference/typescript/rest/types/client-options"
title: "ClientOptions"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "interface"
  language: "typescript"
  qualified_name: "rest.types.ClientOptions"
  parent: "rest.types"
  module: "rest.types"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/types.ts"
---
# `ClientOptions`

Options for constructing a RestClient.

## Signature

```typescript
interface ClientOptions
```

## Properties

| Name        | Type                                                                   | Required | Default | Description                                                                                     |
| ----------- | ---------------------------------------------------------------------- | -------- | ------- | ----------------------------------------------------------------------------------------------- |
| `fetchImpl` | `(input: RequestInfo \| URL, init?: RequestInit) => Promise<Response>` | no       | —       | Custom fetch implementation for testing.                                                        |
| `host`      | `string`                                                               | no       | —       | SignalWire space host (e.g. "example.signalwire.com"). Falls back to SIGNALWIRE\_SPACE env var. |
| `project`   | `string`                                                               | no       | —       | SignalWire project ID. Falls back to SIGNALWIRE\_PROJECT\_ID env var.                           |
| `token`     | `string`                                                               | no       | —       | SignalWire API token. Falls back to SIGNALWIRE\_API\_TOKEN env var.                             |

## Source

[`src/rest/types.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/types.ts)

Line 8.

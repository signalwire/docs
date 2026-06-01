---
slug: "/reference/typescript/rest/types/http-client-options"
title: "HttpClientOptions"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "interface"
  language: "typescript"
  qualified_name: "rest.types.HttpClientOptions"
  parent: "rest.types"
  module: "rest.types"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/types.ts"
---
# `HttpClientOptions`

Options for constructing an HttpClient.

## Signature

```typescript
interface HttpClientOptions
```

## Properties

| Name        | Type                                                                   | Required | Default | Description                                                                                                                                                                                                             |
| ----------- | ---------------------------------------------------------------------- | -------- | ------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `baseUrl`   | `string`                                                               | no       | —       | Base URL (e.g. "https://example.signalwire.com"). Either `baseUrl` or `host` must be provided. If both are given, `host` takes precedence (matching the Python SDK convention where `host` is the canonical parameter). |
| `fetchImpl` | `(input: RequestInfo \| URL, init?: RequestInit) => Promise<Response>` | no       | —       | Custom fetch implementation for testing.                                                                                                                                                                                |
| `host`      | `string`                                                               | no       | —       | Bare hostname (e.g. "example.signalwire.com"). `https://` is prepended automatically, matching the Python SDK's `HttpClient(project, token, host)` convention.                                                          |
| `project`   | `string`                                                               | yes      | —       | Project ID for Basic Auth username.                                                                                                                                                                                     |
| `token`     | `string`                                                               | yes      | —       | API token for Basic Auth password.                                                                                                                                                                                      |

## Source

[`src/rest/types.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/types.ts)

Line 20.

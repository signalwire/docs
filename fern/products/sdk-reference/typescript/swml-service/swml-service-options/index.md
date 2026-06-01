---
slug: "/reference/typescript/swml-service/swml-service-options"
title: "SWMLServiceOptions"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "interface"
  language: "typescript"
  qualified_name: "SWMLService.SWMLServiceOptions"
  parent: "SWMLService"
  module: "SWMLService"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/SWMLService.ts"
---
# `SWMLServiceOptions`

Configuration options for SWMLService.

## Signature

```typescript
interface SWMLServiceOptions
```

## Properties

| Name               | Type               | Required | Default | Description                                                                                            |
| ------------------ | ------------------ | -------- | ------- | ------------------------------------------------------------------------------------------------------ |
| `basicAuth`        | `[string, string]` | no       | —       | Basic auth credentials as \[username, password].                                                       |
| `configFile`       | `string`           | no       | —       | Path to a security configuration file.                                                                 |
| `host`             | `string`           | no       | —       | Host to bind the web server to (default '0.0.0.0').                                                    |
| `name`             | `string`           | yes      | —       | Service display name. Required to match Python SDK where `name` is a positional required parameter.    |
| `port`             | `number`           | no       | —       | Port to bind the web server to (default PORT env var or 3000).                                         |
| `route`            | `string`           | no       | —       | HTTP route path (default '/').                                                                         |
| `schemaPath`       | `string`           | no       | —       | Path to a JSON Schema file for verb validation.                                                        |
| `schemaValidation` | `boolean`          | no       | —       | Enable schema validation (default true). Can also be disabled via SWML\_SKIP\_SCHEMA\_VALIDATION=true. |

## Source

[`src/SWMLService.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/SWMLService.ts)

Line 155.

---
slug: "/reference/typescript/web-service/web-service/start"
title: "start"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "WebService.WebService.start"
  parent: "WebService.WebService"
  module: "WebService"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/WebService.ts"
---
# `start`

Start the HTTP(S) service.

When `SWAIG_CLI_MODE=true` is set in the environment, the call is a
no-op so config can be inspected without binding a port.

## Signature

```typescript
start(
  host?: string,
  port?: number,
  sslCert?: string,
  sslKey?: string
): Promise<void>
```

## Parameters

| Name      | Type     | Required | Default | Description                                           |
| --------- | -------- | -------- | ------- | ----------------------------------------------------- |
| `host`    | `string` | no       | —       | Bind address. Defaults to `'0.0.0.0'`.                |
| `port`    | `number` | no       | —       | Port override. Defaults to `this.port`.               |
| `sslCert` | `string` | no       | —       | Path to SSL certificate file (overrides `SslConfig`). |
| `sslKey`  | `string` | no       | —       | Path to SSL key file (overrides `SslConfig`).         |

## Returns

`Promise<void>` — Resolves once the server has begun listening.

## Source

[`src/WebService.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/WebService.ts)

Line 250.

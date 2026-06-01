---
slug: "/reference/typescript/swml-service/swml-service/run"
title: "run"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "SWMLService.SWMLService.run"
  parent: "SWMLService.SWMLService"
  module: "SWMLService"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/SWMLService.ts"
---
# `run`

Start the HTTP server.

Matches Python's `serve()` parameters including SSL options. When
`SWAIG_CLI_MODE=true` is set in the environment (e.g. while running the
`swaig-test` CLI) the call is a no-op.

## Signature

```typescript
run(
  hostOrOpts?: string | { domain?: string; host?: string; port?: number; sslCert?: string; sslEnabled?: boolean; sslKey?: string },
  port?: number,
  opts?: { ...4 fields }
): Promise<void>
```

## Parameters

| Name              | Type                                                                                                                   | Required | Default | Description                                                  |
| ----------------- | ---------------------------------------------------------------------------------------------------------------------- | -------- | ------- | ------------------------------------------------------------ |
| `hostOrOpts`      | `string \| { domain?: string; host?: string; port?: number; sslCert?: string; sslEnabled?: boolean; sslKey?: string }` | no       | —       | —                                                            |
| `port`            | `number`                                                                                                               | no       | —       | Port. Defaults to `this.port` (constructor value) or `3000`. |
| `opts`            | `{ domain?: string; sslCert?: string; sslEnabled?: boolean; sslKey?: string }`                                         | no       | —       | Optional SSL/TLS configuration overrides.                    |
| `opts.domain`     | `string`                                                                                                               | no       | —       | Domain used for HSTS header configuration.                   |
| `opts.sslCert`    | `string`                                                                                                               | no       | —       | Path to the PEM certificate file.                            |
| `opts.sslEnabled` | `boolean`                                                                                                              | no       | —       | When `true`, serve over HTTPS.                               |
| `opts.sslKey`     | `string`                                                                                                               | no       | —       | Path to the PEM private key file.                            |

## Returns

`Promise<void>` — Resolves once the server has begun listening.

## Source

[`src/SWMLService.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/SWMLService.ts)

Line 929.

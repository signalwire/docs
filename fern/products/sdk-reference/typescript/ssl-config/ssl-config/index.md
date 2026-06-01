---
slug: "/reference/typescript/ssl-config/ssl-config"
title: "SslConfig"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "class"
  language: "typescript"
  qualified_name: "SslConfig.SslConfig"
  parent: "SslConfig"
  module: "SslConfig"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/SslConfig.ts"
---
# `SslConfig`

Manages SSL/TLS configuration sourced from explicit options or environment variables.

## Signature

```typescript
class SslConfig
```

## Properties

| Name         | Type             | Required | Default | Description                                               |
| ------------ | ---------------- | -------- | ------- | --------------------------------------------------------- |
| `certPath`   | `string \| null` | yes      | —       | Filesystem path to the PEM certificate, or null if unset. |
| `domain`     | `string \| null` | yes      | —       | Domain name for HSTS, or null if unset.                   |
| `enabled`    | `boolean`        | yes      | —       | Whether SSL is enabled.                                   |
| `hsts`       | `boolean`        | yes      | —       | Whether HSTS headers should be emitted.                   |
| `hstsMaxAge` | `number`         | yes      | —       | HSTS max-age value in seconds.                            |
| `keyPath`    | `string \| null` | yes      | —       | Filesystem path to the PEM private key, or null if unset. |

## Methods

- [`constructor`](/reference/typescript/ssl-config/ssl-config/constructor) — Create an SslConfig, falling back to environment variables for any unset options.
- [`getCert`](/reference/typescript/ssl-config/ssl-config/get-cert) — Read the PEM certificate file from disk.
- [`getHstsHeader`](/reference/typescript/ssl-config/ssl-config/get-hsts-header) — Build the Strict-Transport-Security header value.
- [`getKey`](/reference/typescript/ssl-config/ssl-config/get-key) — Read the PEM private key file from disk.
- [`getServerOptions`](/reference/typescript/ssl-config/ssl-config/get-server-options) — Create the options object needed by Node.js `https.createServer()`.
- [`hstsMiddleware`](/reference/typescript/ssl-config/ssl-config/hsts-middleware) — Return a Hono middleware that appends the HSTS header to every response.
- [`isConfigured`](/reference/typescript/ssl-config/ssl-config/is-configured) — Check whether SSL is fully configured: enabled with both cert and key files present on disk.

## Source

[`src/SslConfig.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/SslConfig.ts)

Line 30.

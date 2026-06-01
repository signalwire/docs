---
slug: "/reference/typescript/ssl-config/ssl-options"
title: "SslOptions"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "interface"
  language: "typescript"
  qualified_name: "SslConfig.SslOptions"
  parent: "SslConfig"
  module: "SslConfig"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/SslConfig.ts"
---
# `SslOptions`

Configuration options for SSL/TLS setup.

## Signature

```typescript
interface SslOptions
```

## Properties

| Name         | Type      | Required | Default | Description                                             |
| ------------ | --------- | -------- | ------- | ------------------------------------------------------- |
| `certPath`   | `string`  | no       | —       | Filesystem path to the PEM-encoded certificate.         |
| `domain`     | `string`  | no       | —       | Domain name used for HSTS headers.                      |
| `enabled`    | `boolean` | no       | —       | Whether SSL is enabled.                                 |
| `hsts`       | `boolean` | no       | —       | Whether to send HSTS headers; defaults to true.         |
| `hstsMaxAge` | `number`  | no       | —       | HSTS max-age in seconds; defaults to 31536000 (1 year). |
| `keyPath`    | `string`  | no       | —       | Filesystem path to the PEM-encoded private key.         |

## Source

[`src/SslConfig.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/SslConfig.ts)

Line 14.

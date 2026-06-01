---
slug: "/reference/typescript/swml-service/security-config"
title: "SecurityConfig"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "class"
  language: "typescript"
  qualified_name: "SWMLService.SecurityConfig"
  parent: "SWMLService"
  module: "SWMLService"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/SWMLService.ts"
---
# `SecurityConfig`

Unified security configuration.
Mirrors Python SDK's `SecurityConfig` — reads from env vars and optional config file.

## Signature

```typescript
class SecurityConfig
```

## Properties

| Name                | Type             | Required | Default | Description                               |
| ------------------- | ---------------- | -------- | ------- | ----------------------------------------- |
| `basicAuthPassword` | `string \| null` | yes      | —       | Basic auth password from config, or null. |
| `basicAuthUser`     | `string \| null` | yes      | —       | Basic auth username from config, or null. |
| `domain`            | `string \| null` | yes      | —       | Domain name for SSL.                      |
| `sslCertPath`       | `string \| null` | yes      | —       | Filesystem path to the PEM certificate.   |
| `sslEnabled`        | `boolean`        | yes      | —       | Whether SSL is enabled.                   |
| `sslKeyPath`        | `string \| null` | yes      | —       | Filesystem path to the PEM private key.   |

## Methods

- [`constructor`](/reference/typescript/swml-service/security-config/constructor)
- [`getBasicAuth`](/reference/typescript/swml-service/security-config/get-basic-auth) — Get basic auth credentials from security config, or null if not configured.
- [`validateSslConfig`](/reference/typescript/swml-service/security-config/validate-ssl-config) — Validate that SSL cert and key files are present when SSL is enabled.

## Source

[`src/SWMLService.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/SWMLService.ts)

Line 66.

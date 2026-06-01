---
slug: "/reference/typescript/ssl-config/ssl-config/hsts-middleware"
title: "hstsMiddleware"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "SslConfig.SslConfig.hstsMiddleware"
  parent: "SslConfig.SslConfig"
  module: "SslConfig"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/SslConfig.ts"
---
# `hstsMiddleware`

Return a Hono middleware that appends the HSTS header to every response.

## Signature

```typescript
hstsMiddleware(): (c: any, next: () => Promise<void>) => Promise<void>
```

## Returns

`(c: any, next: () => Promise<void>) => Promise<void>` — A Hono-compatible middleware function.

## Source

[`src/SslConfig.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/SslConfig.ts)

Line 109.

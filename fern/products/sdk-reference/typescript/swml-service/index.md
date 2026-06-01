---
slug: "/reference/typescript/swml-service"
title: "SWMLService"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "module"
  language: "typescript"
  qualified_name: "SWMLService"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/SWMLService.ts"
---
# `SWMLService`

## Signature

```typescript
module SWMLService
```

## Type Aliases

- [`OnRequestCallback`](/reference/typescript/swml-service/on-request-callback) — Callback invoked per-request to dynamically build SWML.

## Classes

- [`SecurityConfig`](/reference/typescript/swml-service/security-config) — Unified security configuration. Mirrors Python SDK's `SecurityConfig` — reads from env vars and optional config file.
- [`SWMLService`](/reference/typescript/swml-service/swml-service) — HTTP service that serves non-AI SWML documents built from verb methods.
- [`VerbHandlerRegistry`](/reference/typescript/swml-service/verb-handler-registry) — Registry for custom SWML verb handlers. Mirrors Python SDK's `VerbHandlerRegistry`.

## Interfaces

- [`SWMLServiceOptions`](/reference/typescript/swml-service/swml-service-options) — Configuration options for SWMLService.
- [`SWMLVerbHandler`](/reference/typescript/swml-service/swml-verb-handler) — Interface for custom SWML verb handlers. Mirrors Python SDK's `SWMLVerbHandler` abstract base class.

## Source

[`src/SWMLService.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/SWMLService.ts)

Line 1.

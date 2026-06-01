---
slug: "/reference/typescript/webhook-middleware"
title: "WebhookMiddleware"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "module"
  language: "typescript"
  qualified_name: "WebhookMiddleware"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/WebhookMiddleware.ts"
---
# `WebhookMiddleware`

## Signature

```typescript
module WebhookMiddleware
```

## Constants

| Name                             | Type                       | Required | Default | Description                                                                   |
| -------------------------------- | -------------------------- | -------- | ------- | ----------------------------------------------------------------------------- |
| `SIGNALWIRE_SIGNATURE_HEADER`    | `"x-signalwire-signature"` | yes      | —       | Canonical lowercase header names (Hono's c.req.header() is case-insensitive). |
| `TWILIO_COMPAT_SIGNATURE_HEADER` | `"x-twilio-signature"`     | yes      | —       | —                                                                             |

## Functions

- [`webhookValidationMiddleware`](/reference/typescript/webhook-middleware/webhook-validation-middleware) — Build a Hono middleware that enforces SignalWire webhook signature validation.

## Interfaces

- [`WebhookValidationOptions`](/reference/typescript/webhook-middleware/webhook-validation-options) — Options for [webhookValidationMiddleware](/reference/typescript/webhook-middleware/webhook-validation-middleware).

## Source

[`src/WebhookMiddleware.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/WebhookMiddleware.ts)

Line 1.

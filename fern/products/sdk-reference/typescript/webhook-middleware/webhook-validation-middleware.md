---
slug: "/reference/typescript/webhook-middleware/webhook-validation-middleware"
title: "webhookValidationMiddleware"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "function"
  language: "typescript"
  qualified_name: "WebhookMiddleware.webhookValidationMiddleware"
  parent: "WebhookMiddleware"
  module: "WebhookMiddleware"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/WebhookMiddleware.ts"
---
# `webhookValidationMiddleware`

Build a Hono middleware that enforces SignalWire webhook signature
validation.

The middleware:

1. Captures the raw body (`await c.req.text()`) BEFORE any other
   consumer reads the stream. The string is stashed at `c.set('rawBody')`
   so the downstream handler can re-parse without re-reading the stream.
2. Pulls the `X-SignalWire-Signature` header (or the `X-Twilio-Signature`
   alias).
3. Reconstructs the public URL (`SWML_PROXY_URL_BASE` env > forwarded
   headers when `trustProxy` > raw request URL).
4. Calls [validateWebhookSignature](/reference/typescript/webhook-validator/validate-webhook-signature).
5. On any failure: responds 403 with no body detail (would leak which
   branch failed). Does NOT call `next()`.
6. On success: `next()`.

## Signature

```typescript
webhookValidationMiddleware(opts: WebhookValidationOptions): MiddlewareHandler
```

## Parameters

| Name   | Type                       | Required | Default | Description |
| ------ | -------------------------- | -------- | ------- | ----------- |
| `opts` | `WebhookValidationOptions` | yes      | —       | —           |

## Returns

`MiddlewareHandler`

## Throws

- Error at construction time if `signingKey` is empty.

## Source

[`src/WebhookMiddleware.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/WebhookMiddleware.ts)

Line 126.

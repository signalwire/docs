---
slug: "/reference/typescript/webhook-validator/validate-webhook-signature"
title: "validateWebhookSignature"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "function"
  language: "typescript"
  qualified_name: "WebhookValidator.validateWebhookSignature"
  parent: "WebhookValidator"
  module: "WebhookValidator"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/WebhookValidator.ts"
---
# `validateWebhookSignature`

Validate a SignalWire webhook signature against both schemes (A then B).

## Signature

```typescript
validateWebhookSignature(
  signingKey: string,
  signature: string,
  url: string,
  rawBody: string
): boolean
```

## Parameters

| Name         | Type     | Required | Default | Description                                                                                                                                                                     |
| ------------ | -------- | -------- | ------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `signingKey` | `string` | yes      | —       | The customer's Signing Key from the Dashboard. Empty / null throws `Error` — that's a programming error, not a validation failure.                                              |
| `signature`  | `string` | yes      | —       | The `X-SignalWire-Signature` header value (or `X-Twilio-Signature` for cXML compat). Missing / empty returns `false` without throwing.                                          |
| `url`        | `string` | yes      | —       | The full URL SignalWire POSTed to (scheme, host, optional port, path, query). Must match what the platform saw — see the URL reconstruction section of porting-sdk/webhooks.md. |
| `rawBody`    | `string` | yes      | —       | The raw request body bytes as a UTF-8 string, BEFORE any JSON / form parsing. Must be a string — passing a parsed object throws `TypeError`.                                    |

## Returns

`boolean` — `true` if the signature matches either Scheme A (hex JSON) or Scheme B (base64 form, with port-normalization variants and optional bodySHA256 fallback). `false` otherwise.

## Throws

- Error when `signingKey` is missing / empty.
- TypeError when `rawBody` is not a string.

## Source

[`src/WebhookValidator.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/WebhookValidator.ts)

Line 300.

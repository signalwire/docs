---
slug: "/reference/php/signal-wire/security/security/webhook-validator"
title: "WebhookValidator"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "class"
  language: "php"
  qualified_name: "SignalWire\\Security\\WebhookValidator"
  parent: "SignalWire\\Security"
  module: "SignalWire.Security"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Security/WebhookValidator.php"
---
# `WebhookValidator`

Webhook signature validation for SignalWire-signed HTTP requests.

Implements both schemes from porting-sdk/webhooks.md:

- Scheme A (RELAY/SWML/JSON): hex(HMAC-SHA1(key, url + rawBody))
- Scheme B (Compat/cXML form): base64(HMAC-SHA1(key, url + sortedFormParams))
  with optional bodySHA256 query-param fallback for JSON-on-compat-surface.

Public API:

```
WebhookValidator::validateWebhookSignature($key, $sig, $url, $rawBody): bool
WebhookValidator::validateRequest($key, $sig, $url, $paramsOrRawBody): bool
```

All comparisons use hash\_equals() (constant-time) so the secret is not
leaked across repeated requests.

**Modifiers:** `final`

## Signature

```php
final class WebhookValidator
```

## Methods

- [`validateRequest`](/reference/php/signal-wire/security/security/webhook-validator/validate-request) — Legacy @signalwire/compatibility-api drop-in entry point.
- [`validateWebhookSignature`](/reference/php/signal-wire/security/security/webhook-validator/validate-webhook-signature) — Validate a SignalWire webhook signature against both schemes.

## Source

[`/src/src/SignalWire/Security/WebhookValidator.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Security/WebhookValidator.php)

Line 26.

---
slug: "/reference/ruby/signal-wire/security/webhook-validator"
title: "WebhookValidator"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "module"
  language: "ruby"
  qualified_name: "SignalWire::Security::WebhookValidator"
  parent: "SignalWire::Security"
  module: "SignalWire.Security"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/security/webhook_validator.rb"
  visibility: "public"
---
# `WebhookValidator`

Stateless validator for SignalWire-signed webhook requests.

Both Scheme A (JSON, hex digest) and Scheme B (form-encoded, base64
digest with bodySHA256 fallback) per porting-sdk/webhooks.md are
tried by the combined entry point.

The two public entry points are exposed via `module_function` so
they can be invoked as `WebhookValidator.validate_webhook_signature(...)`.
All internal helpers are deliberately `_`-prefixed and private so
they don't pollute the public surface (`audit_no_cheat_tests` and
`signature_dump.rb` skip `_`-prefixed methods).

## Signature

```ruby
module WebhookValidator
```

## Methods

- [`validate_request`](/reference/ruby/signal-wire/security/webhook-validator/validate-request) — Legacy `@signalwire/compatibility-api` drop-in entry point.
- [`validate_webhook_signature`](/reference/ruby/signal-wire/security/webhook-validator/validate-webhook-signature) — Validate a SignalWire webhook signature against both schemes.

## Source

[`lib/signalwire/security/webhook_validator.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/security/webhook_validator.rb)

Line 45.

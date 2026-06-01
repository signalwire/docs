---
slug: "/reference/ruby/signal-wire/security/webhook-validator/validate-webhook-signature"
title: "validate_webhook_signature"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::Security::WebhookValidator.validate_webhook_signature"
  parent: "SignalWire::Security::WebhookValidator"
  module: "SignalWire.Security.WebhookValidator"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/security/webhook_validator.rb"
  visibility: "public"
---
# `validate_webhook_signature`

Validate a SignalWire webhook signature against both schemes.

## Signature

```ruby
def validate_webhook_signature(signing_key, signature, url, raw_body)
```

## Parameters

| Name          | Type            | Required | Default | Description                                                                                                                                                                     |
| ------------- | --------------- | -------- | ------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `signing_key` | `String`        | yes      | —       | Customer's Signing Key from the Dashboard. UTF-8 string, secret. `nil` / empty raises `ArgumentError` — that's a programming error, not a validation failure.                   |
| `signature`   | `String \| nil` | yes      | —       | The `X-SignalWire-Signature` header value (or `X-Twilio-Signature` for cXML compat). Missing / empty returns false without raising.                                             |
| `url`         | `String`        | yes      | —       | The full URL SignalWire POSTed to (scheme, host, optional port, path, query). Must match what the platform saw — see the URL reconstruction section of porting-sdk/webhooks.md. |
| `raw_body`    | `String`        | yes      | —       | The raw request body bytes as a UTF-8 string, BEFORE any JSON / form parsing. Must be a `String` — passing a parsed Hash raises `TypeError`.                                    |

## Returns

`Boolean` — true if the signature matches either Scheme A or Scheme B (with port-normalization variants and optional bodySHA256 fallback). false otherwise.

## Throws

- `ArgumentError` — when `signing_key` is missing.
- `TypeError` — when `raw_body` is not a String.

## Source

[`lib/signalwire/security/webhook_validator.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/security/webhook_validator.rb)

Line 67.

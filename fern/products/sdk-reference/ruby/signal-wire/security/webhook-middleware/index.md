---
slug: "/reference/ruby/signal-wire/security/webhook-middleware"
title: "WebhookMiddleware"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "class"
  language: "ruby"
  qualified_name: "SignalWire::Security::WebhookMiddleware"
  parent: "SignalWire::Security"
  module: "SignalWire.Security"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/security/webhook_middleware.rb"
  visibility: "public"
---
# `WebhookMiddleware`

Rack middleware that rejects webhook requests with bad signatures.

Configure with the customer's Signing Key (and optional `trust_proxy`
to honor X-Forwarded headers). Mount upstream of any body-parsing
middleware so the raw bytes survive intact.

## Signature

```ruby
class WebhookMiddleware < Object
```

## Inheritance

**Extends:** `Object`

## Constants

| Name                             | Type                                                          | Required | Default | Description                                                          |
| -------------------------------- | ------------------------------------------------------------- | -------- | ------- | -------------------------------------------------------------------- |
| `RAW_BODY_ENV_KEY`               | `RAW_BODY_ENV_KEY = 'signalwire.raw_body'`                    | yes      | —       | Key under which the captured raw body is stashed on the request env. |
| `SIGNALWIRE_SIGNATURE_HEADER`    | `SIGNALWIRE_SIGNATURE_HEADER = 'HTTP_X_SIGNALWIRE_SIGNATURE'` | yes      | —       | —                                                                    |
| `TWILIO_COMPAT_SIGNATURE_HEADER` | `TWILIO_COMPAT_SIGNATURE_HEADER = 'HTTP_X_TWILIO_SIGNATURE'`  | yes      | —       | —                                                                    |

## Methods

- [`initialize`](/reference/ruby/signal-wire/security/webhook-middleware/initialize)

## Source

[`lib/signalwire/security/webhook_middleware.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/security/webhook_middleware.rb)

Line 47.

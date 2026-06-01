---
slug: "/reference/ruby/signal-wire/rest/signal-wire-rest-error"
title: "SignalWireRestError"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "class"
  language: "ruby"
  qualified_name: "SignalWire::REST::SignalWireRestError"
  parent: "SignalWire::REST"
  module: "SignalWire.REST"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/rest/http_client.rb"
  visibility: "public"
---
# `SignalWireRestError`

Raised when the SignalWire REST API returns a non-2xx response.

## Signature

```ruby
class SignalWireRestError < StandardError
```

## Inheritance

**Extends:** `StandardError`

## Methods

- [`body`](/reference/ruby/signal-wire/rest/signal-wire-rest-error/body) — Returns the value of attribute body.
- [`initialize`](/reference/ruby/signal-wire/rest/signal-wire-rest-error/initialize)
- [`method_name`](/reference/ruby/signal-wire/rest/signal-wire-rest-error/method-name) — Returns the value of attribute method\_name.
- [`status_code`](/reference/ruby/signal-wire/rest/signal-wire-rest-error/status-code) — Returns the value of attribute status\_code.
- [`url`](/reference/ruby/signal-wire/rest/signal-wire-rest-error/url) — Returns the value of attribute url.

## Source

[`lib/signalwire/rest/http_client.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/rest/http_client.rb)

Line 11.

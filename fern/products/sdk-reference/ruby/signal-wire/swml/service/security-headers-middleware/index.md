---
slug: "/reference/ruby/signal-wire/swml/service/security-headers-middleware"
title: "SecurityHeadersMiddleware"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "class"
  language: "ruby"
  qualified_name: "SignalWire::SWML::Service::SecurityHeadersMiddleware"
  parent: "SignalWire::SWML::Service"
  module: "SignalWire.SWML.Service"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/swml/service.rb"
  visibility: "public"
---
# `SecurityHeadersMiddleware`

***

## Middleware: security headers

## Signature

```ruby
class SecurityHeadersMiddleware < Object
```

## Inheritance

**Extends:** `Object`

## Constants

| Name      | Type                                                                                         | Required | Default | Description |
| --------- | -------------------------------------------------------------------------------------------- | -------- | ------- | ----------- |
| `HEADERS` | `HEADERS = {
  'x-content-type-options' => 'nosniff',
  'x-frame-options'        => 'DENY',` | yes      | —       | —           |

## Methods

- [`call`](/reference/ruby/signal-wire/swml/service/security-headers-middleware/call)
- [`initialize`](/reference/ruby/signal-wire/swml/service/security-headers-middleware/initialize)

## Source

[`lib/signalwire/swml/service.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/swml/service.rb)

Line 581.

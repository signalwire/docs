---
slug: "/reference/ruby/signal-wire/swml/service/on-swml-request"
title: "on_swml_request"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::SWML::Service#on_swml_request"
  parent: "SignalWire::SWML::Service"
  module: "SignalWire.SWML.Service"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/swml/service.rb"
  visibility: "public"
---
# `on_swml_request`

Customization point for subclasses to modify SWML based on
request data. The default returns nil (no modification).

Python parity:
`on_swml_request(request_data, callback_path, request)`. The
`request:` keyword carries the Rack request (or FastAPI
`Request` analogue) for subclasses that need query params
or headers.

## Signature

```ruby
def on_swml_request(request_data = nil, callback_path = nil, request: nil)
```

## Parameters

| Name            | Type | Required | Default | Description |
| --------------- | ---- | -------- | ------- | ----------- |
| `request_data`  | —    | no       | `nil`   | —           |
| `callback_path` | —    | no       | `nil`   | —           |
| `request:`      | —    | no       | `nil`   | —           |

## Source

[`lib/signalwire/swml/service.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/swml/service.rb)

Line 335.

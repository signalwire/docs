---
slug: "/reference/ruby/signal-wire/swml/service/remove-function"
title: "remove_function"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::SWML::Service#remove_function"
  parent: "SignalWire::SWML::Service"
  module: "SignalWire.SWML.Service"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/swml/service.rb"
  visibility: "public"
---
# `remove_function`

Remove a registered SWAIG function. Returns true on success,
false when the function was not registered.
(Python parity: ToolRegistry#remove\_function.)

## Signature

```ruby
def remove_function(name)
```

## Parameters

| Name   | Type | Required | Default | Description |
| ------ | ---- | -------- | ------- | ----------- |
| `name` | —    | yes      | —       | —           |

## Source

[`lib/signalwire/swml/service.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/swml/service.rb)

Line 155.

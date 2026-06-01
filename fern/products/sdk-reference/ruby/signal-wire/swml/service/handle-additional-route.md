---
slug: "/reference/ruby/signal-wire/swml/service/handle-additional-route"
title: "handle_additional_route"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::SWML::Service#handle_additional_route"
  parent: "SignalWire::SWML::Service"
  module: "SignalWire.SWML.Service"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/swml/service.rb"
  visibility: "public"
---
# `handle_additional_route`

Extension point: register additional Rack routes after Service
mounts /health, /ready, /swaig, and the main route. AgentBase uses
this to add /post\_prompt, /debug\_events, /mcp.

## Signature

```ruby
def handle_additional_route(_sub_path, _request_data, _env)
```

## Parameters

| Name            | Type | Required | Default | Description |
| --------------- | ---- | -------- | ------- | ----------- |
| `_sub_path`     | —    | yes      | —       | —           |
| `_request_data` | —    | yes      | —       | —           |
| `_env`          | —    | yes      | —       | —           |

## Returns

`Array | nil` — A Rack response triple, or nil if not handled

## Source

[`lib/signalwire/swml/service.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/swml/service.rb)

Line 190.

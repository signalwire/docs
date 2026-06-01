---
slug: "/reference/ruby/signal-wire/relay/tap-event/initialize"
title: "initialize"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::Relay::TapEvent#initialize"
  parent: "SignalWire::Relay::TapEvent"
  module: "SignalWire.Relay.TapEvent"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/relay/relay_event.rb"
  visibility: "public"
---
# `initialize`

## Signature

```ruby
def initialize(control_id: '', state: '', tap: {}, device: {}, **base)
```

## Parameters

| Name          | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `control_id:` | —    | no       | `''`    | —           |
| `state:`      | —    | no       | `''`    | —           |
| `tap:`        | —    | no       | `{}`    | —           |
| `device:`     | —    | no       | `{}`    | —           |
| `...base`     | —    | no       | —       | —           |

## Returns

`TapEvent` — a new instance of TapEvent

## Source

[`lib/signalwire/relay/relay_event.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/relay/relay_event.rb)

Line 253.

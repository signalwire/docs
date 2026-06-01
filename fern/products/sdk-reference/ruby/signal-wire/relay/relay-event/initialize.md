---
slug: "/reference/ruby/signal-wire/relay/relay-event/initialize"
title: "initialize"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::Relay::RelayEvent#initialize"
  parent: "SignalWire::Relay::RelayEvent"
  module: "SignalWire.Relay.RelayEvent"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/relay/relay_event.rb"
  visibility: "public"
---
# `initialize`

## Signature

```ruby
def initialize(event_type:, params: {}, call_id: '', timestamp: 0.0)
```

## Parameters

| Name          | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `event_type:` | —    | yes      | —       | —           |
| `params:`     | —    | no       | `{}`    | —           |
| `call_id:`    | —    | no       | `''`    | —           |
| `timestamp:`  | —    | no       | `0.0`   | —           |

## Returns

`RelayEvent` — a new instance of RelayEvent

## Source

[`lib/signalwire/relay/relay_event.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/relay/relay_event.rb)

Line 10.

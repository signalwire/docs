---
slug: "/reference/ruby/signal-wire/relay/call/play"
title: "play"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::Relay::Call#play"
  parent: "SignalWire::Relay::Call"
  module: "SignalWire.Relay.Call"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/relay/call.rb"
  visibility: "public"
---
# `play`

***

## Audio playback (returns PlayAction)

## Signature

```ruby
def play(media, volume: nil, direction: nil, loop_count: nil, control_id: nil, on_completed: nil, **kwargs)
```

## Parameters

| Name            | Type | Required | Default | Description |
| --------------- | ---- | -------- | ------- | ----------- |
| `media`         | —    | yes      | —       | —           |
| `volume:`       | —    | no       | `nil`   | —           |
| `direction:`    | —    | no       | `nil`   | —           |
| `loop_count:`   | —    | no       | `nil`   | —           |
| `control_id:`   | —    | no       | `nil`   | —           |
| `on_completed:` | —    | no       | `nil`   | —           |
| `...kwargs`     | —    | no       | —       | —           |

## Source

[`lib/signalwire/relay/call.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/relay/call.rb)

Line 372.

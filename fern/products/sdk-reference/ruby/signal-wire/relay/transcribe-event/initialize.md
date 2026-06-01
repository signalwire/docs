---
slug: "/reference/ruby/signal-wire/relay/transcribe-event/initialize"
title: "initialize"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::Relay::TranscribeEvent#initialize"
  parent: "SignalWire::Relay::TranscribeEvent"
  module: "SignalWire.Relay.TranscribeEvent"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/relay/relay_event.rb"
  visibility: "public"
---
# `initialize`

## Signature

```ruby
def initialize(control_id: '', state: '', url: '', recording_id: '', duration: 0.0, size: 0, **base)
```

## Parameters

| Name            | Type | Required | Default | Description |
| --------------- | ---- | -------- | ------- | ----------- |
| `control_id:`   | —    | no       | `''`    | —           |
| `state:`        | —    | no       | `''`    | —           |
| `url:`          | —    | no       | `''`    | —           |
| `recording_id:` | —    | no       | `''`    | —           |
| `duration:`     | —    | no       | `0.0`   | —           |
| `size:`         | —    | no       | `0`     | —           |
| `...base`       | —    | no       | —       | —           |

## Returns

`TranscribeEvent` — a new instance of TranscribeEvent

## Source

[`lib/signalwire/relay/relay_event.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/relay/relay_event.rb)

Line 474.

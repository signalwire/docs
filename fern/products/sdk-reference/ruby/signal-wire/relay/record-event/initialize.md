---
slug: "/reference/ruby/signal-wire/relay/record-event/initialize"
title: "initialize"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::Relay::RecordEvent#initialize"
  parent: "SignalWire::Relay::RecordEvent"
  module: "SignalWire.Relay.RecordEvent"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/relay/relay_event.rb"
  visibility: "public"
---
# `initialize`

## Signature

```ruby
def initialize(control_id: '', state: '', url: '', duration: 0.0, size: 0, record: {}, **base)
```

## Parameters

| Name          | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `control_id:` | —    | no       | `''`    | —           |
| `state:`      | —    | no       | `''`    | —           |
| `url:`        | —    | no       | `''`    | —           |
| `duration:`   | —    | no       | `0.0`   | —           |
| `size:`       | —    | no       | `0`     | —           |
| `record:`     | —    | no       | `{}`    | —           |
| `...base`     | —    | no       | —       | —           |

## Returns

`RecordEvent` — a new instance of RecordEvent

## Source

[`lib/signalwire/relay/relay_event.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/relay/relay_event.rb)

Line 133.

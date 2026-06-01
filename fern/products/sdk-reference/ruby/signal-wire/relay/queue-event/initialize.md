---
slug: "/reference/ruby/signal-wire/relay/queue-event/initialize"
title: "initialize"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::Relay::QueueEvent#initialize"
  parent: "SignalWire::Relay::QueueEvent"
  module: "SignalWire.Relay.QueueEvent"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/relay/relay_event.rb"
  visibility: "public"
---
# `initialize`

## Signature

```ruby
def initialize(control_id: '', status: '', queue_id: '', queue_name: '', position: 0, size: 0, **base)
```

## Parameters

| Name          | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `control_id:` | —    | no       | `''`    | —           |
| `status:`     | —    | no       | `''`    | —           |
| `queue_id:`   | —    | no       | `''`    | —           |
| `queue_name:` | —    | no       | `''`    | —           |
| `position:`   | —    | no       | `0`     | —           |
| `size:`       | —    | no       | `0`     | —           |
| `...base`     | —    | no       | —       | —           |

## Returns

`QueueEvent` — a new instance of QueueEvent

## Source

[`lib/signalwire/relay/relay_event.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/relay/relay_event.rb)

Line 423.

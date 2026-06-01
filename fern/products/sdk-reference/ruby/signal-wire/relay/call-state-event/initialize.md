---
slug: "/reference/ruby/signal-wire/relay/call-state-event/initialize"
title: "initialize"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::Relay::CallStateEvent#initialize"
  parent: "SignalWire::Relay::CallStateEvent"
  module: "SignalWire.Relay.CallStateEvent"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/relay/relay_event.rb"
  visibility: "public"
---
# `initialize`

## Signature

```ruby
def initialize(call_state: '', end_reason: '', direction: '', device: {}, **base)
```

## Parameters

| Name          | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `call_state:` | —    | no       | `''`    | —           |
| `end_reason:` | —    | no       | `''`    | —           |
| `direction:`  | —    | no       | `''`    | —           |
| `device:`     | —    | no       | `{}`    | —           |
| `...base`     | —    | no       | —       | —           |

## Returns

`CallStateEvent` — a new instance of CallStateEvent

## Source

[`lib/signalwire/relay/relay_event.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/relay/relay_event.rb)

Line 46.

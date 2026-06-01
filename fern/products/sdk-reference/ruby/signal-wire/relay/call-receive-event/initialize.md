---
slug: "/reference/ruby/signal-wire/relay/call-receive-event/initialize"
title: "initialize"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::Relay::CallReceiveEvent#initialize"
  parent: "SignalWire::Relay::CallReceiveEvent"
  module: "SignalWire.Relay.CallReceiveEvent"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/relay/relay_event.rb"
  visibility: "public"
---
# `initialize`

## Signature

```ruby
def initialize(call_state: '', direction: '', device: {}, node_id: '', project_id: '', context: '', segment_id: '', tag: '', **base)
```

## Parameters

| Name          | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `call_state:` | —    | no       | `''`    | —           |
| `direction:`  | —    | no       | `''`    | —           |
| `device:`     | —    | no       | `{}`    | —           |
| `node_id:`    | —    | no       | `''`    | —           |
| `project_id:` | —    | no       | `''`    | —           |
| `context:`    | —    | no       | `''`    | —           |
| `segment_id:` | —    | no       | `''`    | —           |
| `tag:`        | —    | no       | `''`    | —           |
| `...base`     | —    | no       | —       | —           |

## Returns

`CallReceiveEvent` — a new instance of CallReceiveEvent

## Source

[`lib/signalwire/relay/relay_event.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/relay/relay_event.rb)

Line 77.

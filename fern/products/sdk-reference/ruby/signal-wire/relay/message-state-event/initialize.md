---
slug: "/reference/ruby/signal-wire/relay/message-state-event/initialize"
title: "initialize"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::Relay::MessageStateEvent#initialize"
  parent: "SignalWire::Relay::MessageStateEvent"
  module: "SignalWire.Relay.MessageStateEvent"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/relay/relay_event.rb"
  visibility: "public"
---
# `initialize`

## Signature

```ruby
def initialize(message_id: '', context: '', direction: '', from_number: '', to_number: '', body: '', media: [], segments: 0, message_state: '', reason: '', tags: [], **base)
```

## Parameters

| Name             | Type | Required | Default | Description |
| ---------------- | ---- | -------- | ------- | ----------- |
| `message_id:`    | —    | no       | `''`    | —           |
| `context:`       | —    | no       | `''`    | —           |
| `direction:`     | —    | no       | `''`    | —           |
| `from_number:`   | —    | no       | `''`    | —           |
| `to_number:`     | —    | no       | `''`    | —           |
| `body:`          | —    | no       | `''`    | —           |
| `media:`         | —    | no       | `[]`    | —           |
| `segments:`      | —    | no       | `0`     | —           |
| `message_state:` | —    | no       | `''`    | —           |
| `reason:`        | —    | no       | `''`    | —           |
| `tags:`          | —    | no       | `[]`    | —           |
| `...base`        | —    | no       | —       | —           |

## Returns

`MessageStateEvent` — a new instance of MessageStateEvent

## Source

[`lib/signalwire/relay/relay_event.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/relay/relay_event.rb)

Line 618.

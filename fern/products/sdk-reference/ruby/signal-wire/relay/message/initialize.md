---
slug: "/reference/ruby/signal-wire/relay/message/initialize"
title: "initialize"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::Relay::Message#initialize"
  parent: "SignalWire::Relay::Message"
  module: "SignalWire.Relay.Message"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/relay/message.rb"
  visibility: "public"
---
# `initialize`

## Signature

```ruby
def initialize(message_id: '', context: '', direction: '', from_number: '', to_number: '', body: '', media: nil, segments: 0, state: '', reason: '', tags: nil)
```

## Parameters

| Name           | Type | Required | Default | Description |
| -------------- | ---- | -------- | ------- | ----------- |
| `message_id:`  | —    | no       | `''`    | —           |
| `context:`     | —    | no       | `''`    | —           |
| `direction:`   | —    | no       | `''`    | —           |
| `from_number:` | —    | no       | `''`    | —           |
| `to_number:`   | —    | no       | `''`    | —           |
| `body:`        | —    | no       | `''`    | —           |
| `media:`       | —    | no       | `nil`   | —           |
| `segments:`    | —    | no       | `0`     | —           |
| `state:`       | —    | no       | `''`    | —           |
| `reason:`      | —    | no       | `''`    | —           |
| `tags:`        | —    | no       | `nil`   | —           |

## Returns

`Message` — a new instance of Message

## Source

[`lib/signalwire/relay/message.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/relay/message.rb)

Line 14.

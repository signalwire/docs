---
slug: "/reference/ruby/signal-wire/relay/client/send-message"
title: "send_message"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::Relay::Client#send_message"
  parent: "SignalWire::Relay::Client"
  module: "SignalWire.Relay.Client"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/relay/client.rb"
  visibility: "public"
---
# `send_message`

Send an SMS/MMS message. Returns a Message object.

Mirrors Python's RelayClient.send\_message keyword-only signature
exactly. At least one of body: or media: is required.

## Signature

```ruby
def send_message(to_number:, from_number:, context: nil, body: nil, media: nil, tags: nil, region: nil, on_completed: nil)
```

## Parameters

| Name            | Type | Required | Default | Description |
| --------------- | ---- | -------- | ------- | ----------- |
| `to_number:`    | —    | yes      | —       | —           |
| `from_number:`  | —    | yes      | —       | —           |
| `context:`      | —    | no       | `nil`   | —           |
| `body:`         | —    | no       | `nil`   | —           |
| `media:`        | —    | no       | `nil`   | —           |
| `tags:`         | —    | no       | `nil`   | —           |
| `region:`       | —    | no       | `nil`   | —           |
| `on_completed:` | —    | no       | `nil`   | —           |

## Source

[`lib/signalwire/relay/client.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/relay/client.rb)

Line 253.

---
slug: "/reference/ruby/signal-wire/relay/message/wait"
title: "wait"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::Relay::Message#wait"
  parent: "SignalWire::Relay::Message"
  module: "SignalWire.Relay.Message"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/relay/message.rb"
  visibility: "public"
---
# `wait`

Wait for the message to reach a terminal state.
Raises ActionTimeoutError if timeout exceeded.

## Signature

```ruby
def wait(timeout: nil)
```

## Parameters

| Name       | Type | Required | Default | Description |
| ---------- | ---- | -------- | ------- | ----------- |
| `timeout:` | —    | no       | `nil`   | —           |

## Source

[`lib/signalwire/relay/message.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/relay/message.rb)

Line 65.

---
slug: "/reference/ruby/signal-wire/relay/action/wait"
title: "wait"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::Relay::Action#wait"
  parent: "SignalWire::Relay::Action"
  module: "SignalWire.Relay.Action"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/relay/action.rb"
  visibility: "public"
---
# `wait`

Wait for the action to complete. Returns the terminal event.
Raises ActionTimeoutError if timeout is specified and exceeded.

## Signature

```ruby
def wait(timeout: nil)
```

## Parameters

| Name       | Type | Required | Default | Description |
| ---------- | ---- | -------- | ------- | ----------- |
| `timeout:` | —    | no       | `nil`   | —           |

## Source

[`lib/signalwire/relay/action.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/relay/action.rb)

Line 69.

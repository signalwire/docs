---
slug: "/reference/ruby/signal-wire/relay/client/set-protocol"
title: "_set_protocol"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::Relay::Client#_set_protocol"
  parent: "SignalWire::Relay::Client"
  module: "SignalWire.Relay.Client"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/relay/client.rb"
  visibility: "public"
---
# `_set_protocol`

Test/reconnect surface: stamp a previously issued protocol
string before calling +run+ so the next signalwire.connect frame
carries it (the production server replies with
+session\_restored: true+). Mirrors Python's +RelayClient.\_relay\_protocol = ...+.

## Signature

```ruby
def _set_protocol(value)
```

## Parameters

| Name    | Type | Required | Default | Description |
| ------- | ---- | -------- | ------- | ----------- |
| `value` | —    | yes      | —       | —           |

## Source

[`lib/signalwire/relay/client.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/relay/client.rb)

Line 148.

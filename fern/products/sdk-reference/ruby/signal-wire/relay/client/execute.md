---
slug: "/reference/ruby/signal-wire/relay/client/execute"
title: "execute"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::Relay::Client#execute"
  parent: "SignalWire::Relay::Client"
  module: "SignalWire.Relay.Client"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/relay/client.rb"
  visibility: "public"
---
# `execute`

Send a JSON-RPC request and wait for the response.
Returns the result hash. Raises RelayError on error.

## Signature

```ruby
def execute(method, params = {})
```

## Parameters

| Name     | Type | Required | Default | Description |
| -------- | ---- | -------- | ------- | ----------- |
| `method` | —    | yes      | —       | —           |
| `params` | —    | no       | `{}`    | —           |

## Source

[`lib/signalwire/relay/client.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/relay/client.rb)

Line 307.

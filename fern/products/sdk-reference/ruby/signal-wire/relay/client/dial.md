---
slug: "/reference/ruby/signal-wire/relay/client/dial"
title: "dial"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::Relay::Client#dial"
  parent: "SignalWire::Relay::Client"
  module: "SignalWire.Relay.Client"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/relay/client.rb"
  visibility: "public"
---
# `dial`

Dial outbound call(s). Returns a Call object.

## Signature

```ruby
def dial(devices, timeout: 120, tag: nil, **kwargs)
```

## Parameters

| Name        | Type | Required | Default | Description |
| ----------- | ---- | -------- | ------- | ----------- |
| `devices`   | —    | yes      | —       | —           |
| `timeout:`  | —    | no       | `120`   | —           |
| `tag:`      | —    | no       | `nil`   | —           |
| `...kwargs` | —    | no       | —       | —           |

## Throws

- `RelayError`

## Source

[`lib/signalwire/relay/client.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/relay/client.rb)

Line 211.

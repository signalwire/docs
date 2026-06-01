---
slug: "/reference/ruby/signal-wire/relay/refer-event/initialize"
title: "initialize"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::Relay::ReferEvent#initialize"
  parent: "SignalWire::Relay::ReferEvent"
  module: "SignalWire.Relay.ReferEvent"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/relay/relay_event.rb"
  visibility: "public"
---
# `initialize`

## Signature

```ruby
def initialize(state: '', sip_refer_to: '', sip_refer_response_code: '', sip_notify_response_code: '', **base)
```

## Parameters

| Name                        | Type | Required | Default | Description |
| --------------------------- | ---- | -------- | ------- | ----------- |
| `state:`                    | —    | no       | `''`    | —           |
| `sip_refer_to:`             | —    | no       | `''`    | —           |
| `sip_refer_response_code:`  | —    | no       | `''`    | —           |
| `sip_notify_response_code:` | —    | no       | `''`    | —           |
| `...base`                   | —    | no       | —       | —           |

## Returns

`ReferEvent` — a new instance of ReferEvent

## Source

[`lib/signalwire/relay/relay_event.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/relay/relay_event.rb)

Line 352.

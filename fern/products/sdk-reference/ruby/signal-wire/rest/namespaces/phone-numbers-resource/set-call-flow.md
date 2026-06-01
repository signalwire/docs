---
slug: "/reference/ruby/signal-wire/rest/namespaces/phone-numbers-resource/set-call-flow"
title: "set_call_flow"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::REST::Namespaces::PhoneNumbersResource#set_call_flow"
  parent: "SignalWire::REST::Namespaces::PhoneNumbersResource"
  module: "SignalWire.REST.Namespaces.PhoneNumbersResource"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/rest/namespaces/phone_numbers.rb"
  visibility: "public"
---
# `set_call_flow`

Route inbound calls to a Call Flow by ID.

+version+ accepts +"working\_copy"+ or +"current\_deployed"+ (server
default when omitted).

## Signature

```ruby
def set_call_flow(sid, flow_id:, version: nil, **extra)
```

## Parameters

| Name       | Type | Required | Default | Description |
| ---------- | ---- | -------- | ------- | ----------- |
| `sid`      | —    | yes      | —       | —           |
| `flow_id:` | —    | yes      | —       | —           |
| `version:` | —    | no       | `nil`   | —           |
| `...extra` | —    | no       | —       | —           |

## Source

[`lib/signalwire/rest/namespaces/phone_numbers.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/rest/namespaces/phone_numbers.rb)

Line 93.

---
slug: "/reference/ruby/signal-wire/rest/namespaces/phone-numbers-resource/set-relay-application"
title: "set_relay_application"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::REST::Namespaces::PhoneNumbersResource#set_relay_application"
  parent: "SignalWire::REST::Namespaces::PhoneNumbersResource"
  module: "SignalWire.REST.Namespaces.PhoneNumbersResource"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/rest/namespaces/phone_numbers.rb"
  visibility: "public"
---
# `set_relay_application`

Route inbound calls to a named RELAY application.

## Signature

```ruby
def set_relay_application(sid, name:, **extra)
```

## Parameters

| Name       | Type | Required | Default | Description |
| ---------- | ---- | -------- | ------- | ----------- |
| `sid`      | —    | yes      | —       | —           |
| `name:`    | —    | yes      | —       | —           |
| `...extra` | —    | no       | —       | —           |

## Source

[`lib/signalwire/rest/namespaces/phone_numbers.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/rest/namespaces/phone_numbers.rb)

Line 103.

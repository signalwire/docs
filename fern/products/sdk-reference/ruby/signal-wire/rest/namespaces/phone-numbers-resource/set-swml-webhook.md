---
slug: "/reference/ruby/signal-wire/rest/namespaces/phone-numbers-resource/set-swml-webhook"
title: "set_swml_webhook"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::REST::Namespaces::PhoneNumbersResource#set_swml_webhook"
  parent: "SignalWire::REST::Namespaces::PhoneNumbersResource"
  module: "SignalWire.REST.Namespaces.PhoneNumbersResource"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/rest/namespaces/phone_numbers.rb"
  visibility: "public"
---
# `set_swml_webhook`

Route inbound calls to an SWML webhook URL.

Your backend returns an SWML document per call. The server
auto-creates a +swml\_webhook+ Fabric resource keyed off this URL.

## Signature

```ruby
def set_swml_webhook(sid, url:, **extra)
```

## Parameters

| Name       | Type     | Required | Default | Description                          |
| ---------- | -------- | -------- | ------- | ------------------------------------ |
| `sid`      | `String` | yes      | —       | the phone number SID (e.g. +pn-...+) |
| `url:`     | —        | yes      | —       | —                                    |
| `...extra` | `Hash`   | no       | —       | additional fields passed to +update+ |

## Returns

`Hash` — the updated phone number representation

## Source

[`lib/signalwire/rest/namespaces/phone_numbers.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/rest/namespaces/phone_numbers.rb)

Line 44.

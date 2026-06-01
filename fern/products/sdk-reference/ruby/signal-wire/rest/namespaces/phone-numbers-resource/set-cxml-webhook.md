---
slug: "/reference/ruby/signal-wire/rest/namespaces/phone-numbers-resource/set-cxml-webhook"
title: "set_cxml_webhook"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::REST::Namespaces::PhoneNumbersResource#set_cxml_webhook"
  parent: "SignalWire::REST::Namespaces::PhoneNumbersResource"
  module: "SignalWire.REST.Namespaces.PhoneNumbersResource"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/rest/namespaces/phone_numbers.rb"
  visibility: "public"
---
# `set_cxml_webhook`

Route inbound calls to a cXML (Twilio-compat / LAML) webhook.

Despite the wire value +laml\_webhooks+ being plural, this creates a
single +cxml\_webhook+ Fabric resource. +fallback\_url+ is used when
the primary URL fails; +status\_callback\_url+ receives call status
updates.

## Signature

```ruby
def set_cxml_webhook(sid, url:, fallback_url: nil, status_callback_url: nil, **extra)
```

## Parameters

| Name                   | Type | Required | Default | Description |
| ---------------------- | ---- | -------- | ------- | ----------- |
| `sid`                  | —    | yes      | —       | —           |
| `url:`                 | —    | yes      | —       | —           |
| `fallback_url:`        | —    | no       | `nil`   | —           |
| `status_callback_url:` | —    | no       | `nil`   | —           |
| `...extra`             | —    | no       | —       | —           |

## Source

[`lib/signalwire/rest/namespaces/phone_numbers.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/rest/namespaces/phone_numbers.rb)

Line 59.

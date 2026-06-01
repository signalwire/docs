---
slug: "/reference/ruby/signal-wire/swaig/function-result/send-sms"
title: "send_sms"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::Swaig::FunctionResult#send_sms"
  parent: "SignalWire::Swaig::FunctionResult"
  module: "SignalWire.Swaig.FunctionResult"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/swaig/function_result.rb"
  visibility: "public"
---
# `send_sms`

Send an SMS message via SWML.

## Signature

```ruby
def send_sms(to_number:, from_number:, body: nil, media: nil, tags: nil, region: nil)
```

## Parameters

| Name           | Type | Required | Default | Description |
| -------------- | ---- | -------- | ------- | ----------- |
| `to_number:`   | —    | yes      | —       | —           |
| `from_number:` | —    | yes      | —       | —           |
| `body:`        | —    | no       | `nil`   | —           |
| `media:`       | —    | no       | `nil`   | —           |
| `tags:`        | —    | no       | `nil`   | —           |
| `region:`      | —    | no       | `nil`   | —           |

## Returns

`self`

## Throws

- `ArgumentError`

## Source

[`lib/signalwire/swaig/function_result.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/swaig/function_result.rb)

Line 559.

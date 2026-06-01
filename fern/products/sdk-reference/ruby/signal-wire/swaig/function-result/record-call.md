---
slug: "/reference/ruby/signal-wire/swaig/function-result/record-call"
title: "record_call"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::Swaig::FunctionResult#record_call"
  parent: "SignalWire::Swaig::FunctionResult"
  module: "SignalWire.Swaig.FunctionResult"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/swaig/function_result.rb"
  visibility: "public"
---
# `record_call`

Start background call recording via SWML.

## Signature

```ruby
def record_call(control_id: nil, stereo: false, format: "wav", direction: "both", terminators: nil, beep: false, input_sensitivity: 44.0, initial_timeout: nil, end_silence_timeout: nil, max_length: nil, status_url: nil)
```

## Parameters

| Name                   | Type | Required | Default  | Description |
| ---------------------- | ---- | -------- | -------- | ----------- |
| `control_id:`          | —    | no       | `nil`    | —           |
| `stereo:`              | —    | no       | `false`  | —           |
| `format:`              | —    | no       | `"wav"`  | —           |
| `direction:`           | —    | no       | `"both"` | —           |
| `terminators:`         | —    | no       | `nil`    | —           |
| `beep:`                | —    | no       | `false`  | —           |
| `input_sensitivity:`   | —    | no       | `44.0`   | —           |
| `initial_timeout:`     | —    | no       | `nil`    | —           |
| `end_silence_timeout:` | —    | no       | `nil`    | —           |
| `max_length:`          | —    | no       | `nil`    | —           |
| `status_url:`          | —    | no       | `nil`    | —           |

## Returns

`self`

## Throws

- `ArgumentError`

## Source

[`lib/signalwire/swaig/function_result.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/swaig/function_result.rb)

Line 293.

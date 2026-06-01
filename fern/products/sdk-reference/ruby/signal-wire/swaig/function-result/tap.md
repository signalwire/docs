---
slug: "/reference/ruby/signal-wire/swaig/function-result/tap"
title: "tap"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::Swaig::FunctionResult#tap"
  parent: "SignalWire::Swaig::FunctionResult"
  module: "SignalWire.Swaig.FunctionResult"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/swaig/function_result.rb"
  visibility: "public"
---
# `tap`

Start a background call tap via SWML.

## Signature

```ruby
def tap(uri, control_id: nil, direction: "both", codec: "PCMU", rtp_ptime: 20, status_url: nil)
```

## Parameters

| Name          | Type     | Required | Default  | Description                             |
| ------------- | -------- | -------- | -------- | --------------------------------------- |
| `uri`         | `String` | yes      | —        | destination URI (rtp://, ws://, wss://) |
| `control_id:` | —        | no       | `nil`    | —                                       |
| `direction:`  | —        | no       | `"both"` | —                                       |
| `codec:`      | —        | no       | `"PCMU"` | —                                       |
| `rtp_ptime:`  | —        | no       | `20`     | —                                       |
| `status_url:` | —        | no       | `nil`    | —                                       |

## Returns

`self`

## Throws

- `ArgumentError`

## Source

[`lib/signalwire/swaig/function_result.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/swaig/function_result.rb)

Line 516.

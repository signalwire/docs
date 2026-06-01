---
slug: "/reference/ruby/signal-wire/swaig/function-result/join-conference"
title: "join_conference"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::Swaig::FunctionResult#join_conference"
  parent: "SignalWire::Swaig::FunctionResult"
  module: "SignalWire.Swaig.FunctionResult"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/swaig/function_result.rb"
  visibility: "public"
---
# `join_conference`

Join an ad-hoc audio conference via SWML.

## Signature

```ruby
def join_conference(name, muted: false, beep: "true", start_on_enter: true, end_on_exit: false, wait_url: nil, max_participants: 250, record: "do-not-record", region: nil, trim: "trim-silence", coach: nil, status_callback_event: nil, status_callback: nil, status_callback_method: "POST", recording_status_callback: nil, recording_status_callback_method: "POST", recording_status_callback_event: "completed", result: nil)
```

## Parameters

| Name                                | Type     | Required | Default           | Description                |
| ----------------------------------- | -------- | -------- | ----------------- | -------------------------- |
| `name`                              | `String` | yes      | —                 | conference name (required) |
| `muted:`                            | —        | no       | `false`           | —                          |
| `beep:`                             | —        | no       | `"true"`          | —                          |
| `start_on_enter:`                   | —        | no       | `true`            | —                          |
| `end_on_exit:`                      | —        | no       | `false`           | —                          |
| `wait_url:`                         | —        | no       | `nil`             | —                          |
| `max_participants:`                 | —        | no       | `250`             | —                          |
| `record:`                           | —        | no       | `"do-not-record"` | —                          |
| `region:`                           | —        | no       | `nil`             | —                          |
| `trim:`                             | —        | no       | `"trim-silence"`  | —                          |
| `coach:`                            | —        | no       | `nil`             | —                          |
| `status_callback_event:`            | —        | no       | `nil`             | —                          |
| `status_callback:`                  | —        | no       | `nil`             | —                          |
| `status_callback_method:`           | —        | no       | `"POST"`          | —                          |
| `recording_status_callback:`        | —        | no       | `nil`             | —                          |
| `recording_status_callback_method:` | —        | no       | `"POST"`          | —                          |
| `recording_status_callback_event:`  | —        | no       | `"completed"`     | —                          |
| `result:`                           | —        | no       | `nil`             | —                          |

## Returns

`self`

## Throws

- `ArgumentError`

## Source

[`lib/signalwire/swaig/function_result.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/swaig/function_result.rb)

Line 430.

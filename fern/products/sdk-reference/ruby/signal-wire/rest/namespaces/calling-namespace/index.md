---
slug: "/reference/ruby/signal-wire/rest/namespaces/calling-namespace"
title: "CallingNamespace"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "class"
  language: "ruby"
  qualified_name: "SignalWire::REST::Namespaces::CallingNamespace"
  parent: "SignalWire::REST::Namespaces"
  module: "SignalWire.REST.Namespaces"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/rest/namespaces/calling.rb"
  visibility: "public"
---
# `CallingNamespace`

REST call control -- all 37 commands dispatched via single POST endpoint.

## Signature

```ruby
class CallingNamespace < SignalWire::REST::BaseResource
```

## Inheritance

**Extends:** [SignalWire::REST::BaseResource](/reference/ruby/signal-wire/rest/base-resource)

## Methods

- [`ai_hold`](/reference/ruby/signal-wire/rest/namespaces/calling-namespace/ai-hold)
- [`ai_message`](/reference/ruby/signal-wire/rest/namespaces/calling-namespace/ai-message) — AI
- [`ai_stop`](/reference/ruby/signal-wire/rest/namespaces/calling-namespace/ai-stop)
- [`ai_unhold`](/reference/ruby/signal-wire/rest/namespaces/calling-namespace/ai-unhold)
- [`collect`](/reference/ruby/signal-wire/rest/namespaces/calling-namespace/collect) — Collect
- [`collect_start_input_timers`](/reference/ruby/signal-wire/rest/namespaces/calling-namespace/collect-start-input-timers)
- [`collect_stop`](/reference/ruby/signal-wire/rest/namespaces/calling-namespace/collect-stop)
- [`denoise`](/reference/ruby/signal-wire/rest/namespaces/calling-namespace/denoise) — Denoise
- [`denoise_stop`](/reference/ruby/signal-wire/rest/namespaces/calling-namespace/denoise-stop)
- [`detect`](/reference/ruby/signal-wire/rest/namespaces/calling-namespace/detect) — Detect
- [`detect_stop`](/reference/ruby/signal-wire/rest/namespaces/calling-namespace/detect-stop)
- [`dial`](/reference/ruby/signal-wire/rest/namespaces/calling-namespace/dial) — Call lifecycle
- [`disconnect`](/reference/ruby/signal-wire/rest/namespaces/calling-namespace/disconnect)
- [`end_call`](/reference/ruby/signal-wire/rest/namespaces/calling-namespace/end-call)
- [`initialize`](/reference/ruby/signal-wire/rest/namespaces/calling-namespace/initialize)
- [`live_transcribe`](/reference/ruby/signal-wire/rest/namespaces/calling-namespace/live-transcribe) — Live transcribe / translate
- [`live_translate`](/reference/ruby/signal-wire/rest/namespaces/calling-namespace/live-translate)
- [`play`](/reference/ruby/signal-wire/rest/namespaces/calling-namespace/play) — Play
- [`play_pause`](/reference/ruby/signal-wire/rest/namespaces/calling-namespace/play-pause)
- [`play_resume`](/reference/ruby/signal-wire/rest/namespaces/calling-namespace/play-resume)
- [`play_stop`](/reference/ruby/signal-wire/rest/namespaces/calling-namespace/play-stop)
- [`play_volume`](/reference/ruby/signal-wire/rest/namespaces/calling-namespace/play-volume)
- [`receive_fax_stop`](/reference/ruby/signal-wire/rest/namespaces/calling-namespace/receive-fax-stop)
- [`record`](/reference/ruby/signal-wire/rest/namespaces/calling-namespace/record) — Record
- [`record_pause`](/reference/ruby/signal-wire/rest/namespaces/calling-namespace/record-pause)
- [`record_resume`](/reference/ruby/signal-wire/rest/namespaces/calling-namespace/record-resume)
- [`record_stop`](/reference/ruby/signal-wire/rest/namespaces/calling-namespace/record-stop)
- [`refer`](/reference/ruby/signal-wire/rest/namespaces/calling-namespace/refer) — SIP
- [`send_fax_stop`](/reference/ruby/signal-wire/rest/namespaces/calling-namespace/send-fax-stop) — Fax
- [`stream`](/reference/ruby/signal-wire/rest/namespaces/calling-namespace/stream) — Stream
- [`stream_stop`](/reference/ruby/signal-wire/rest/namespaces/calling-namespace/stream-stop)
- [`tap`](/reference/ruby/signal-wire/rest/namespaces/calling-namespace/tap) — Tap
- [`tap_stop`](/reference/ruby/signal-wire/rest/namespaces/calling-namespace/tap-stop)
- [`transcribe`](/reference/ruby/signal-wire/rest/namespaces/calling-namespace/transcribe) — Transcribe
- [`transcribe_stop`](/reference/ruby/signal-wire/rest/namespaces/calling-namespace/transcribe-stop)
- [`transfer`](/reference/ruby/signal-wire/rest/namespaces/calling-namespace/transfer)
- [`update`](/reference/ruby/signal-wire/rest/namespaces/calling-namespace/update)
- [`user_event`](/reference/ruby/signal-wire/rest/namespaces/calling-namespace/user-event) — Custom events

## Source

[`lib/signalwire/rest/namespaces/calling.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/rest/namespaces/calling.rb)

Line 7.

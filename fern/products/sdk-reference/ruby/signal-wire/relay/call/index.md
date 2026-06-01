---
slug: "/reference/ruby/signal-wire/relay/call"
title: "Call"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "class"
  language: "ruby"
  qualified_name: "SignalWire::Relay::Call"
  parent: "SignalWire::Relay"
  module: "SignalWire.Relay"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/relay/call.rb"
  visibility: "public"
---
# `Call`

Represents a live RELAY call.

Created by RelayClient on inbound calling.call.receive events or
outbound dial responses.

## Signature

```ruby
class Call < Object
```

## Inheritance

**Extends:** `Object`

## Methods

- [`_dispatch_event`](/reference/ruby/signal-wire/relay/call/dispatch-event) — Called by RelayClient when an event arrives for this call.
- [`_execute`](/reference/ruby/signal-wire/relay/call/execute) — Send a calling.<method> JSON-RPC request for this call.
- [`_start_action`](/reference/ruby/signal-wire/relay/call/start-action) — ------------------------------------------------------------------ Action helper ------------------------------------------------------------------
- [`ai`](/reference/ruby/signal-wire/relay/call/ai) — ------------------------------------------------------------------ AI (returns AIAction) ------------------------------------------------------------------
- [`ai_hold`](/reference/ruby/signal-wire/relay/call/ai-hold)
- [`ai_message`](/reference/ruby/signal-wire/relay/call/ai-message) — ------------------------------------------------------------------ AI ------------------------------------------------------------------
- [`ai_unhold`](/reference/ruby/signal-wire/relay/call/ai-unhold)
- [`amazon_bedrock`](/reference/ruby/signal-wire/relay/call/amazon-bedrock)
- [`answer`](/reference/ruby/signal-wire/relay/call/answer) — ------------------------------------------------------------------ Call lifecycle methods ------------------------------------------------------------------
- [`bind_digit`](/reference/ruby/signal-wire/relay/call/bind-digit) — ------------------------------------------------------------------ Digit binding ------------------------------------------------------------------
- [`call_id`](/reference/ruby/signal-wire/relay/call/call-id) — Returns the value of attribute call\_id.
- [`clear_digit_bindings`](/reference/ruby/signal-wire/relay/call/clear-digit-bindings)
- [`collect`](/reference/ruby/signal-wire/relay/call/collect)
- [`connect`](/reference/ruby/signal-wire/relay/call/connect) — ------------------------------------------------------------------ Connect ------------------------------------------------------------------
- [`context`](/reference/ruby/signal-wire/relay/call/context) — Returns the value of attribute context.
- [`denoise`](/reference/ruby/signal-wire/relay/call/denoise) — ------------------------------------------------------------------ Denoise ------------------------------------------------------------------
- [`denoise_stop`](/reference/ruby/signal-wire/relay/call/denoise-stop)
- [`detect`](/reference/ruby/signal-wire/relay/call/detect) — ------------------------------------------------------------------ Detect ------------------------------------------------------------------
- [`device`](/reference/ruby/signal-wire/relay/call/device) — Returns the value of attribute device.
- [`direction`](/reference/ruby/signal-wire/relay/call/direction) — Returns the value of attribute direction.
- [`disconnect`](/reference/ruby/signal-wire/relay/call/disconnect)
- [`echo`](/reference/ruby/signal-wire/relay/call/echo) — ------------------------------------------------------------------ Echo ------------------------------------------------------------------
- [`ended?`](/reference/ruby/signal-wire/relay/call/ended)
- [`hangup`](/reference/ruby/signal-wire/relay/call/hangup)
- [`hold`](/reference/ruby/signal-wire/relay/call/hold) — ------------------------------------------------------------------ Hold / Unhold ------------------------------------------------------------------
- [`initialize`](/reference/ruby/signal-wire/relay/call/initialize)
- [`inspect`](/reference/ruby/signal-wire/relay/call/inspect)
- [`join_conference`](/reference/ruby/signal-wire/relay/call/join-conference) — ------------------------------------------------------------------ Conference ------------------------------------------------------------------
- [`join_room`](/reference/ruby/signal-wire/relay/call/join-room) — ------------------------------------------------------------------ Room ------------------------------------------------------------------
- [`leave_conference`](/reference/ruby/signal-wire/relay/call/leave-conference)
- [`leave_room`](/reference/ruby/signal-wire/relay/call/leave-room)
- [`live_transcribe`](/reference/ruby/signal-wire/relay/call/live-transcribe) — ------------------------------------------------------------------ Live transcribe / translate ------------------------------------------------------------------
- [`live_translate`](/reference/ruby/signal-wire/relay/call/live-translate)
- [`node_id`](/reference/ruby/signal-wire/relay/call/node-id) — Returns the value of attribute node\_id.
- [`on`](/reference/ruby/signal-wire/relay/call/on) — Register an event listener for this call.
- [`pass_call`](/reference/ruby/signal-wire/relay/call/pass-call)
- [`pay`](/reference/ruby/signal-wire/relay/call/pay) — ------------------------------------------------------------------ Pay ------------------------------------------------------------------
- [`play`](/reference/ruby/signal-wire/relay/call/play) — ------------------------------------------------------------------ Audio playback (returns PlayAction) ------------------------------------------------------------------
- [`play_and_collect`](/reference/ruby/signal-wire/relay/call/play-and-collect) — ------------------------------------------------------------------ Input collection ------------------------------------------------------------------
- [`project_id`](/reference/ruby/signal-wire/relay/call/project-id) — Returns the value of attribute project\_id.
- [`queue_enter`](/reference/ruby/signal-wire/relay/call/queue-enter) — ------------------------------------------------------------------ Queue ------------------------------------------------------------------
- [`queue_leave`](/reference/ruby/signal-wire/relay/call/queue-leave)
- [`receive_fax`](/reference/ruby/signal-wire/relay/call/receive-fax)
- [`record`](/reference/ruby/signal-wire/relay/call/record) — ------------------------------------------------------------------ Recording (returns RecordAction) ------------------------------------------------------------------
- [`refer`](/reference/ruby/signal-wire/relay/call/refer) — ------------------------------------------------------------------ Refer (SIP REFER) ------------------------------------------------------------------
- [`segment_id`](/reference/ruby/signal-wire/relay/call/segment-id) — Returns the value of attribute segment\_id.
- [`send_digits`](/reference/ruby/signal-wire/relay/call/send-digits) — ------------------------------------------------------------------ Send digits ------------------------------------------------------------------
- [`send_fax`](/reference/ruby/signal-wire/relay/call/send-fax) — ------------------------------------------------------------------ Fax ------------------------------------------------------------------
- [`state`](/reference/ruby/signal-wire/relay/call/state) — Returns the value of attribute state.
- [`state=`](/reference/ruby/signal-wire/relay/call/state__2) — Sets the attribute state
- [`stream`](/reference/ruby/signal-wire/relay/call/stream) — ------------------------------------------------------------------ Stream ------------------------------------------------------------------
- [`tag`](/reference/ruby/signal-wire/relay/call/tag) — Returns the value of attribute tag.
- [`tap_audio`](/reference/ruby/signal-wire/relay/call/tap-audio) — ------------------------------------------------------------------ Tap ------------------------------------------------------------------
- [`to_s`](/reference/ruby/signal-wire/relay/call/to-s)
- [`transcribe`](/reference/ruby/signal-wire/relay/call/transcribe) — ------------------------------------------------------------------ Transcribe ------------------------------------------------------------------
- [`transfer`](/reference/ruby/signal-wire/relay/call/transfer) — ------------------------------------------------------------------ Transfer ------------------------------------------------------------------
- [`unhold`](/reference/ruby/signal-wire/relay/call/unhold)
- [`user_event`](/reference/ruby/signal-wire/relay/call/user-event) — ------------------------------------------------------------------ User events ------------------------------------------------------------------
- [`wait_for_ended`](/reference/ruby/signal-wire/relay/call/wait-for-ended) — Wait for the call to reach the ended state.

## Source

[`lib/signalwire/relay/call.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/relay/call.rb)

Line 11.

---
slug: "/reference/python/signalwire/relay/call/call"
title: "Call"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.relay.call.Call"
  parent: "signalwire.relay.call"
  module: "signalwire.relay.call"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/call.py"
---
# `Call`

Represents a live RELAY call.

Created by RelayClient on inbound `calling.call.receive` events or
outbound `dial`/`begin` responses.

## Signature

```python
class Call
```

## Properties

| Name         | Type         | Required | Default | Description |
| ------------ | ------------ | -------- | ------- | ----------- |
| `call_id`    | `call_id`    | yes      | —       | —           |
| `context`    | `context`    | yes      | —       | —           |
| `device`     | `device`     | yes      | —       | —           |
| `direction`  | `direction`  | yes      | —       | —           |
| `node_id`    | `node_id`    | yes      | —       | —           |
| `project_id` | `project_id` | yes      | —       | —           |
| `segment_id` | `segment_id` | yes      | —       | —           |
| `state`      | `state`      | yes      | —       | —           |
| `tag`        | `tag`        | yes      | —       | —           |

## Methods

- [`__init__`](/reference/python/signalwire/relay/call/call/init)
- [`__repr__`](/reference/python/signalwire/relay/call/call/repr)
- [`ai`](/reference/python/signalwire/relay/call/call/ai) — Start an AI agent session on the call. Returns an AIAction.
- [`ai_hold`](/reference/python/signalwire/relay/call/call/ai-hold) — Put an AI agent session on hold.
- [`ai_message`](/reference/python/signalwire/relay/call/call/ai-message) — Send a message to an active AI agent session.
- [`ai_unhold`](/reference/python/signalwire/relay/call/call/ai-unhold) — Resume an AI agent session from hold.
- [`amazon_bedrock`](/reference/python/signalwire/relay/call/call/amazon-bedrock) — Connect to an Amazon Bedrock AI agent.
- [`answer`](/reference/python/signalwire/relay/call/call/answer) — Answer an inbound call.
- [`bind_digit`](/reference/python/signalwire/relay/call/call/bind-digit) — Bind a DTMF digit sequence to trigger a RELAY method.
- [`clear_digit_bindings`](/reference/python/signalwire/relay/call/call/clear-digit-bindings) — Clear all digit bindings, optionally filtered by realm.
- [`collect`](/reference/python/signalwire/relay/call/call/collect) — Collect digit/speech input without playing media.
- [`connect`](/reference/python/signalwire/relay/call/call/connect) — Bridge the call to one or more destinations.
- [`denoise`](/reference/python/signalwire/relay/call/call/denoise) — Start noise reduction on the call.
- [`denoise_stop`](/reference/python/signalwire/relay/call/call/denoise-stop) — Stop noise reduction on the call.
- [`detect`](/reference/python/signalwire/relay/call/call/detect) — Start audio detection (machine, fax, digit). Returns a DetectAction.
- [`disconnect`](/reference/python/signalwire/relay/call/call/disconnect) — Disconnect (unbridge) a connected call.
- [`echo`](/reference/python/signalwire/relay/call/call/echo) — Echo audio back to the caller (useful for testing).
- [`hangup`](/reference/python/signalwire/relay/call/call/hangup) — End/hang up the call.
- [`hold`](/reference/python/signalwire/relay/call/call/hold) — Put the call on hold.
- [`join_conference`](/reference/python/signalwire/relay/call/call/join-conference) — Join an ad-hoc audio conference.
- [`join_room`](/reference/python/signalwire/relay/call/call/join-room) — Join a video/audio room.
- [`leave_conference`](/reference/python/signalwire/relay/call/call/leave-conference) — Leave an audio conference.
- [`leave_room`](/reference/python/signalwire/relay/call/call/leave-room) — Leave the current room.
- [`live_transcribe`](/reference/python/signalwire/relay/call/call/live-transcribe) — Start or stop live transcription on the call.
- [`live_translate`](/reference/python/signalwire/relay/call/call/live-translate) — Start or stop live translation on the call.
- [`on`](/reference/python/signalwire/relay/call/call/on) — Register an event listener for this call.
- [`pass_`](/reference/python/signalwire/relay/call/call/pass) — Decline control of an inbound call, returning it to routing.
- [`pay`](/reference/python/signalwire/relay/call/call/pay) — Start a payment collection. Returns a PayAction.
- [`play`](/reference/python/signalwire/relay/call/call/play) — Play audio content. Returns a PlayAction for stop/pause/resume/wait.
- [`play_and_collect`](/reference/python/signalwire/relay/call/call/play-and-collect) — Play audio and collect digit/speech input.
- [`queue_enter`](/reference/python/signalwire/relay/call/call/queue-enter) — Place the call in a queue.
- [`queue_leave`](/reference/python/signalwire/relay/call/call/queue-leave) — Remove the call from a queue.
- [`receive_fax`](/reference/python/signalwire/relay/call/call/receive-fax) — Receive a fax. Returns a FaxAction.
- [`record`](/reference/python/signalwire/relay/call/call/record) — Record audio from the call. Returns a RecordAction.
- [`refer`](/reference/python/signalwire/relay/call/call/refer) — Transfer a SIP call to an external SIP endpoint via REFER.
- [`send_digits`](/reference/python/signalwire/relay/call/call/send-digits) — Send DTMF digits on the call.
- [`send_fax`](/reference/python/signalwire/relay/call/call/send-fax) — Send a fax document. Returns a FaxAction.
- [`stream`](/reference/python/signalwire/relay/call/call/stream) — Start streaming call audio to a WebSocket endpoint. Returns a StreamAction.
- [`tap`](/reference/python/signalwire/relay/call/call/tap) — Intercept call media and stream it. Returns a TapAction.
- [`transcribe`](/reference/python/signalwire/relay/call/call/transcribe) — Start transcribing the call. Returns a TranscribeAction.
- [`transfer`](/reference/python/signalwire/relay/call/call/transfer) — Transfer call control to another RELAY app or SWML script.
- [`unhold`](/reference/python/signalwire/relay/call/call/unhold) — Release the call from hold.
- [`user_event`](/reference/python/signalwire/relay/call/call/user-event) — Send a custom user-defined event.
- [`wait_for`](/reference/python/signalwire/relay/call/call/wait-for) — Wait for a specific event, optionally filtered by predicate.
- [`wait_for_ended`](/reference/python/signalwire/relay/call/call/wait-for-ended) — Wait for the call to reach the ended state.

## Source

[`/src/signalwire/signalwire/relay/call.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/call.py)

Line 284.

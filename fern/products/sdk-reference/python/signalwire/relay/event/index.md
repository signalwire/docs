---
slug: "/reference/python/signalwire/relay/event"
title: "event"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "module"
  language: "python"
  qualified_name: "signalwire.relay.event"
  parent: "signalwire.relay"
  module: "signalwire.relay"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/event.py"
---
# `event`

Typed event wrappers for RELAY calling events.

These are convenience dataclasses over raw event dicts. All Call event handlers
also accept the raw dict, so these are optional.

## Signature

```python
module event
```

## Constants

| Name              | Type                          | Required | Default | Description |
| ----------------- | ----------------------------- | -------- | ------- | ----------- |
| `EVENT_CLASS_MAP` | `dict[str, type[RelayEvent]]` | yes      | —       | —           |

## Functions

- [`parse_event`](/reference/python/signalwire/relay/event/parse-event) — Parse a raw signalwire.event params dict into a typed event object.

## Classes

- [`CallingErrorEvent`](/reference/python/signalwire/relay/event/calling-error-event) — Event for calling.error.
- [`CallReceiveEvent`](/reference/python/signalwire/relay/event/call-receive-event) — Event for calling.call.receive — inbound call notification.
- [`CallStateEvent`](/reference/python/signalwire/relay/event/call-state-event) — Event for calling.call.state.
- [`CollectEvent`](/reference/python/signalwire/relay/event/collect-event) — Event for calling.call.collect.
- [`ConferenceEvent`](/reference/python/signalwire/relay/event/conference-event) — Event for calling.conference.
- [`ConnectEvent`](/reference/python/signalwire/relay/event/connect-event) — Event for calling.call.connect.
- [`DenoiseEvent`](/reference/python/signalwire/relay/event/denoise-event) — Event for calling.call.denoise.
- [`DetectEvent`](/reference/python/signalwire/relay/event/detect-event) — Event for calling.call.detect.
- [`DialEvent`](/reference/python/signalwire/relay/event/dial-event) — Event for calling.call.dial.
- [`EchoEvent`](/reference/python/signalwire/relay/event/echo-event) — Event for calling.call.echo.
- [`FaxEvent`](/reference/python/signalwire/relay/event/fax-event) — Event for calling.call.fax.
- [`HoldEvent`](/reference/python/signalwire/relay/event/hold-event) — Event for calling.call.hold.
- [`MessageReceiveEvent`](/reference/python/signalwire/relay/event/message-receive-event) — Event for messaging.receive — inbound message notification.
- [`MessageStateEvent`](/reference/python/signalwire/relay/event/message-state-event) — Event for messaging.state — outbound message state change.
- [`PayEvent`](/reference/python/signalwire/relay/event/pay-event) — Event for calling.call.pay.
- [`PlayEvent`](/reference/python/signalwire/relay/event/play-event) — Event for calling.call.play.
- [`QueueEvent`](/reference/python/signalwire/relay/event/queue-event) — Event for calling.call.queue.
- [`RecordEvent`](/reference/python/signalwire/relay/event/record-event) — Event for calling.call.record.
- [`ReferEvent`](/reference/python/signalwire/relay/event/refer-event) — Event for calling.call.refer.
- [`RelayEvent`](/reference/python/signalwire/relay/event/relay-event) — Base event — wraps the raw params dict from a signalwire.event message.
- [`SendDigitsEvent`](/reference/python/signalwire/relay/event/send-digits-event) — Event for calling.call.send\_digits.
- [`StreamEvent`](/reference/python/signalwire/relay/event/stream-event) — Event for calling.call.stream.
- [`TapEvent`](/reference/python/signalwire/relay/event/tap-event) — Event for calling.call.tap.
- [`TranscribeEvent`](/reference/python/signalwire/relay/event/transcribe-event) — Event for calling.call.transcribe.

## Source

[`/src/signalwire/signalwire/relay/event.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/event.py)

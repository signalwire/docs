---
slug: "/reference/typescript/relay/relay-event"
title: "RelayEvent"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "module"
  language: "typescript"
  qualified_name: "relay.RelayEvent"
  module: "relay"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/RelayEvent.ts"
---
# `RelayEvent`

## Signature

```typescript
module RelayEvent
```

## Constants

| Name              | Type                         | Required | Default | Description                                                                                                                                                                              |
| ----------------- | ---------------------------- | -------- | ------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `EVENT_CLASS_MAP` | `Record<string, EventClass>` | yes      | —       | Maps RELAY `event_type` strings to the typed event subclass that builds its wrapper. Used by [parseEvent](/reference/typescript/relay/relay-event/parse-event) to dispatch raw payloads. |

## Functions

- [`parseEvent`](/reference/typescript/relay/relay-event/parse-event) — Parse a raw signalwire.event params dict into a typed event object.

## Type Aliases

- [`EventClass`](/reference/typescript/relay/relay-event/event-class) — Structural type for an event class that exposes a `fromPayload` factory.

## Classes

- [`CallingErrorEvent`](/reference/typescript/relay/relay-event/calling-error-event) — `calling.error` — platform-emitted error against the calling namespace.
- [`CallReceiveEvent`](/reference/typescript/relay/relay-event/call-receive-event) — `calling.call.receive` — fires when an inbound call arrives on a subscribed context.
- [`CallStateEvent`](/reference/typescript/relay/relay-event/call-state-event) — `calling.call.state` — fires on every lifecycle transition (created, ringing, answered, ending, ended).
- [`CollectEvent`](/reference/typescript/relay/relay-event/collect-event) — `calling.call.collect` — caller input (DTMF or speech) collected by a collect action.
- [`ConferenceEvent`](/reference/typescript/relay/relay-event/conference-event) — `calling.conference` — conference lifecycle change (created, active, ended).
- [`ConnectEvent`](/reference/typescript/relay/relay-event/connect-event) — `calling.call.connect` — state transition when one call connects to another (dialplan/bridge).
- [`DenoiseEvent`](/reference/typescript/relay/relay-event/denoise-event) — `calling.call.denoise` — noise-reduction on/off confirmation.
- [`DetectEvent`](/reference/typescript/relay/relay-event/detect-event) — `calling.call.detect` — answering-machine / fax / DTMF detection result.
- [`DialEvent`](/reference/typescript/relay/relay-event/dial-event) — `calling.call.dial` — outbound dial progress (answered, failed, no-answer, etc.).
- [`EchoEvent`](/reference/typescript/relay/relay-event/echo-event) — `calling.call.echo` — test/diagnostic echo reflection from the server.
- [`FaxEvent`](/reference/typescript/relay/relay-event/fax-event) — `calling.call.fax` — fax send/receive progress update.
- [`HoldEvent`](/reference/typescript/relay/relay-event/hold-event) — `calling.call.hold` — hold/unhold state change on the call.
- [`MessageReceiveEvent`](/reference/typescript/relay/relay-event/message-receive-event) — `messaging.receive` — inbound SMS/MMS received on a subscribed context.
- [`MessageStateEvent`](/reference/typescript/relay/relay-event/message-state-event) — `messaging.state` — state change for an outbound message (queued → sent → delivered/failed).
- [`PayEvent`](/reference/typescript/relay/relay-event/pay-event) — `calling.call.pay` — PCI-compliant payment collection progress update.
- [`PlayEvent`](/reference/typescript/relay/relay-event/play-event) — `calling.call.play` — play-media action state change (`playing`, `paused`, `finished`, `error`).
- [`QueueEvent`](/reference/typescript/relay/relay-event/queue-event) — `calling.call.queue` — call-queue position update (queued, waiting, member answered, timed out).
- [`RecordEvent`](/reference/typescript/relay/relay-event/record-event) — `calling.call.record` — recording state change with final URL, duration, and size when finished.
- [`ReferEvent`](/reference/typescript/relay/relay-event/refer-event) — `calling.call.refer` — SIP REFER result (off-platform transfer response codes).
- [`RelayEvent`](/reference/typescript/relay/relay-event/relay-event) — Base class for all typed RELAY events.
- [`SendDigitsEvent`](/reference/typescript/relay/relay-event/send-digits-event) — `calling.call.send_digits` — progress update for DTMF digits sent out on a call.
- [`StreamEvent`](/reference/typescript/relay/relay-event/stream-event) — `calling.call.stream` — outbound media stream state change (e.g. RTMP/WebSocket streaming).
- [`TapEvent`](/reference/typescript/relay/relay-event/tap-event) — `calling.call.tap` — media tap state change (audio mirror to an external endpoint).
- [`TranscribeEvent`](/reference/typescript/relay/relay-event/transcribe-event) — `calling.call.transcribe` — transcription state change and final URL/duration when finished.

## Source

[`src/relay/RelayEvent.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/RelayEvent.ts)

Line 1.

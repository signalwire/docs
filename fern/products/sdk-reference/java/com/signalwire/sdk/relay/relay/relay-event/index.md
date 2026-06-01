---
slug: "/reference/java/com/signalwire/sdk/relay/relay/relay-event"
title: "RelayEvent"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "class"
  language: "java"
  qualified_name: "com.signalwire.sdk.relay.RelayEvent"
  parent: "com.signalwire.sdk.relay"
  module: "com.signalwire.sdk.relay"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/relay/RelayEvent.java"
  visibility: "public"
---
# `RelayEvent`

Base class for all RELAY events.

<p>
 Events arrive as `signalwire.event` messages with nested params:
 <pre>
 {
   "params": {
     "event_type": "calling.call.play",
     "timestamp": 123457.1234,
     "params": { "call_id": "...", "control_id": "...", "state": "finished" }
   }
 }
 </pre>
 Subclasses provide typed access to specific event payloads.

## Signature

```java
public class RelayEvent
```

## Methods

- [`<init>`](/reference/java/com/signalwire/sdk/relay/relay/relay-event/init)
- [`fromRawParams`](/reference/java/com/signalwire/sdk/relay/relay/relay-event/from-raw-params) — Create the appropriate event subclass from raw JSON-RPC event params.
- [`getEventType`](/reference/java/com/signalwire/sdk/relay/relay/relay-event/get-event-type)
- [`getParams`](/reference/java/com/signalwire/sdk/relay/relay/relay-event/get-params)
- [`getStringParam`](/reference/java/com/signalwire/sdk/relay/relay/relay-event/get-string-param)
- [`getTimestamp`](/reference/java/com/signalwire/sdk/relay/relay/relay-event/get-timestamp)
- [`toString`](/reference/java/com/signalwire/sdk/relay/relay/relay-event/to-string)

## Classes

- [`AuthorizationStateEvent`](/reference/java/com/signalwire/sdk/relay/relay/relay-event/authorization-state-event) — Authorization state event (`signalwire.authorization.state`).
- [`CallCollectEvent`](/reference/java/com/signalwire/sdk/relay/relay/relay-event/call-collect-event) — Collect event (`calling.call.collect`).
- [`CallConnectEvent`](/reference/java/com/signalwire/sdk/relay/relay/relay-event/call-connect-event) — Connect event (`calling.call.connect`).
- [`CallDetectEvent`](/reference/java/com/signalwire/sdk/relay/relay/relay-event/call-detect-event) — Detect event (`calling.call.detect`).
- [`CallDialEvent`](/reference/java/com/signalwire/sdk/relay/relay/relay-event/call-dial-event) — Dial completion event (`calling.call.dial`).
- [`CallFaxEvent`](/reference/java/com/signalwire/sdk/relay/relay/relay-event/call-fax-event) — Fax event (`calling.call.fax`).
- [`CallPayEvent`](/reference/java/com/signalwire/sdk/relay/relay/relay-event/call-pay-event) — Pay event (`calling.call.pay`).
- [`CallPlayEvent`](/reference/java/com/signalwire/sdk/relay/relay/relay-event/call-play-event) — Play event (`calling.call.play`).
- [`CallReceiveEvent`](/reference/java/com/signalwire/sdk/relay/relay/relay-event/call-receive-event) — Inbound call event (`calling.call.receive`).
- [`CallRecordEvent`](/reference/java/com/signalwire/sdk/relay/relay/relay-event/call-record-event) — Record event (`calling.call.record`).
- [`CallReferEvent`](/reference/java/com/signalwire/sdk/relay/relay/relay-event/call-refer-event) — Refer event (`calling.call.refer`).
- [`CallSendDigitsEvent`](/reference/java/com/signalwire/sdk/relay/relay/relay-event/call-send-digits-event) — Send digits event (`calling.call.send_digits`).
- [`CallStateEvent`](/reference/java/com/signalwire/sdk/relay/relay/relay-event/call-state-event) — Call state change event (`calling.call.state`).
- [`CallStreamEvent`](/reference/java/com/signalwire/sdk/relay/relay/relay-event/call-stream-event) — Stream event (`calling.call.stream`).
- [`CallTapEvent`](/reference/java/com/signalwire/sdk/relay/relay/relay-event/call-tap-event) — Tap event (`calling.call.tap`).
- [`CallTranscribeEvent`](/reference/java/com/signalwire/sdk/relay/relay/relay-event/call-transcribe-event) — Transcribe event (`calling.call.transcribe`).
- [`ConferenceEvent`](/reference/java/com/signalwire/sdk/relay/relay/relay-event/conference-event) — Conference event (`calling.conference`).
- [`MessagingReceiveEvent`](/reference/java/com/signalwire/sdk/relay/relay/relay-event/messaging-receive-event) — Inbound messaging event (`messaging.receive`).
- [`MessagingStateEvent`](/reference/java/com/signalwire/sdk/relay/relay/relay-event/messaging-state-event) — Outbound messaging state event (`messaging.state`).
- [`QueueEvent`](/reference/java/com/signalwire/sdk/relay/relay/relay-event/queue-event) — Queue event (`calling.queue`).

## Source

[`src/main/java/com/signalwire/sdk/relay/RelayEvent.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/relay/RelayEvent.java)

Line 28.

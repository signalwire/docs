---
slug: "/reference/java/com/signalwire/sdk/relay/relay/call"
title: "Call"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "class"
  language: "java"
  qualified_name: "com.signalwire.sdk.relay.Call"
  parent: "com.signalwire.sdk.relay"
  module: "com.signalwire.sdk.relay"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/relay/Call.java"
  visibility: "public"
---
# `Call`

Represents a RELAY call with 30+ methods organized by category.

<p>
 Methods are grouped into:
 <ul>
   <li><b>Simple fire-and-response</b>: answer, hangup, pass, hold, etc.</li>
   <li><b>Action-based</b>: play, record, detect, collect, etc. (return `Action`)</li>
   <li><b>Connection</b>: connect, disconnect, transfer</li>
   <li><b>Conference</b>: joinConference, leaveConference</li>
   <li><b>AI</b>: ai, aiMessage, aiHold, aiUnhold, amazonBedrock</li>
 </ul>

Event routing: the `RelayClient` routes events to calls by `call_id`.
Each call maintains an `actions` map keyed by `control_id` for action events.

## Signature

```java
public class Call
```

## Methods

- [`<init>`](/reference/java/com/signalwire/sdk/relay/relay/call/init)
- [`ai`](/reference/java/com/signalwire/sdk/relay/relay/call/ai) — Start an AI agent on the call.
- [`aiHold`](/reference/java/com/signalwire/sdk/relay/relay/call/ai-hold) — Put AI on hold.
- [`aiMessage`](/reference/java/com/signalwire/sdk/relay/relay/call/ai-message) — Send a message to an active AI session.
- [`aiUnhold`](/reference/java/com/signalwire/sdk/relay/relay/call/ai-unhold) — Resume AI from hold.
- [`amazonBedrock`](/reference/java/com/signalwire/sdk/relay/relay/call/amazon-bedrock) — Start Amazon Bedrock AI on the call.
- [`answer`](/reference/java/com/signalwire/sdk/relay/relay/call/answer) — Answer the call.
- [`bindDigit`](/reference/java/com/signalwire/sdk/relay/relay/call/bind-digit) — Bind a digit sequence to a method.
- [`clearDigitBindings`](/reference/java/com/signalwire/sdk/relay/relay/call/clear-digit-bindings) — Clear digit bindings.
- [`collect`](/reference/java/com/signalwire/sdk/relay/relay/call/collect) — Collect digits or speech input.
- [`collectDigits`](/reference/java/com/signalwire/sdk/relay/relay/call/collect-digits) — Collect digits with an explicit control\_id (test helper).
- [`connect`](/reference/java/com/signalwire/sdk/relay/relay/call/connect) — Connect another device to this call.
- [`denoise`](/reference/java/com/signalwire/sdk/relay/relay/call/denoise) — Enable denoise on the call.
- [`denoiseStop`](/reference/java/com/signalwire/sdk/relay/relay/call/denoise-stop) — Disable denoise on the call.
- [`detect`](/reference/java/com/signalwire/sdk/relay/relay/call/detect) — Detect answering machine, fax, or digits.
- [`detectWith`](/reference/java/com/signalwire/sdk/relay/relay/call/detect-with) — Detect with an explicit control\_id (test helper).
- [`disconnect`](/reference/java/com/signalwire/sdk/relay/relay/call/disconnect) — Disconnect all connected calls.
- [`dispatchEvent`](/reference/java/com/signalwire/sdk/relay/relay/call/dispatch-event) — Dispatch an event to this call.
- [`echo`](/reference/java/com/signalwire/sdk/relay/relay/call/echo) — Start echo on the call.
- [`getAction`](/reference/java/com/signalwire/sdk/relay/relay/call/get-action) — Get an action by control\_id.
- [`getCallId`](/reference/java/com/signalwire/sdk/relay/relay/call/get-call-id)
- [`getDevice`](/reference/java/com/signalwire/sdk/relay/relay/call/get-device)
- [`getDirection`](/reference/java/com/signalwire/sdk/relay/relay/call/get-direction)
- [`getEndReason`](/reference/java/com/signalwire/sdk/relay/relay/call/get-end-reason)
- [`getNodeId`](/reference/java/com/signalwire/sdk/relay/relay/call/get-node-id)
- [`getState`](/reference/java/com/signalwire/sdk/relay/relay/call/get-state)
- [`getTag`](/reference/java/com/signalwire/sdk/relay/relay/call/get-tag)
- [`hangup`](/reference/java/com/signalwire/sdk/relay/relay/call/hangup) — Hang up the call.
- [`hold`](/reference/java/com/signalwire/sdk/relay/relay/call/hold) — Put the call on hold.
- [`isEnded`](/reference/java/com/signalwire/sdk/relay/relay/call/is-ended)
- [`joinConference`](/reference/java/com/signalwire/sdk/relay/relay/call/join-conference) — Join a conference.
- [`joinRoom`](/reference/java/com/signalwire/sdk/relay/relay/call/join-room) — Join a room.
- [`leaveConference`](/reference/java/com/signalwire/sdk/relay/relay/call/leave-conference) — Leave a conference.
- [`leaveRoom`](/reference/java/com/signalwire/sdk/relay/relay/call/leave-room) — Leave a room.
- [`liveTranscribe`](/reference/java/com/signalwire/sdk/relay/relay/call/live-transcribe) — Start live transcription.
- [`liveTranslate`](/reference/java/com/signalwire/sdk/relay/relay/call/live-translate) — Start live translation.
- [`on`](/reference/java/com/signalwire/sdk/relay/relay/call/on) — Register an event listener on this call.
- [`pass`](/reference/java/com/signalwire/sdk/relay/relay/call/pass) — Pass on an inbound call offer.
- [`pay`](/reference/java/com/signalwire/sdk/relay/relay/call/pay) — Process payment via DTMF.
- [`play`](/reference/java/com/signalwire/sdk/relay/relay/call/play) — Play media on the call.
- [`playAndCollect`](/reference/java/com/signalwire/sdk/relay/relay/call/play-and-collect) — Play media and collect input.
- [`queueEnter`](/reference/java/com/signalwire/sdk/relay/relay/call/queue-enter) — Enter a queue.
- [`queueLeave`](/reference/java/com/signalwire/sdk/relay/relay/call/queue-leave) — Leave a queue.
- [`receiveFax`](/reference/java/com/signalwire/sdk/relay/relay/call/receive-fax) — Receive a fax.
- [`record`](/reference/java/com/signalwire/sdk/relay/relay/call/record) — Record the call.
- [`recordAudio`](/reference/java/com/signalwire/sdk/relay/relay/call/record-audio) — Record with an explicit control\_id (test helper).
- [`refer`](/reference/java/com/signalwire/sdk/relay/relay/call/refer) — SIP REFER transfer.
- [`registerAction`](/reference/java/com/signalwire/sdk/relay/relay/call/register-action) — Register an action by control\_id.
- [`resolveAllActions`](/reference/java/com/signalwire/sdk/relay/relay/call/resolve-all-actions) — Resolve all pending actions (e.g., on call ended or call-gone).
- [`sendDigits`](/reference/java/com/signalwire/sdk/relay/relay/call/send-digits) — Send DTMF digits.
- [`sendFax`](/reference/java/com/signalwire/sdk/relay/relay/call/send-fax) — Send a fax.
- [`setClient`](/reference/java/com/signalwire/sdk/relay/relay/call/set-client)
- [`setDevice`](/reference/java/com/signalwire/sdk/relay/relay/call/set-device)
- [`setDirection`](/reference/java/com/signalwire/sdk/relay/relay/call/set-direction)
- [`setEndReason`](/reference/java/com/signalwire/sdk/relay/relay/call/set-end-reason)
- [`setNodeId`](/reference/java/com/signalwire/sdk/relay/relay/call/set-node-id)
- [`setState`](/reference/java/com/signalwire/sdk/relay/relay/call/set-state)
- [`setTag`](/reference/java/com/signalwire/sdk/relay/relay/call/set-tag)
- [`stream`](/reference/java/com/signalwire/sdk/relay/relay/call/stream) — Start streaming audio from the call.
- [`tap`](/reference/java/com/signalwire/sdk/relay/relay/call/tap) — Tap audio from the call.
- [`toString`](/reference/java/com/signalwire/sdk/relay/relay/call/to-string)
- [`transcribe`](/reference/java/com/signalwire/sdk/relay/relay/call/transcribe) — Start transcription on the call.
- [`transfer`](/reference/java/com/signalwire/sdk/relay/relay/call/transfer) — Transfer the call.
- [`unhold`](/reference/java/com/signalwire/sdk/relay/relay/call/unhold) — Take the call off hold.
- [`userEvent`](/reference/java/com/signalwire/sdk/relay/relay/call/user-event) — Send a user event.

## Source

[`src/main/java/com/signalwire/sdk/relay/Call.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/relay/Call.java)

Line 31.

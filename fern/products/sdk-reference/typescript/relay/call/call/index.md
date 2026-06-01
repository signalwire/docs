---
slug: "/reference/typescript/relay/call/call"
title: "Call"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "class"
  language: "typescript"
  qualified_name: "relay.Call.Call"
  parent: "relay.Call"
  module: "relay.Call"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Call.ts"
---
# `Call`

Live RELAY call with command methods.

Don't construct directly — `Call` instances are created by [RelayClient](/reference/typescript/relay/relay-client)
for inbound calls (delivered to your `onCall` handler) and for outbound dials.

Each command method (`answer()`, `play()`, `record()`, etc.) returns when the
platform acknowledges the command; event-driven completion is exposed via
[Action](/reference/typescript/relay/action) objects returned from the async "play/record/..." variants.

## Signature

```typescript
class Call
```

## Examples

```typescript
client.onCall(async (call) => {
  await call.answer();
  const play = await call.playAsync({ play: [{ type: 'tts', text: 'Hello!' }] });
  await play.wait();
  await call.hangup();
});
```

## See Also

- \- \[RelayClient]\(/reference/typescript/relay/relay-client)
  \- \[Action]\(/reference/typescript/relay/action)

## Properties

| Name        | Type                  | Required | Default | Description                                                       |
| ----------- | --------------------- | -------- | ------- | ----------------------------------------------------------------- |
| `callId`    | `string`              | yes      | —       | Unique call identifier assigned by the platform.                  |
| `context`   | `string`              | yes      | —       | RELAY context this call was received on.                          |
| `device`    | `Record<string, any>` | yes      | —       | Device descriptor the call is associated with (phone, SIP, etc.). |
| `direction` | `string`              | yes      | —       | `"inbound"` or `"outbound"`.                                      |
| `nodeId`    | `string`              | yes      | —       | RELAY node that owns this call.                                   |
| `projectId` | `string`              | yes      | —       | SignalWire project ID.                                            |
| `segmentId` | `string`              | yes      | —       | Call segment ID used for event correlation.                       |
| `state`     | `string`              | yes      | —       | Current call state (e.g. `"created"`, `"answered"`, `"ended"`).   |
| `tag`       | `string`              | yes      | —       | Opaque correlation tag attached at dial time.                     |

## Methods

- [`ai`](/reference/typescript/relay/call/call/ai) — Start an AI agent session on the call.
- [`aiHold`](/reference/typescript/relay/call/call/ai-hold) — Put the AI agent session on hold (pause turn-taking).
- [`aiMessage`](/reference/typescript/relay/call/call/ai-message) — Send a message into an active AI agent session.
- [`aiUnhold`](/reference/typescript/relay/call/call/ai-unhold) — Resume an AI agent session from hold.
- [`amazonBedrock`](/reference/typescript/relay/call/call/amazon-bedrock) — Connect the call to an Amazon Bedrock AI agent.
- [`answer`](/reference/typescript/relay/call/call/answer) — Answer an inbound call.
- [`bindDigit`](/reference/typescript/relay/call/call/bind-digit) — Bind a DTMF digit sequence to trigger a RELAY method automatically when the caller presses it.
- [`clearDigitBindings`](/reference/typescript/relay/call/call/clear-digit-bindings) — Clear all digit bindings, optionally filtered by realm.
- [`collect`](/reference/typescript/relay/call/call/collect) — Collect digit / speech input without playing media.
- [`connect`](/reference/typescript/relay/call/call/connect) — Bridge the call to one or more destinations.
- [`constructor`](/reference/typescript/relay/call/call/constructor)
- [`denoise`](/reference/typescript/relay/call/call/denoise) — Start noise reduction on the call.
- [`denoiseStop`](/reference/typescript/relay/call/call/denoise-stop) — Stop noise reduction on the call.
- [`detect`](/reference/typescript/relay/call/call/detect) — Start audio detection (answering machine, fax, DTMF).
- [`disconnect`](/reference/typescript/relay/call/call/disconnect) — Disconnect (unbridge) a connected call.
- [`echo`](/reference/typescript/relay/call/call/echo) — Echo audio back to the caller (useful for testing network round-trip).
- [`hangup`](/reference/typescript/relay/call/call/hangup) — End / hang up the call.
- [`hold`](/reference/typescript/relay/call/call/hold) — Put the call on hold.
- [`joinConference`](/reference/typescript/relay/call/call/join-conference) — Join an ad-hoc audio conference.
- [`joinRoom`](/reference/typescript/relay/call/call/join-room) — Join a video / audio room.
- [`leaveConference`](/reference/typescript/relay/call/call/leave-conference) — Leave an audio conference.
- [`leaveRoom`](/reference/typescript/relay/call/call/leave-room) — Leave the current room.
- [`liveTranscribe`](/reference/typescript/relay/call/call/live-transcribe) — Start or stop live transcription on the call.
- [`liveTranslate`](/reference/typescript/relay/call/call/live-translate) — Start or stop live translation on the call.
- [`on`](/reference/typescript/relay/call/call/on) — Register an event listener for this call.
- [`pass`](/reference/typescript/relay/call/call/pass) — Decline control of an inbound call, returning it to routing.
- [`pay`](/reference/typescript/relay/call/call/pay) — Start a PCI-compliant payment collection flow.
- [`play`](/reference/typescript/relay/call/call/play) — Play audio content on the call.
- [`playAndCollect`](/reference/typescript/relay/call/call/play-and-collect) — Play audio and collect digit / speech input in a single operation.
- [`queueEnter`](/reference/typescript/relay/call/call/queue-enter) — Place the call into a named queue.
- [`queueLeave`](/reference/typescript/relay/call/call/queue-leave) — Remove the call from a queue.
- [`receiveFax`](/reference/typescript/relay/call/call/receive-fax) — Receive a fax and save it server-side.
- [`record`](/reference/typescript/relay/call/call/record) — Record audio from the call.
- [`refer`](/reference/typescript/relay/call/call/refer) — Transfer a SIP call via REFER.
- [`sendDigits`](/reference/typescript/relay/call/call/send-digits) — Send DTMF digits on the call.
- [`sendFax`](/reference/typescript/relay/call/call/send-fax) — Send a fax document.
- [`stream`](/reference/typescript/relay/call/call/stream) — Start streaming call audio to a WebSocket endpoint.
- [`tap`](/reference/typescript/relay/call/call/tap) — Intercept call media and stream it to an external destination.
- [`toString`](/reference/typescript/relay/call/call/to-string) — Return a human-readable diagnostic string.
- [`transcribe`](/reference/typescript/relay/call/call/transcribe) — Start transcribing the call.
- [`transfer`](/reference/typescript/relay/call/call/transfer) — Transfer call control to another RELAY app or SWML script.
- [`unhold`](/reference/typescript/relay/call/call/unhold) — Release the call from hold.
- [`userEvent`](/reference/typescript/relay/call/call/user-event) — Emit a custom user-defined event on the call for your webhooks.
- [`waitFor`](/reference/typescript/relay/call/call/wait-for) — Wait for a specific event, optionally filtered by predicate.
- [`waitForEnded`](/reference/typescript/relay/call/call/wait-for-ended) — Wait for the call to reach the `ended` state.

## Source

[`src/relay/Call.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Call.ts)

Line 66.

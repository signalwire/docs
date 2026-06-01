---
slug: "/reference/typescript/rest/namespaces/calling/calling-namespace"
title: "CallingNamespace"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "class"
  language: "typescript"
  qualified_name: "rest.namespaces.calling.CallingNamespace"
  parent: "rest.namespaces.calling"
  module: "rest.namespaces.calling"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/calling.ts"
---
# `CallingNamespace`

REST call control — all 37 commands dispatched via a single POST endpoint.

Access via `client.calling.*`. Every method issues one command against a live
call by ID and returns the platform's JSON response.

Every command method shares the same shape:

- First argument (when present) is the target call's ID.
- Second argument is a platform-shaped `params` object — see the
  [Calling API reference](https://developer.signalwire.com/rest/signalwire-rest/endpoints/calling/)
  for the fields each command accepts.
- The method returns the JSON-decoded platform response.
- Throws [RestError](/reference/typescript/rest/rest-error) on any non-2xx HTTP response.

## Signature

```typescript
class CallingNamespace extends BaseResource
```

## Inheritance

**Extends:** `BaseResource`

## Examples

**Example 1**

```typescript
await client.calling.play(callId, {
  play: [{ type: 'audio', url: 'https://cdn.example.com/hold.mp3' }],
});
```

**Example 2**

```typescript
const rec = await client.calling.record(callId, { record: { audio: {} } });
// ... later ...
await client.calling.recordStop(callId, { control_id: rec.control_id });
```

## Methods

- [`aiHold`](/reference/typescript/rest/namespaces/calling/calling-namespace/ai-hold) — Put the AI session on hold (pause turn-taking).
- [`aiMessage`](/reference/typescript/rest/namespaces/calling/calling-namespace/ai-message) — Send a message into an active AI agent session.
- [`aiStop`](/reference/typescript/rest/namespaces/calling/calling-namespace/ai-stop) — Terminate the active AI session on a call.
- [`aiUnhold`](/reference/typescript/rest/namespaces/calling/calling-namespace/ai-unhold) — Resume an AI session that was on hold.
- [`collect`](/reference/typescript/rest/namespaces/calling/calling-namespace/collect) — Collect DTMF / speech input from the caller.
- [`collectStartInputTimers`](/reference/typescript/rest/namespaces/calling/calling-namespace/collect-start-input-timers) — Start input timers for a collect operation (useful when `initial_timeout` should be reset after media finishes playing).
- [`collectStop`](/reference/typescript/rest/namespaces/calling/calling-namespace/collect-stop) — Stop an in-progress collect operation.
- [`constructor`](/reference/typescript/rest/namespaces/calling/calling-namespace/constructor)
- [`denoise`](/reference/typescript/rest/namespaces/calling/calling-namespace/denoise) — Enable noise reduction on the call.
- [`denoiseStop`](/reference/typescript/rest/namespaces/calling/calling-namespace/denoise-stop) — Disable noise reduction.
- [`detect`](/reference/typescript/rest/namespaces/calling/calling-namespace/detect) — Run answering-machine / fax / DTMF detection.
- [`detectStop`](/reference/typescript/rest/namespaces/calling/calling-namespace/detect-stop) — Stop an active detect operation.
- [`dial`](/reference/typescript/rest/namespaces/calling/calling-namespace/dial) — Place an outbound call.
- [`disconnect`](/reference/typescript/rest/namespaces/calling/calling-namespace/disconnect) — Drop one leg from a call without ending the other.
- [`end`](/reference/typescript/rest/namespaces/calling/calling-namespace/end) — Gracefully end a call.
- [`liveTranscribe`](/reference/typescript/rest/namespaces/calling/calling-namespace/live-transcribe) — Start live transcription that emits events as speech is recognised.
- [`liveTranslate`](/reference/typescript/rest/namespaces/calling/calling-namespace/live-translate) — Start live translation between two languages.
- [`play`](/reference/typescript/rest/namespaces/calling/calling-namespace/play) — Start media playback on a call.
- [`playPause`](/reference/typescript/rest/namespaces/calling/calling-namespace/play-pause) — Pause active playback.
- [`playResume`](/reference/typescript/rest/namespaces/calling/calling-namespace/play-resume) — Resume paused playback.
- [`playStop`](/reference/typescript/rest/namespaces/calling/calling-namespace/play-stop) — Stop active playback.
- [`playVolume`](/reference/typescript/rest/namespaces/calling/calling-namespace/play-volume) — Adjust the playback volume.
- [`receiveFaxStop`](/reference/typescript/rest/namespaces/calling/calling-namespace/receive-fax-stop) — Stop a receive-fax operation mid-stream.
- [`record`](/reference/typescript/rest/namespaces/calling/calling-namespace/record) — Start recording a call.
- [`recordPause`](/reference/typescript/rest/namespaces/calling/calling-namespace/record-pause) — Pause an active recording.
- [`recordResume`](/reference/typescript/rest/namespaces/calling/calling-namespace/record-resume) — Resume a paused recording.
- [`recordStop`](/reference/typescript/rest/namespaces/calling/calling-namespace/record-stop) — Stop and finalise a recording.
- [`refer`](/reference/typescript/rest/namespaces/calling/calling-namespace/refer) — Send a SIP REFER to transfer a call outside the platform.
- [`sendFaxStop`](/reference/typescript/rest/namespaces/calling/calling-namespace/send-fax-stop) — Stop a send-fax operation mid-stream.
- [`stream`](/reference/typescript/rest/namespaces/calling/calling-namespace/stream) — Start an outbound media stream (typically to a WebSocket endpoint).
- [`streamStop`](/reference/typescript/rest/namespaces/calling/calling-namespace/stream-stop) — Stop an outbound media stream.
- [`tap`](/reference/typescript/rest/namespaces/calling/calling-namespace/tap) — Start a media tap (mirror audio to an external URI).
- [`tapStop`](/reference/typescript/rest/namespaces/calling/calling-namespace/tap-stop) — Stop an active media tap.
- [`transcribe`](/reference/typescript/rest/namespaces/calling/calling-namespace/transcribe) — Start real-time transcription on the call.
- [`transcribeStop`](/reference/typescript/rest/namespaces/calling/calling-namespace/transcribe-stop) — Stop real-time transcription.
- [`transfer`](/reference/typescript/rest/namespaces/calling/calling-namespace/transfer) — Transfer a call to another destination.
- [`update`](/reference/typescript/rest/namespaces/calling/calling-namespace/update) — Update properties on an in-progress call.
- [`userEvent`](/reference/typescript/rest/namespaces/calling/calling-namespace/user-event) — Emit a custom user event on the call for your webhooks.

## Source

[`src/rest/namespaces/calling.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/calling.ts)

Line 41.

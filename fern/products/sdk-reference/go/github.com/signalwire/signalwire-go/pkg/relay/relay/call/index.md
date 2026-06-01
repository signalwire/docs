---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/call"
title: "Call"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/relay.Call"
  parent: "github.com/signalwire/signalwire-go/pkg/relay"
  module: "github.com.signalwire.signalwire-go.pkg.relay"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/call.go"
---
# `Call`

Call represents an active voice call managed through the RELAY client. It exposes methods for every calling operation supported by SignalWire, grouped into logical categories: lifecycle, audio, recording, bridging, DTMF, detection, fax, tap, streaming, conferencing, AI, hold/denoise, room/queue, pay, and transcription.

## Signature

```go
type Call struct
```

## Methods

- [`AI`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/call/ai) — AI starts an AI session on the call. Use WithAIControlID for an explicit control\_id (matches Python's ai(control\_id=...)).
- [`AIHold`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/call/ai-hold) — AIHold places the AI-controlled call on hold. controlID, timeout and prompt are all optional — pass "" to omit any of them, matching Python's ai\_hold(\*, timeout: Optional\[str] = None, prompt: Optional\[str] = None) which has no control\_id parameter and only writes keys conditionally.
- [`AIMessage`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/call/ai-message) — AIMessage sends a text message within an active AI session. All parameters are optional, matching Python's ai\_message(\*, message\_text=None, role=None, reset=None, global\_data=None). Pass "" for controlID/text/role and nil for reset/globalData to omit them from the wire payload (Python omits the key entirely when the argument is None).
- [`AIUnhold`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/call/ai-unhold) — AIUnhold removes the call from AI hold. controlID and prompt are both optional — pass "" to omit either, matching Python's ai\_unhold(\*, prompt: Optional\[str] = None) which has no control\_id parameter and only writes keys conditionally.
- [`AmazonBedrock`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/call/amazon-bedrock) — AmazonBedrock starts an AI session using Amazon Bedrock.
- [`Answer`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/call/answer) — Answer answers an inbound call.
- [`BindDigit`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/call/bind-digit) — BindDigit binds a DTMF digit sequence to trigger a RELAY method. bindParams, realm, and maxTriggers are optional (nil/zero-value omits them), matching Python's bind\_digit(digits, bind\_method, \*, bind\_params, realm, max\_triggers).
- [`CallID`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/call/call-id) — CallID returns the unique call identifier assigned by the server.
- [`ClearDigitBindings`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/call/clear-digit-bindings) — ClearDigitBindings clears all DTMF digit bindings, optionally filtered by realm. Pass an empty string to clear all realms (matches Python's clear\_digit\_bindings(\*, realm)).
- [`Collect`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/call/collect) — Collect starts collecting user input without playing media. The params argument exposes named fields that mirror Python's collect() parameters at relay/call.py:565. Pass a nil CollectParams to send an empty collect body.
- [`Connect`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/call/connect) — Connect bridges this call to one or more devices.
- [`Context`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/call/context) — Context returns the RELAY context this call was received on.
- [`Denoise`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/call/denoise) — Denoise starts noise reduction on the call.
- [`DenoiseStop`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/call/denoise-stop) — DenoiseStop stops noise reduction on the call.
- [`Detect`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/call/detect) — Detect starts a detection operation (e.g., answering machine detection). timeout is optional; pass nil to omit it from the request (matches Python's optional float timeout parameter).
- [`Device`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/call/device) — Device returns the device map describing the endpoint of this call.
- [`Direction`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/call/direction) — Direction returns the call direction ("inbound" or "outbound").
- [`Disconnect`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/call/disconnect) — Disconnect tears down a previously established bridge.
- [`Echo`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/call/echo) — Echo starts echo mode on the call (echo audio back to the caller). Both timeout and statusURL are optional (nil omits them), matching Python's echo(\*, timeout: float|None, status\_url).
- [`Hangup`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/call/hangup) — Hangup ends the call with the given reason.
- [`Hold`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/call/hold) — Hold places the call on hold.
- [`JoinConference`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/call/join-conference) — JoinConference joins the call to a named conference.
- [`JoinRoom`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/call/join-room) — JoinRoom joins the call to a named room. statusURL is optional (empty string omits it), matching Python's join\_room(name, \*, status\_url).
- [`LeaveConference`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/call/leave-conference) — LeaveConference removes the call from a conference.
- [`LeaveRoom`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/call/leave-room) — LeaveRoom removes the call from the current room.
- [`LiveTranscribe`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/call/live-transcribe) — LiveTranscribe starts or stops live transcription on the call. The action map describes the transcription operation (e.g. {"type": "start"}). Matches Python's live\_transcribe(action, \*\*kwargs).
- [`LiveTranslate`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/call/live-translate) — LiveTranslate starts or stops live translation on the call. The action map describes the translation operation. statusURL is optional (empty string omits it), matching Python's live\_translate(action, \*, status\_url).
- [`NodeID`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/call/node-id) — NodeID returns the node handling this call.
- [`On`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/call/on) — On registers a handler for a specific event type on this call.
- [`Pass`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/call/pass) — Pass passes the call to the next context handler without answering.
- [`Pay`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/call/pay) — Pay starts a payment collection session on the call. Use PayOption functional options to supply any of the 20+ optional parameters that Python's pay() exposes (input\_method, status\_url, payment\_method, timeout, max\_attempts, security\_code, postal\_code, min\_postal\_code\_length, token\_type, charge\_amount, currency, language, voice, description, valid\_card\_types, parameters, prompts).
- [`Play`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/call/play) — Play starts playing media on the call and returns a PlayAction.
- [`PlayAndCollect`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/call/play-and-collect) — PlayAndCollect plays media while collecting input (DTMF or speech).
- [`ProjectID`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/call/project-id) — ProjectID returns the project ID associated with this call.
- [`QueueEnter`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/call/queue-enter) — QueueEnter places the call in a named queue. statusURL is optional (empty string omits it), matching Python's queue\_enter(queue\_name, \*, control\_id, status\_url) at signalwire/relay/call.py:1268. A per-request control\_id is generated so the server can correlate this action with subsequent events.
- [`QueueLeave`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/call/queue-leave) — QueueLeave removes the call from the named queue. queueID and statusURL are optional (empty string omits each), matching Python's queue\_leave(queue\_name, \*, control\_id, queue\_id, status\_url) at signalwire/relay/call.py:1287. A per-request control\_id is generated.
- [`ReceiveFax`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/call/receive-fax) — ReceiveFax starts receiving a fax on the call. Use WithFaxControlID to supply an explicit control\_id.
- [`Record`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/call/record) — Record starts recording the call and returns a RecordAction.
- [`Refer`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/call/refer) — Refer transfers a SIP call to an external SIP endpoint via a REFER request. statusURL is optional (empty string omits it), matching Python's refer(device, \*, status\_url).
- [`SegmentID`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/call/segment-id) — SegmentID returns the segment identifier for this call leg.
- [`SendDigits`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/call/send-digits) — SendDigits sends DTMF digits on the call.
- [`SendFax`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/call/send-fax) — SendFax sends a fax document on the call. Use WithFaxHeaderInfo for the fax header string and WithFaxControlID for an explicit control\_id.
- [`State`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/call/state) — State returns the current call state.
- [`Stream`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/call/stream) — Stream starts streaming call audio to a WebSocket URL. Use WithStreamControlID for an explicit control\_id (matches Python's stream(control\_id=...)).
- [`String`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/call/string) — String returns a human-readable representation of the call.
- [`Tag`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/call/tag) — Tag returns the client-generated correlation tag.
- [`Tap`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/call/tap) — Tap starts tapping the call audio to an external destination. The optional controlID argument supplies an explicit control\_id (matches Python's tap(control\_id=...)). Pass "" or omit to auto-generate.
- [`Transcribe`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/call/transcribe) — Transcribe starts real-time transcription on the call. The optional controlID argument supplies an explicit control\_id (matches Python's transcribe(control\_id=...)).
- [`Transfer`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/call/transfer) — Transfer transfers call control to another RELAY app or SWML script. The dest parameter is the destination context/URL string, sent as the "dest" key to the server (matches Python's transfer(dest: str) behavior).
- [`Unhold`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/call/unhold) — Unhold takes the call off hold.
- [`UserEvent`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/call/user-event) — UserEvent sends a user-defined event on the call. eventName is the custom event identifier; pass "" to omit it. Optional `extra` maps are merged into the top-level wire params (mirroring Python's \*\*kwargs in user\_event(\*, event: Optional\[str] = None, \*\*kwargs)).
- [`WaitFor`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/call/wait-for) — WaitFor blocks until an event matching the given type and predicate is received, or the context expires.
- [`WaitForEnded`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/call/wait-for-ended) — WaitForEnded blocks until the call reaches the "ended" state, or the context expires. This mirrors Python's wait\_for\_ended() which awaits the \_ended asyncio.Future.

## Source

[`pkg/relay/call.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/call.go)

Line 16.

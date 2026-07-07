import "@signalwire/typespec-asyncapi";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@doc("Identifies a specific active call. Nearly every method and event includes it.")
@summary("Call address")
model CallAddress {
  @doc("Opaque identifier that, paired with `call_id`, addresses this call. Echo back the value you received; treat it as opaque.")
  @example("a3f1c2d4-5e6f-7a8b-9c0d-1e2f3a4b5c6d")
  node_id: string;

  @doc("Unique identifier of the call.")
  @example("c2a1e9f4-6b3d-4e7a-8f1c-2d3e4f5a6b7c")
  call_id: string;
}

@doc("""
  `CallAddress` plus the correlation fields included on most call events.
  Used by event payloads, not requests.
  """)
@summary("Call event address")
model CallEventAddress {
  ...CallAddress;

  @doc("Identifier of the call segment this event belongs to, for correlating events within the same segment of a call.")
  @example("e5c3f2b1-8d0a-4b4c-9f3e-2a1b0c9d8e7f")
  segment_id?: string;

  @doc("The `tag` you set when placing the call, echoed back so you can match the event to your request.")
  @example("my-tag-1")
  tag?: string;
}

@doc("""
  The base result returned by calling methods. Check `code`: `"200"` means success;
  anything else means the request failed, and `message` explains why. Failures are
  reported through these fields rather than thrown as a separate error.

  This base carries only the fields every result has. Methods that echo the call or
  the control handle use `RelayResultWithCall` or `RelayResult` instead.
  """)
@summary("Calling result (base)")
model RelayResultBase<Message extends valueof string = "OK"> {
  @doc("Result code as a string, e.g. `\"200\"` (success), `\"400\"`, `\"404\"`.")
  @example("200")
  code: string;

  @doc("Human-readable description of the result. On failure, it explains what went wrong. Always check `code`; `message` may be omitted when there is nothing extra to report.")
  @example(Message)
  message?: string;

  @doc("Present on partial failures — an array of per-device error entries, each describing which device failed and why.")
  data?: unknown[];
}

@doc("""
  A calling result that echoes the `call_id` from your request but no control handle.
  Used by methods that act on a call but do not start a keyed, stoppable action.
  """)
@summary("Calling result with call")
model RelayResultWithCall<Message extends valueof string = "OK"> {
  ...RelayResultBase<Message>;

  @doc("The call this result is for, echoed from your request.")
  @example("c2a1e9f4-6b3d-4e7a-8f1c-2d3e4f5a6b7c")
  call_id?: string;
}

@doc("""
  The full calling result: `code`, `message`, the echoed `call_id`, and the
  `control_id` of the started action. Used by methods that begin a keyed, stoppable
  action (play, record, collect, detect, tap, stream, pay, fax, transcribe, …).
  """)
@summary("Calling result")
model RelayResult<Message extends valueof string = "OK"> {
  ...RelayResultWithCall<Message>;

  @doc("Your control identifier for the started action, echoed from your request.")
  @example("d4b2e1a0-7c9f-4a3b-8e2d-1f0a9b8c7d6e")
  control_id?: string;
}

@doc("""
  A custom SIP header. Custom `X-` headers are allowed, except the reserved
  `X-SignalWire*` and `X-CID*` prefixes. A few standard headers (`Privacy`,
  `P-Asserted-Identity`, `User-to-User`) are also permitted.
  """)
@summary("SIP header")
model SipHeader {
  @doc("Header name. Typically an `X-`-prefixed custom header; the reserved `X-SignalWire*` and `X-CID*` names are rejected.")
  @example("X-Custom-Key")
  name: string;

  @doc("Header value. Must not contain CR or LF characters.")
  @example("custom-value")
  value: string;
}

@doc("Lifecycle states of a Relay-controlled call (`calling.call.state`).")
@summary("Call state")
union CallState {
  "created",
  "ringing",
  "answered",
  "ending",
  "ended",
}

@doc("Subset of call states a device may be asked to report via `call_state_events`.")
@summary("Call state event name")
union CallStateEventName {
  "created",
  "ringing",
  "answered",
  "ended",
}

@doc("Reason an outbound/active call is ended (`calling.end`).")
@summary("Call end reason")
union CallEndReason {
  "hangup",
  "cancel",
  "busy",
  "noAnswer",
  "decline",
  "error",
}

@doc("Text-to-speech voice gender.")
@summary("TTS gender")
union TtsGender {
  "male",
  "female",
}

@doc("""
  Codecs you can negotiate when answering a call. The full set applies to SIP and
  WebRTC calls; **phone** calls accept only `PCMU`, `PCMA`, `G729`, `G722`, and
  `AMR-WB` — requesting `OPUS`, `VP8`, or `H264` on a phone answer is rejected with
  a `"400"`.
  """)
@summary("Answer codec")
union AnswerCodec {
  "PCMU",
  "PCMA",
  "OPUS",
  "G729",
  "G722",
  "AMR-WB",
  "VP8",
  "H264",
}

@doc("Codecs you can request for a SIP device when you dial or connect.")
@summary("SIP codec")
union SipCodec {
  "PCMU",
  "PCMA",
  "OPUS",
  "G729",
  "G722",
  "AMR-WB",
  "VP8",
  "H264",
}

@doc("""
  Ringtone names (ITU-T country tone codes) usable by the `ringtone` ringback /
  play element.
  """)
@summary("Ringtone name")
union ToneName {
  "at", "au", "bg", "br", "be", "ch", "cl", "cn", "cz", "de", "dk", "ee", "es",
  "fi", "fr", "gr", "hu", "il", "in", "it", "lt", "jp", "mx", "my", "nl", "no",
  "nz", "ph", "pl", "pt", "ru", "se", "sg", "th", "uk", "us", "tw", "ve", "za",
  "ca", "cy", "dz", "eg", "ko", "pk", "ro", "rs", "sa", "tr",
}

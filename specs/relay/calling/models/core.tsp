import "@signalwire/typespec-asyncapi";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

// ═════════════════════════════════════════════════════════════════════════════
// Shared mixins
// ═════════════════════════════════════════════════════════════════════════════

@doc("Identifies a specific active call. Nearly every method and event includes it.")
model CallAddress {
  @doc("Identifier of the node handling the call. Pair it with `call_id` to address the call.")
  node_id: string;

  @doc("Unique identifier of the call.")
  call_id: string;
}

@doc("""
  The result returned by calling methods. Check `code`: `"200"` means success;
  anything else means the request failed, and `message` explains why. Failures are
  reported through these fields rather than thrown as a separate error.
  """)
model RelayResult {
  @doc("Result code as a string, e.g. `\"200\"` (success), `\"400\"`, `\"404\"`.")
  code: string;

  @doc("Human-readable description of the result. On failure, explains what went wrong.")
  message: string;
}

@doc("A SIP header. Only `X-`-prefixed custom headers are permitted.")
model SipHeader {
  @doc("Header name (must start with `X-`).")
  name: string;

  @doc("Header value.")
  value: string;
}

// ═════════════════════════════════════════════════════════════════════════════
// Shared enums
// ═════════════════════════════════════════════════════════════════════════════

@doc("Lifecycle states of a Relay-controlled call (`calling.call.state`).")
union CallState {
  "created",
  "ringing",
  "answered",
  "ending",
  "ended",
}

@doc("Subset of call states a device may be asked to report via `call_state_events`.")
union CallStateEventName {
  "created",
  "ringing",
  "answered",
  "ended",
}

@doc("Reason an outbound/active call is ended (`calling.end`).")
union CallEndReason {
  "hangup",
  "cancel",
  "busy",
  "noAnswer",
  "decline",
  "error",
}

@doc("Text-to-speech voice gender.")
union TtsGender {
  "male",
  "female",
}

@doc("Codecs you can negotiate when answering a call, across all call types.")
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
union SipCodec {
  "PCMU",
  "PCMA",
  "OPUS",
  "G729",
  "G722",
  "VP8",
  "H264",
}

@doc("Codecs you can request for a WebRTC device when you dial or connect.")
union WebrtcCodec {
  "PCMU",
  "PCMA",
  "OPUS",
  "VP8",
  "H264",
}

@doc("""
  Ringtone names (ITU-T country tone codes) usable by the `ringtone` ringback /
  play element.
  """)
union ToneName {
  "at", "au", "bg", "br", "be", "ch", "cl", "cn", "cz", "de", "dk", "ee", "es",
  "fi", "fr", "gr", "hu", "il", "in", "it", "lt", "jp", "mx", "my", "nl", "no",
  "nz", "ph", "pl", "pt", "ru", "se", "sg", "th", "uk", "us", "tw", "ve", "za",
}

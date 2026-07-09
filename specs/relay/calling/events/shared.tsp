import "@signalwire/typespec-asyncapi";
import "../../common/frames.tsp";
import "@typespec/openapi";

import "../models/core.tsp";
import "../models/devices.tsp";

using TypeSpec.OpenAPI;

namespace Relay.Calling;

@doc("The call that created this one, when it was spawned by another call.")
@summary("Parent call reference")
model CallParentRef {
  @doc("Opaque identifier that, paired with `call_id`, addresses the parent call. Echo back the value you received; treat it as opaque.")
  @example("a3f1c2d4-5e6f-7a8b-9c0d-1e2f3a4b5c6d")
  node_id?: string;

  @doc("The parent call's `call_id`.")
  @example("e5c3f2b1-8d0a-4b4c-9f3e-2a1b0c9d8e7f")
  call_id?: string;

  @doc("The parent's device type, such as `sip`.")
  @example("sip")
  device_type?: string;
}

@doc("The other call this one is bridged to.")
@summary("Peer call reference")
model CallPeerRef {
  @doc("Opaque identifier that, paired with `call_id`, addresses the peer call. Echo back the value you received; treat it as opaque.")
  @example("a3f1c2d4-5e6f-7a8b-9c0d-1e2f3a4b5c6d")
  node_id?: string;

  @doc("The peer call's `call_id`.")
  @example("e5c3f2b1-8d0a-4b4c-9f3e-2a1b0c9d8e7f")
  call_id?: string;
}

@doc("Whether a call is inbound or outbound.")
@summary("Call direction")
union CallDirection {
  "inbound",
  "outbound",
}

@doc("Why a call ended. Includes the `calling.end` reasons plus values that occur when a call ends on its own (`abandoned`, `maxDuration`, `notFound`).")
@summary("Call state end reason")
union CallStateEndReason {
  "hangup",
  "cancel",
  "busy",
  "noAnswer",
  "decline",
  "error",
  "abandoned",
  "maxDuration",
  "notFound",
}

@doc("Which side (leg direction) ended the call: `inbound` or `outbound`, or `none` when not applicable. Mirrors the call's `direction`.")
@summary("Call state end source")
union CallStateEndSource {
  "inbound",
  "outbound",
  "none",
}

@doc("Present only for SIP calls (`device.type == \"sip\"`). SIP addressing/header detail extracted from the inbound INVITE. Every sub-field is optional and appears only when the corresponding SIP header was present.")
@summary("Call SIP data")
model CallSipData {
  @doc("Request-URI user part.")
  @example("bob")
  sip_req_user?: string;

  @doc("Request-URI user@host.")
  @example("bob@example.com")
  sip_req_uri?: string;

  @doc("Request-URI host.")
  @example("example.com")
  sip_req_host?: string;

  @doc("From-header user part.")
  @example("alice")
  sip_from_user?: string;

  @doc("From-header user@host.")
  @example("alice@example.com")
  sip_from_uri?: string;

  @doc("From-header host.")
  @example("example.com")
  sip_from_host?: string;

  @doc("To-header user part.")
  @example("bob")
  sip_to_user?: string;

  @doc("To-header user@host.")
  @example("bob@example.com")
  sip_to_uri?: string;

  @doc("To-header host.")
  @example("example.com")
  sip_to_host?: string;

  @doc("Contact-header user part.")
  @example("alice")
  sip_contact_user?: string;

  @doc("Contact-header port.")
  @example("5060")
  sip_contact_port?: string;

  @doc("Contact-header user@host[:port].")
  @example("alice@203.0.113.10:5060")
  sip_contact_uri?: string;

  @doc("Contact-header host.")
  @example("203.0.113.10")
  sip_contact_host?: string;

  @doc("Parsed From-URI parameters (`key=value` pairs).")
  sip_from_params?: Record<string>;

  @doc("Parsed To-URI parameters (`key=value` pairs).")
  sip_to_params?: Record<string>;

  @doc("Parsed Contact-URI parameters (`key=value` pairs).")
  sip_contact_params?: Record<string>;

  @doc("Parsed Request-URI parameters (`key=value` pairs).")
  sip_req_params?: Record<string>;

  @doc("The `P-Asserted-Identity` header value, when present.")
  @example("\"Alice\" <sip:alice@example.com>")
  sip_p_asserted_identity?: string;
}

@doc("Payload of the `calling.call.state` event: the call's address, state, timing, and leg detail.")
@summary("Call state event payload")
model CallStateParams {
  ...CallEventAddress;

  @doc("The device handling this call. Always present, but may be an empty object until the device type is determined.")
  device?: CallDevice;

  @doc("Present when this call was created by another call, describing that originating call.")
  parent?: CallParentRef;

  @doc("Present when this call is bridged to another, describing the other call.")
  peer?: CallPeerRef;

  @doc("The state the call has just moved into.")
  @example("ended")
  call_state: CallState;

  @doc("Whether the call is inbound or outbound.")
  @example("outbound")
  direction: CallDirection;

  @doc("When the call started, in epoch milliseconds. Always emitted; `0` until known.")
  @example(1712345678123)
  start_time: int64;

  @doc("When the call was answered, in epoch milliseconds. Always emitted; `0` until known.")
  @example(1712345680456)
  answer_time: int64;

  @doc("When the call ended, in epoch milliseconds. Always emitted; `0` until known.")
  @example(1712345695789)
  end_time: int64;

  @doc("Why the call ended. Present once the call has ended.")
  @example("hangup")
  end_reason?: CallStateEndReason;

  @doc("Which side ended the call — `inbound` or `outbound` — or `none` when not applicable. Present once the call has ended.")
  @example("outbound")
  end_source?: CallStateEndSource;

  @doc("Set to the string `\"true\"` on the call that won a `calling.dial` race. Absent otherwise. Note the value is the string `\"true\"`, not a JSON boolean.")
  @example("true")
  dial_winner?: "true";

  @doc("SIP addressing/header detail. Present only for SIP calls (`device.type == \"sip\"`).")
  sip_data?: CallSipData;

  @doc("Inbound-audio Mean Opinion Score (voice quality, ~1.0-5.0). Present when RTP quality stats are available.")
  @example(4.4)
  audio_in_mos?: float64;
}

const callingCallState = "calling.call.state";
@doc("Fires every time one of your calls changes state. Use the `call_state` field to track the call through its lifecycle, and `tag` to match the event back to the call you placed.")
@summary(callingCallState)
@extension("x-fern-display-name", callingCallState)
model CallStateEvent
  is SignalwireEvent<typeof callingCallState, CallStateParams>;

@doc("Payload of the `calling.call.receive` event: who is calling and on which context.")
@summary("Call receive event payload")
model CallReceiveParams {
  ...CallEventAddress;

  @doc("The current state of the inbound call.")
  @example("created")
  call_state: CallState;

  @doc("Whether the call is inbound or outbound. Always present on the receive event.")
  @example("inbound")
  direction: CallDirection;

  @doc("The context the call arrived on, such as `pbx`. Always present on the receive event. For this event the same value is also surfaced at the top level of the event envelope (alongside `event_type`), so you can read it from either place.")
  @example("pbx")
  context: string;

  @doc("The device the call is coming in on, including the caller's number.")
  device: CallDevice;
}

const callingCallReceive = "calling.call.receive";
@doc("Fires when a new call comes in that your application can answer and control. The payload tells you who is calling and on which context.")
@summary(callingCallReceive)
@extension("x-fern-display-name", callingCallReceive)
model CallReceiveEvent
  is SignalwireEvent<typeof callingCallReceive, CallReceiveParams>;

@doc("""
  Payload of the `calling.error` event. This is an error-reporting escape hatch for the
  AI runtime, so its shape is not fixed. Beyond the call address and the `error` /
  `fatal` fields below, additional fields vary by the error source (webhook failures,
  SWAIG tool errors, model fallbacks, speech/TTS errors, and so on).
  """)
@summary("Call error event payload")
model CallErrorParams {
  ...CallEventAddress;

  @doc("""
    A description of what went wrong — usually a human-readable string. A few error
    sources instead place a structured object here. Absent on the error types that
    describe the failure with other fields.
    """)
  @example("SWAIG function call failed")
  error?: string;

  @doc("Whether the error was fatal to the operation in progress — for example, one that ended the AI session. Absent when not reported.")
  @example(true)
  fatal?: boolean;
}

const callingError = "calling.error";
@doc("""
  Fires when the AI runtime on a call hits an error — from an AI agent (`calling.ai`),
  `calling.amazon_bedrock`, or live transcription/translation. It reports problems such
  as a failed SWAIG webhook, a model or tool error, or a speech-engine failure. The
  payload always identifies the call; `error` and `fatal` describe the problem, and
  additional fields vary by the error source.
  """)
@summary(callingError)
@extension("x-fern-display-name", callingError)
model CallErrorEvent is SignalwireEvent<typeof callingError, CallErrorParams>;

@doc("""
  One turn in a conversation log. Shared by the summary and conversation-log events of
  `calling.live_transcribe` and `calling.live_translate`. This is a slimmer record than a
  per-utterance result — it carries the turn's text and speaker, not the low-level ASR metadata.
  """)
@summary("Conversation log entry")
model ConversationLogEntry {
  @doc("Who spoke this turn: `remote-caller` (the far end) or `local-caller` (your side). Tool/function turns use the `tool` role.")
  @example("remote-caller")
  role: string;

  @doc("The text of this turn.")
  @example("I'd like to check my balance.")
  content: string;

  @doc("Recognition confidence for this turn, roughly 0.0-1.0. Absent for non-speech turns.")
  @example(0.94)
  confidence?: float64;

  @doc("BCP-47 language code of this turn (e.g. `en`, `es-ES`).")
  @example("en")
  language?: string;

  @doc("The kind of content filter that matched this turn, when one did.")
  filter_type?: string;

  @doc("The value the content filter matched, when one did.")
  filter_value?: string;

  @doc("Correlation id for a tool/function-call turn. Present only on `tool`-role entries.")
  tool_call_id?: string;
}

@doc("""
  Aggregate metrics for a transcription session, included on the final
  `calling.ai.transcribe.conversation_log` event. In sidecar mode the per-side keys are
  reported as `customer_*` / `agent_*` instead of `remote_caller_*` / `local_caller_*`.
  """)
@summary("Transcription metrics")
model TranscriptionMetrics {
  @doc("Total number of utterances recognized during the session.")
  @example(42)
  total_utterances?: int32;

  @doc("Timestamp of the first utterance (same units as the event `timestamp`).")
  first_utterance_ts?: float64;

  @doc("Timestamp of the last utterance.")
  last_utterance_ts?: float64;

  @doc("Number of speaking turns from the far end.")
  @example(20)
  remote_caller_turns?: int32;

  @doc("Number of speaking turns from your side.")
  @example(22)
  local_caller_turns?: int32;

  @doc("Total words spoken by the far end.")
  remote_caller_words?: int32;

  @doc("Total words spoken by your side.")
  local_caller_words?: int32;

  @doc("Average recognition confidence across the far end's turns, roughly 0.0-1.0.")
  remote_caller_avg_confidence?: float64;

  @doc("Average recognition confidence across your side's turns, roughly 0.0-1.0.")
  local_caller_avg_confidence?: float64;
}

@doc("""
  Call/session context attached to AI transcribe, translate, and sidecar webhook deliveries, as a
  sibling of the documented event fields. Added on every delivery.
  """)
@summary("AI call info")
model AiCallInfo {
  @doc("Your project ID.")
  project_id?: string;

  @doc("Your space ID.")
  space_id?: string;

  @doc("The content type of the delivery.")
  content_type: string;

  @doc("The content disposition of the delivery.")
  content_disposition: string;

  @doc("The kind of conversation this delivery describes.")
  conversation_type: string;

  @doc("The call ID.")
  call_id: string;
}

@doc("""
  Extended call/channel context attached to AI transcribe and translate deliveries — a superset of
  `AiCallInfo` with call timing and caller-ID detail.
  """)
@summary("AI channel data")
model AiChannelData {
  @doc("Your project ID.")
  project_id?: string;

  @doc("Your space ID.")
  space_id?: string;

  @doc("The content type of the delivery.")
  content_type: string;

  @doc("The content disposition of the delivery.")
  content_disposition: string;

  @doc("The call ID.")
  call_id: string;

  @doc("When the call started.")
  call_start_date?: string;

  @doc("When the call was answered.")
  call_answer_date?: string;

  @doc("When the call ended.")
  call_end_date?: string;

  @doc("The caller's name.")
  caller_id_name?: string;

  @doc("The caller's number.")
  caller_id_number?: string;

  @doc("SWML variables set on the call.")
  SWMLVars?: Record<unknown>;

  @doc("The SWML call object for this call.")
  SWMLCall?: Record<unknown>;
}

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

  @doc("The device handling this call, once it has been determined.")
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
  direction?: CallDirection;

  @doc("When the call started, in epoch milliseconds.")
  @example(1712345678123)
  start_time?: int64;

  @doc("When the call was answered, in epoch milliseconds.")
  @example(1712345680456)
  answer_time?: int64;

  @doc("When the call ended, in epoch milliseconds.")
  @example(1712345695789)
  end_time?: int64;

  @doc("Why the call ended. Present once the call has ended.")
  @example("hangup")
  end_reason?: CallStateEndReason;

  @doc("Which side ended the call, e.g. `peer` (the other party). Present once the call has ended.")
  @example("peer")
  end_source?: string;

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
model CallStateEvent is SignalwireEvent<typeof callingCallState, CallStateParams>;

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

  @doc("The context the call arrived on, such as `pbx`. Always present on the receive event.")
  @example("pbx")
  context: string;

  @doc("The device the call is coming in on, including the caller's number.")
  device: CallDevice;
}

const callingCallReceive = "calling.call.receive";
@doc("Fires when a new call comes in that your application can answer and control. The payload tells you who is calling and on which context.")
@summary(callingCallReceive)
@extension("x-fern-display-name", callingCallReceive)
model CallReceiveEvent is SignalwireEvent<typeof callingCallReceive, CallReceiveParams>;

import "@signalwire/typespec-asyncapi";
import "../../common/frames.tsp";
import "@typespec/openapi";

import "../models/core.tsp";
import "../models/devices.tsp";

using TypeSpec.OpenAPI;

namespace Relay.Calling;

// Cross-service calling events: `calling.call.state` fires for any controlled call and rides
// `signalwire.connect`; `calling.call.receive` is the unsolicited inbound-call notification on
// `signalwire.receive`. Both are consumed outside the calling service, so they stay shared here
// rather than under a single operation directory.

// ─────────────────────────────────────────────────────────────────────────────
// calling.call.state
// ─────────────────────────────────────────────────────────────────────────────

@doc("The call that created this one, when it was spawned by another call.")
model CallParentRef {
  @doc("Identifier of the node hosting the parent call.")
  node_id?: string;

  @doc("The parent call's `call_id`.")
  call_id?: string;

  @doc("The parent's device type, such as `sip`.")
  device_type?: string;
}

@doc("The other call this one is bridged to.")
model CallPeerRef {
  @doc("Identifier of the node hosting the peer call.")
  node_id?: string;

  @doc("The peer call's `call_id`.")
  call_id?: string;
}

@doc("Whether a call is inbound or outbound.")
union CallDirection {
  "inbound",
  "outbound",
}

@doc("Why a call ended. A superset of the `calling.end` reasons, with the extra values the platform reports when a call ends on its own.")
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

model CallStateParams {
  ...CallAddress;

  @doc("The `tag` you set when you placed the call, so you can match this event back to your request.")
  tag?: string;

  @doc("The device handling this call, once it has been determined.")
  device?: CallDevice;

  @doc("Present when this call was created by another call, describing that originating call.")
  parent?: CallParentRef;

  @doc("Present when this call is bridged to another, describing the other call.")
  peer?: CallPeerRef;

  @doc("The state the call has just moved into.")
  call_state: CallState;

  @doc("Whether the call is inbound or outbound.")
  direction?: CallDirection;

  @doc("When the call started, in epoch milliseconds.")
  start_time?: int64;

  @doc("When the call was answered, in epoch milliseconds.")
  answer_time?: int64;

  @doc("When the call ended, in epoch milliseconds.")
  end_time?: int64;

  @doc("Why the call ended. Present once the call has ended.")
  end_reason?: CallStateEndReason;

  @doc("What ended the call. Present once the call has ended.")
  end_source?: string;
}

const callingCallState = "calling.call.state";
@doc("Fires every time one of your calls changes state. Use the `call_state` field to track the call through its lifecycle, and `tag` to match the event back to the call you placed.")
@summary(callingCallState)
@extension("x-fern-display-name", callingCallState)
model CallStateEvent is SignalwireEvent<typeof callingCallState, CallStateParams>;

// ─────────────────────────────────────────────────────────────────────────────
// calling.call.receive
// ─────────────────────────────────────────────────────────────────────────────

model CallReceiveParams {
  ...CallAddress;

  @doc("The current state of the inbound call.")
  call_state: CallState;

  @doc("Whether the call is inbound or outbound.")
  direction?: CallDirection;

  @doc("The context the call arrived on, such as `pbx`.")
  context?: string;

  @doc("The device the call is coming in on, including the caller's number.")
  device: CallDevice;
}

const callingCallReceive = "calling.call.receive";
@doc("Fires when a new call comes in that your application can answer and control. The payload tells you who is calling and on which context.")
@summary(callingCallReceive)
@extension("x-fern-display-name", callingCallReceive)
model CallReceiveEvent is SignalwireEvent<typeof callingCallReceive, CallReceiveParams>;

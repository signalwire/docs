import "@signalwire/typespec-asyncapi";

import "../models/core.tsp";
import "../models/devices.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

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

  @doc("How the call came to be: `dial` (you placed it), `connect` (created by a bridge), or `receive` (inbound).")
  created_by?: "dial" | "connect" | "receive";
}

@doc("Fires every time one of your calls changes state. Use the `call_state` field to track the call through its lifecycle, and `tag` to match the event back to the call you placed.")
@event("calling.call.state")
@example(#{
  node_id: "b8d0a8f0-1234-4abc-9def-0123456789ab",
  call_id: "c1e2f3a4-5678-4bcd-9efa-1234567890bc",
  tag: "my-call-tag",
  parent: #{
    node_id: "a1b2c3d4-9012-4cde-9fab-2345678901cd",
    call_id: "d4e5f6a7-3456-4def-9abc-3456789012de",
    device_type: "sip",
  },
  peer: #{
    node_id: "e5f6a7b8-7890-4eab-9bcd-4567890123ef",
    call_id: "f6a7b8c9-1234-4fbc-9cde-5678901234fa",
  },
  call_state: "ending",
  start_time: 1717000000000,
  answer_time: 1717000002000,
  end_time: 1717000060000,
  created_by: "dial",
})
model CallStateEvent {
  ...CallStateParams;
}

// ─────────────────────────────────────────────────────────────────────────────
// calling.call.receive
// ─────────────────────────────────────────────────────────────────────────────

@doc("The states an inbound call can report on `calling.call.receive`.")
union ReceiveCallState {
  "created",
  "connecting",
  "connected",
  "disconnecting",
  "disconnected",
}

model CallReceiveParams {
  ...CallAddress;

  @doc("The current state of the inbound call.")
  call_state: ReceiveCallState;

  @doc("Whether the call is inbound or outbound.")
  direction?: CallDirection;

  @doc("The context the call arrived on, such as `pbx`.")
  context?: string;

  @doc("The device the call is coming in on, including the caller's number.")
  device: CallDevice;
}

@doc("Fires when a new call comes in that your application can answer and control. The payload tells you who is calling and on which context.")
@event("calling.call.receive")
model CallReceiveEvent {
  ...CallReceiveParams;
}

// ─────────────────────────────────────────────────────────────────────────────
// calling.call.connect
// ─────────────────────────────────────────────────────────────────────────────

@doc("The other call being connected to yours.")
model ConnectPeer {
  @doc("Identifier of the node hosting the peer call.")
  node_id?: string;

  @doc("The peer call's `call_id`.")
  call_id?: string;

  @doc("The `tag` set on the peer call.")
  tag?: string;

  @doc("When the peer was reached through a queue, the queue's id.")
  queue_id?: string;

  @doc("The queue's friendly name.")
  queue_name?: string;

  @doc("The device handling the peer call.")
  device?: CallDevice;
}

model CallConnectParams {
  ...CallAddress;

  @doc("The `tag` you set on the connect request, so you can match this event to it.")
  tag?: string;

  @doc("The other call yours is being connected to.")
  peer?: ConnectPeer;

  @doc("Where the connection stands: `connecting`, `connected`, `disconnected`, or `failed`.")
  connect_state: "disconnected" | "connecting" | "connected" | "failed";

  @doc("Why the connect failed. Present when `connect_state` is `failed`.")
  failed_reason?: string;
}

@doc("Fires as a connect request progresses, telling you whether your call has been bridged to the peer. Watch `connect_state` to know when the two calls are joined, torn down, or have failed to connect.")
@event("calling.call.connect")
@example(#{
  node_id: "b8d0a8f0-1234-4abc-9def-0123456789ab",
  call_id: "c1e2f3a4-5678-4bcd-9efa-1234567890bc",
  tag: "my-connect-tag",
  peer: #{
    node_id: "e5f6a7b8-7890-4eab-9bcd-4567890123ef",
    call_id: "f6a7b8c9-1234-4fbc-9cde-5678901234fa",
    tag: "peer-tag",
    queue_id: "q1a2b3c4-5678-4abc-9def-6789012345ab",
    queue_name: "support",
  },
  connect_state: "connected",
})
model CallConnectEvent {
  ...CallConnectParams;
}

// ─────────────────────────────────────────────────────────────────────────────
// calling.call.dial
// ─────────────────────────────────────────────────────────────────────────────

@doc("The call that answered, included once a `calling.dial` succeeds.")
model DialWinnerCall {
  @doc("Identifier of the node hosting the answered call.")
  node_id?: string;

  @doc("The answered call's `call_id`.")
  call_id?: string;

  @doc("The `tag` set on the answered call.")
  tag?: string;

  @doc("The device that answered.")
  device?: CallDevice;

  @doc("`\"true\"` for the call that won the dial. When you dial several destinations at once, this marks the first one to answer. Present only on the winning call.")
  dial_winner?: "true";
}

model CallDialParams {
  @doc("Identifier of the node handling the dial.")
  node_id: string;

  @doc("The `tag` you set on the `calling.dial` request, so you can match this event to it.")
  tag: string;

  @doc("Where the dial stands: `dialing`, `answered`, or `failed`.")
  dial_state: "dialing" | "answered" | "failed";

  @doc("The call that answered. Present only when `dial_state` is `answered`.")
  call?: DialWinnerCall;

  @doc("Why the dial failed. Present when `dial_state` is `failed`.")
  reason?: string;

  @doc("What caused the dial to fail. Present when `dial_state` is `failed`.")
  source?: string;
}

@doc("Fires as a `calling.dial` request progresses. Watch `dial_state` to know when your call is ringing, has been answered, or failed; when it is answered the `call` field gives you the call that picked up.")
@event("calling.call.dial")
@example(#{
  node_id: "b8d0a8f0-1234-4abc-9def-0123456789ab",
  tag: "my-dial-tag",
  dial_state: "answered",
  call: #{
    node_id: "e5f6a7b8-7890-4eab-9bcd-4567890123ef",
    call_id: "f6a7b8c9-1234-4fbc-9cde-5678901234fa",
    tag: "my-dial-tag",
    dial_winner: "true",
  },
})
model CallDialEvent {
  ...CallDialParams;
}

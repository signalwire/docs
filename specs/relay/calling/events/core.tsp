import "@signalwire/typespec-asyncapi";
import "../common.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

// ─────────────────────────────────────────────────────────────────────────────
// calling.call.state
// ─────────────────────────────────────────────────────────────────────────────

/** A parent call referenced by a state event. */
model CallParentRef {
  node_id?: string;
  call_id?: string;

  /** The parent device type (flattened, e.g. `sip`). */
  device_type?: string;
}

/** A peer call referenced by an event. */
model CallPeerRef {
  node_id?: string;
  call_id?: string;
}

model CallStateParams {
  ...CallAddress;

  /** Identifier set on the originating dial/connect. */
  tag?: string;

  /** The negotiated device for this call. */
  device?: CallDevice;

  /** The parent call, when this call was created by another. */
  parent?: CallParentRef;

  /** The peer call, when bridged. */
  peer?: CallPeerRef;

  /** The new call state. */
  call_state: CallState;

  /** Epoch milliseconds the call started. */
  start_time?: int64;

  /** Epoch milliseconds the call was answered. */
  answer_time?: int64;

  /** Epoch milliseconds the call ended. */
  end_time?: int64;

  /** What created this call. */
  created_by?: "dial" | "connect" | "receive";
}

/** A change in state of an active Relay-controlled call. */
@event("calling.call.state")
model CallStateEvent {
  ...CallStateParams;
}

// ─────────────────────────────────────────────────────────────────────────────
// calling.call.receive
// ─────────────────────────────────────────────────────────────────────────────

/** Call states reported on an inbound `calling.call.receive`. */
union ReceiveCallState {
  "created",
  "connecting",
  "connected",
  "disconnecting",
  "disconnected",
}

model CallReceiveParams {
  ...CallAddress;

  /** State of the inbound call. */
  call_state: ReceiveCallState;

  /** Routing context the call arrived on (e.g. `pbx`). */
  context?: string;

  /** The inbound device. */
  device: CallDevice;
}

/** An incoming call available for a Relay client to control. */
@event("calling.call.receive")
model CallReceiveEvent {
  ...CallReceiveParams;
}

// ─────────────────────────────────────────────────────────────────────────────
// calling.call.connect
// ─────────────────────────────────────────────────────────────────────────────

/** The peer leg in a connect event. */
model ConnectPeer {
  node_id?: string;
  call_id?: string;
  tag?: string;
  queue_id?: string;
  queue_name?: string;

  /** The peer's negotiated device. */
  device?: CallDevice;
}

model CallConnectParams {
  ...CallAddress;

  /** Identifier of the connect operation. */
  tag?: string;

  /** The peer call being connected. */
  peer: ConnectPeer;

  /** The connect (bridge) state. */
  connect_state: "disconnected" | "connecting" | "connected" | "failed";
}

/** A call's connect (bridge/unbridge) state. */
@event("calling.call.connect")
model CallConnectEvent {
  ...CallConnectParams;
}

// ─────────────────────────────────────────────────────────────────────────────
// calling.call.dial
// ─────────────────────────────────────────────────────────────────────────────

/** The answered call carried by a `calling.call.dial` event. */
model DialWinnerCall {
  node_id?: string;
  call_id?: string;
  tag?: string;

  /** The negotiated device. */
  device?: CallDevice;

  /** Whether this call is the selected (first-answered) winner. */
  dial_winner?: boolean;
}

model CallDialParams {
  /** Node the dial is on. */
  node_id: string;

  /** Identifier from `calling.dial`. */
  tag: string;

  /** The dial operation state. */
  dial_state: "dialing" | "answered" | "failed";

  /** The answered call (present when `dial_state` is `answered`). */
  call?: DialWinnerCall;
}

/** The state of a `calling.dial` operation. */
@event("calling.call.dial")
model CallDialEvent {
  ...CallDialParams;
}

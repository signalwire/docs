import "@signalwire/typespec-asyncapi";
import "../common.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

// ─────────────────────────────────────────────────────────────────────────────
// calling.call.state
// ─────────────────────────────────────────────────────────────────────────────

/** A parent call referenced by a state event. */
model CallParentRef {
  /** Node the parent call is on. */
  node_id?: string;

  /** The parent call id. */
  call_id?: string;

  /** The parent device type (flattened, e.g. `sip`). */
  device_type?: string;
}

/** A peer call referenced by an event. */
model CallPeerRef {
  /** Node the peer call is on. */
  node_id?: string;

  /** The peer call id. */
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
  /** Node the peer call is on. */
  node_id?: string;

  /** The peer call id. */
  call_id?: string;

  /** Client data the peer call is tagged with. */
  tag?: string;

  /** Id of the queue the peer was pulled from, when connected via a queue. */
  queue_id?: string;

  /** Friendly name of that queue. */
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

/** The answered call carried by a `calling.call.dial` event. */
model DialWinnerCall {
  /** Node the answered call is on. */
  node_id?: string;

  /** The answered call id. */
  call_id?: string;

  /** Client data the answered call is tagged with. */
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
@example(#{
  node_id: "b8d0a8f0-1234-4abc-9def-0123456789ab",
  tag: "my-dial-tag",
  dial_state: "answered",
  call: #{
    node_id: "e5f6a7b8-7890-4eab-9bcd-4567890123ef",
    call_id: "f6a7b8c9-1234-4fbc-9cde-5678901234fa",
    tag: "my-dial-tag",
    dial_winner: true,
  },
})
model CallDialEvent {
  ...CallDialParams;
}

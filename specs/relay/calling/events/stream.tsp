import "@signalwire/typespec-asyncapi";

import "../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

// ─────────────────────────────────────────────────────────────────────────────
// calling.call.stream
// ─────────────────────────────────────────────────────────────────────────────

@doc("Whether the stream is currently `streaming` or has `finished`.")
union StreamState {
  "streaming",
  "finished",
}

model CallStreamParams {
  ...CallAddress;

  @doc("The `control_id` of the stream this event belongs to.")
  control_id: string;

  @doc("Whether audio is still streaming (`streaming`) or the stream has stopped (`finished`).")
  state: StreamState;

  @doc("The WebSocket URL the call audio is being streamed to.")
  url: url;

  @doc("The friendly name you gave the stream, if you set one.")
  name?: string;
}

@doc("Fires when a media stream starts and again when it stops. Check `state` to tell which.")
@event("calling.call.stream")
@example(#{
  node_id: "a3e1b2c4-5d6f-7a8b-9c0d-1e2f3a4b5c6d",
  call_id: "c7f9d2e1-3a4b-5c6d-7e8f-9a0b1c2d3e4f",
  control_id: "8f14e45f-ceea-167a-5a36-dedd4bea2543",
  state: "streaming",
  url: "wss://example.com/audio",
  name: "my_stream",
})
model CallStreamEvent {
  ...CallStreamParams;
}

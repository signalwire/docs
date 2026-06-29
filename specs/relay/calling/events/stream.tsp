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
@summary("calling.call.stream")
model CallStreamEvent is SignalwireEvent<"calling.call.stream", CallStreamParams>;

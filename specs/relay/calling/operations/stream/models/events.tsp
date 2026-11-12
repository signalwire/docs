import "@signalwire/typespec-asyncapi";
import "../../../../common/frames.tsp";
import "@typespec/openapi";

import "../../../models/core.tsp";

using TypeSpec.OpenAPI;

namespace Relay.Calling;

@doc("Whether the stream is currently `streaming` or has `finished`.")
union StreamState {
  "streaming",
  "finished",
}

model CallStreamParams {
  ...CallEventAddress;

  @doc("The `control_id` of the stream this event belongs to.")
  @example("d4b2e1a0-7c9f-4a3b-8e2d-1f0a9b8c7d6e")
  control_id: string;

  @doc("Whether audio is still streaming (`streaming`) or the stream has stopped (`finished`).")
  @example("streaming")
  state: StreamState;

  @doc("The WebSocket URL the call audio is being streamed to. Present when the stream was started with a URL.")
  @example("wss://example.com/media")
  url?: url;

  @doc("The friendly name you gave the stream, if you set one.")
  @example("my_stream")
  name?: string;
}

const callingCallStream = "calling.call.stream";
@doc("Fires when a media stream starts and again when it stops. Check `state` to tell which.")
@summary(callingCallStream)
@extension("x-fern-display-name", callingCallStream)
model CallStreamEvent is SignalwireEvent<typeof callingCallStream, CallStreamParams>;

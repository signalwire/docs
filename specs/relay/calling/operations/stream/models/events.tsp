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

const callingCallStream = "calling.call.stream";
@doc("Fires when a media stream starts and again when it stops. Check `state` to tell which.")
@summary(callingCallStream)
@extension("x-fern-display-name", callingCallStream)
model CallStreamEvent is SignalwireEvent<typeof callingCallStream, CallStreamParams>;

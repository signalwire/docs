import "@signalwire/typespec-asyncapi";
import "../../../../common/frames.tsp";
import "@typespec/openapi";

import "../../../models/core.tsp";

using TypeSpec.OpenAPI;

namespace Relay.Calling;

@doc("Whether the call is currently `echoing` its audio back or has `finished`.")
union EchoState {
  "echoing",
  "finished",
}

model CallEchoParams {
  ...CallAddress;

  @doc("Whether the echo is still running (`echoing`) or has stopped (`finished`).")
  state: EchoState;
}

const callingCallEcho = "calling.call.echo";
@doc("Fires when audio echo starts on a call and again when it stops.")
@summary(callingCallEcho)
@extension("x-fern-display-name", callingCallEcho)
model CallEchoEvent is SignalwireEvent<typeof callingCallEcho, CallEchoParams>;

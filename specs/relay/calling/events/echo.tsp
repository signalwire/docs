import "@signalwire/typespec-asyncapi";

import "../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

// ─────────────────────────────────────────────────────────────────────────────
// calling.call.echo
// ─────────────────────────────────────────────────────────────────────────────

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

@doc("Fires when audio echo starts on a call and again when it stops.")
@summary("calling.call.echo")
model CallEchoEvent is SignalwireEvent<"calling.call.echo", CallEchoParams>;

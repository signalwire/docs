import "@signalwire/typespec-asyncapi";

using SignalWire.AsyncAPI;

namespace Relay.Signalwire;

@doc("The result of a `signalwire.ping`: the `timestamp` and `payload` from the ping, echoed back unchanged.")
@summary("Ping result")
model PingResult {
  @doc("The `timestamp` from the ping, echoed back unchanged.")
  @example(1712345678.842)
  timestamp?: float64;

  @doc("The `payload` from the ping, echoed back unchanged.")
  @example("b1c2d3e4-f5a6-7b8c-9d0e-1f2a3b4c5d6e")
  payload?: string;
}

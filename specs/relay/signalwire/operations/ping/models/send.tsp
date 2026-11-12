import "@signalwire/typespec-asyncapi";

using SignalWire.AsyncAPI;

namespace Relay.Signalwire;

@doc("""
  The parameters carried by a `signalwire.ping`, in either direction. Both fields
  are optional and are echoed back unchanged in the reply, so you can use them to
  measure round-trip latency or correlate a ping with its response.
  """)
@summary("Ping parameters")
model PingParams {
  @doc("When the ping was sent, as a Unix timestamp in seconds. Echoed back unchanged in the reply.")
  @example(1712345678.842)
  timestamp?: float64;

  @doc("An opaque value echoed back unchanged in the reply. Use it to correlate a ping with its response.")
  @example("b1c2d3e4-f5a6-7b8c-9d0e-1f2a3b4c5d6e")
  payload?: string;
}

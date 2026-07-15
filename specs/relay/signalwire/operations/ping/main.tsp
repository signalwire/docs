import "@signalwire/typespec-asyncapi";
import "../../../common/frames.tsp";
import "@typespec/openapi";

import "./models/send.tsp";
import "./models/reply.tsp";

using SignalWire.AsyncAPI;
using TypeSpec.OpenAPI;

namespace Relay.Signalwire;

const signalwirePing = "signalwire.ping";
const signalwirePingResponse = "${signalwirePing} response";

model PingRequest is JsonRpcRequest<typeof signalwirePing, PingParams>;

@extension("x-fern-display-name", signalwirePingResponse)
@reply
model PingReply is JsonRpcResponse<PingResult>;

@doc("""
  A keepalive `signalwire.ping` the service pushes to you. Reply with a
  `signalwire.ping` result, echoing back the `timestamp` and `payload` you
  received. If you do not answer, the service closes your connection. SDKs answer
  this for you; a direct Relay client must handle it itself.
  """)
@summary("Service keepalive ping")
@extension("x-fern-display-name", signalwirePing)
model ServerPingRequest is JsonRpcRequest<typeof signalwirePing, PingParams>;

@doc("""
  Keep the connection alive. `signalwire.ping` travels in both directions and both
  fields (`timestamp`, `payload`) are optional and echoed back unchanged.
  
  - **You send it** — to confirm the connection is healthy or measure round-trip
    time. The service replies with your `timestamp` and `payload`.
  - **The service sends it to you** — as a periodic keepalive. You must reply,
    echoing the `timestamp` and `payload` back; if you don't, the service
    disconnects you. SDKs answer this automatically, but a direct Relay client has
    to handle the inbound ping itself.
  """)
@channel(signalwirePing)
@summary("Keep the connection alive with a ping")
@extension("x-fern-display-name", signalwirePing)
op ping(...PingRequest): PingReply | ServerPingRequest;

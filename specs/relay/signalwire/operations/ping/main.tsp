import "@signalwire/typespec-asyncapi";
import "../../../common/frames.tsp";
import "@typespec/openapi";

import "./models/send.tsp";
import "./models/reply.tsp";

using SignalWire.AsyncAPI;
using TypeSpec.OpenAPI;

namespace Relay.Signalwire;

// `signalwire.ping` exists for both audiences, but only a protocol 4.0.0 (Client)
// connection receives the service's own keepalive pings. The server op (you send,
// the service replies) lives in `ping/server.tsp`; the client op, which also
// documents the inbound ping, lives in `ping/client.tsp`. The request, reply, and
// method constants below are shared.
const signalwirePing = "signalwire.ping";
const signalwirePingResponse = "${signalwirePing} response";

model PingRequest is JsonRpcRequest<typeof signalwirePing, PingParams>;

@extension("x-fern-display-name", signalwirePingResponse)
@reply
model PingReply is JsonRpcResponse<PingResult>;

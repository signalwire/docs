import "@signalwire/typespec-asyncapi";
import "../../../common/frames.tsp";
import "@typespec/openapi";

import "./models/reply.tsp";
import "./models/events.tsp";

using SignalWire.AsyncAPI;
using TypeSpec.OpenAPI;

namespace Relay.Signalwire;

// `signalwire.connect` is shared by both audiences, but its request auth differs:
// the server send op (project + token) lives in `connect/server.tsp` and the client
// send op (jwt_token / SAT) in `connect/client.tsp`. The reply, the method constants,
// and the receive-only `authorization.state` event below are identical for both.
const signalwireConnect = "signalwire.connect";
const signalwireConnectResponse = "${signalwireConnect} response";

@extension("x-fern-display-name", signalwireConnectResponse)
@reply
model ConnectReply is JsonRpcResponse<ConnectResult>;

@doc("""
  Receive-only. Delivers your latest authorization state. It arrives right after
  `signalwire.connect`, and again whenever the state changes — after you
  reauthenticate or perform video/WebRTC operations — independent of any single
  command. One exception: if you connected by supplying a valid
  `connect.authorization_state`, the state is restored from that token and this event
  is not re-sent immediately on connect. Save the `authorization_state` each time and
  pass it back unchanged as `connect.authorization_state` when you reconnect.
  """)
@channel(signalwireAuthorizationState)
@summary("Receive authorization-state updates")
@extension("x-fern-display-name", signalwireAuthorizationState)
op authorizationState(): AuthorizationStateEvent;

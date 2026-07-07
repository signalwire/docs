import "@signalwire/typespec-asyncapi";
import "../../../common/frames.tsp";
import "@typespec/openapi";

import "./models/send.tsp";
import "./models/reply.tsp";
import "./models/events.tsp";

using SignalWire.AsyncAPI;
using TypeSpec.OpenAPI;

namespace Relay.Signalwire;

const signalwireConnect = "signalwire.connect";
const signalwireConnectResponse = "${signalwireConnect} response";

model ConnectRequest is JsonRpcRequest<typeof signalwireConnect, ConnectParams>;

@extension("x-fern-display-name", signalwireConnectResponse)
@reply model ConnectReply is JsonRpcResponse<ConnectResult>;

@doc("""
  Authenticate and open your Relay connection. Call this first, before any other
  Relay command: send your credentials and protocol version, and you get back your
  `identity`, `authorization`, the `protocol` to use on later requests, and ICE
  servers for media. Right after a successful connect you also receive a
  `signalwire.authorization.state` event (a receive-only channel — see below), and
  it is delivered again whenever your authorization state changes; save its
  `authorization_state` each time so you can restore your session if you reconnect.
  """)
@channel(signalwireConnect)
@summary("Authenticate and establish a Relay connection")
@extension("x-fern-display-name", signalwireConnect)
op connect(...ConnectRequest): ConnectReply;

@doc("""
  Receive-only. Delivers your latest authorization state. It arrives right after
  `signalwire.connect`, and again whenever the state changes — after you
  reauthenticate or perform video/WebRTC operations — independent of any single
  command. Save the `authorization_state` each time and pass it back unchanged as
  `connect.authorization_state` when you reconnect.
  """)
@channel(signalwireAuthorizationState)
@summary("Receive authorization-state updates")
@extension("x-fern-display-name", signalwireAuthorizationState)
op authorizationState(): AuthorizationStateEvent;

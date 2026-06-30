import "@signalwire/typespec-asyncapi";
import "../../../common/frames.tsp";
import "@typespec/openapi";

import "./models/requests.tsp";
import "./models/responses.tsp";
import "../../../calling/events/state.tsp";

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
  `signalwire.authorization.state` event — save its `authorization_state` so you
  can restore your session if you need to reconnect.
  """)
@channel(signalwireConnect)
@summary("Authenticate and establish a Relay connection")
@extension("x-fern-display-name", signalwireConnect)
op connect(...ConnectRequest): ConnectReply | AuthorizationStateEvent | Relay.Calling.CallStateEvent;

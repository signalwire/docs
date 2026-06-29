import "@signalwire/typespec-asyncapi";

import "./models/requests.tsp";
import "./models/responses.tsp";
import "../../../calling/events/state.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Signalwire;

model ConnectRequest is JsonRpcRequest<"signalwire.connect", ConnectParams>;
@reply model ConnectReply is JsonRpcResponse<ConnectResult>;

@doc("""
  Authenticate and open your Relay connection. Call this first, before any other
  Relay command: send your credentials and protocol version, and you get back your
  `identity`, `authorization`, the `protocol` to use on later requests, and ICE
  servers for media. Right after a successful connect you also receive a
  `signalwire.authorization.state` event — save its `authorization_state` so you
  can restore your session if you need to reconnect.
  """)
@channel("signalwire.connect")
@summary("Authenticate and establish a Relay connection")
op connect(...ConnectRequest): ConnectReply | AuthorizationStateEvent | Relay.Calling.CallStateEvent;

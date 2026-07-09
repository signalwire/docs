import "@signalwire/typespec-asyncapi";
import "../../../common/frames.tsp";
import "@typespec/openapi";

import "./main.tsp";
import "./models/send.tsp";

using SignalWire.AsyncAPI;
using TypeSpec.OpenAPI;

namespace Relay.Signalwire;

model ConnectRequest is JsonRpcRequest<typeof signalwireConnect, ServerConnectParams>;

@doc("""
  Authenticate and open your Relay connection from a backend app. Call this first,
  before any other Relay command: send your **Project ID + API token** and protocol
  version, and you get back your `identity`, `authorization`, the `protocol` to use on
  later requests, and ICE servers for media. A `signalwire.authorization.state` event
  follows on its own receive-only channel — save its `authorization_state` so you can
  restore your session if you reconnect.
  """)
@channel(signalwireConnect)
@summary("Authenticate and establish a Relay connection")
@extension("x-fern-display-name", signalwireConnect)
op connect(...ConnectRequest): ConnectReply;

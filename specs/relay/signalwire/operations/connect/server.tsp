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
  version `2.0.0` (the version the server SDKs send — Calling events, Messaging, and
  provisioning need a `major` below `4`), and you get back your `identity`,
  `authorization`, the `protocol` to use on later requests, and ICE servers. A
  `signalwire.authorization.state` event follows on its own receive-only channel —
  save its `authorization_state` so you can restore your session if you reconnect.

  If the connect fails (unsupported version, missing or rejected credentials,
  connection limit reached), you get a JSON-RPC `error` and the service then closes
  the WebSocket. `-32002` means your credentials were rejected; `-32000` and
  `-32603` mean authentication could not be completed — retry later.
  """)
@channel(signalwireConnect)
@summary("Authenticate and establish a Relay connection")
@extension("x-fern-display-name", signalwireConnect)
op connect(...ConnectRequest): ConnectReply;

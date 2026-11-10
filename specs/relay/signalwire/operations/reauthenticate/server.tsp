import "@signalwire/typespec-asyncapi";
import "../../../common/frames.tsp";
import "@typespec/openapi";

import "./main.tsp";
import "./models/send.tsp";

using SignalWire.AsyncAPI;
using TypeSpec.OpenAPI;

namespace Relay.Signalwire;

model ReauthenticateRequest
  is JsonRpcRequest<typeof signalwireReauthenticate, ServerReauthenticateParams>;

@doc("""
  Re-authenticate this connection in place, without reconnecting — for example after
  rotating your API token. Send your Project ID and an API token; `project` must be
  the project the connection already authenticated with.

  On success you get back your refreshed `authorization` and `ice_servers`, and a
  `signalwire.authorization.state` event is delivered on its own channel.

  Failures arrive as a JSON-RPC `error`: `-32002` if the token is rejected, `-32602`
  if `project` is missing, and `-32603` if `project` differs from the connection's
  project. The connection stays open either way.
  """)
@channel(signalwireReauthenticate)
@summary("Refresh credentials without reconnecting")
@extension("x-fern-display-name", signalwireReauthenticate)
op reauthenticate(...ReauthenticateRequest): ReauthenticateReply;

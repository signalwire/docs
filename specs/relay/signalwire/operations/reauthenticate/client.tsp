import "@signalwire/typespec-asyncapi";
import "../../../common/frames.tsp";
import "@typespec/openapi";

import "./main.tsp";
import "./models/send.tsp";

using SignalWire.AsyncAPI;
using TypeSpec.OpenAPI;

namespace Relay.Signalwire;

model ReauthenticateRequest
  is JsonRpcRequest<typeof signalwireReauthenticate, ReauthenticateParams>;

@doc("""
  Refresh this connection's credentials in place, without reconnecting. Send a new
  `jwt_token` to rotate the connection's authorization — useful for long-lived
  browser sessions that need to renew a token before it expires without dropping
  in-progress calls. For a Relay JWT created with the Relay REST API, also send the
  connection's `project`; you cannot reauthenticate into a different project.

  On success you get back updated `ice_servers` (and, for a non-SAT token, your
  refreshed `authorization`), and a `signalwire.authorization.state` event is
  delivered on its own channel — save its `authorization_state` as usual.

  Failures arrive as a JSON-RPC `error`: `-32002` if the new token is rejected,
  `-32602` if `project` is missing for a non-SAT token, and `-32603` if `project`
  differs from the connection's project. The connection stays open either way.
  """)
@channel(signalwireReauthenticate)
@summary("Refresh credentials without reconnecting")
@extension("x-fern-display-name", signalwireReauthenticate)
op reauthenticate(...ReauthenticateRequest): ReauthenticateReply;

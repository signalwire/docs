import "@signalwire/typespec-asyncapi";
import "../../../common/frames.tsp";
import "@typespec/openapi";

import "./models/send.tsp";
import "./models/reply.tsp";

using SignalWire.AsyncAPI;
using TypeSpec.OpenAPI;

namespace Relay.Signalwire;

const signalwireReauthenticate = "signalwire.reauthenticate";
const signalwireReauthenticateResponse = "${signalwireReauthenticate} response";

model ReauthenticateRequest
  is JsonRpcRequest<typeof signalwireReauthenticate, ReauthenticateParams>;

@extension("x-fern-display-name", signalwireReauthenticateResponse)
@reply
model ReauthenticateReply is JsonRpcResponse<ReauthenticateResult>;

@doc("""
  Refresh this connection's credentials in place, without reconnecting. Send a new
  `jwt_token` (with the same `project`) to rotate the connection's authorization —
  useful for long-lived browser sessions that need to renew a token before it
  expires without dropping in-progress calls. You cannot reauthenticate into a
  different project.
  
  On success you get back your refreshed `authorization` and, for media connections,
  updated `ice_servers`, and a `signalwire.authorization.state` event is delivered on
  its own channel — save its `authorization_state` as usual.
  """)
@channel(signalwireReauthenticate)
@summary("Refresh credentials without reconnecting")
@extension("x-fern-display-name", signalwireReauthenticate)
op reauthenticate(...ReauthenticateRequest): ReauthenticateReply;

import "@signalwire/typespec-asyncapi";
import "../../../common/frames.tsp";
import "@typespec/openapi";

import "./models/reply.tsp";

using SignalWire.AsyncAPI;
using TypeSpec.OpenAPI;

namespace Relay.Signalwire;

// `signalwire.reauthenticate` is available to both audiences, but the credentials
// differ: the server send op (project + token) lives in `reauthenticate/server.tsp`
// and the client send op (jwt_token) in `reauthenticate/client.tsp`. The reply and
// the method constants below are shared.
const signalwireReauthenticate = "signalwire.reauthenticate";
const signalwireReauthenticateResponse = "${signalwireReauthenticate} response";

@extension("x-fern-display-name", signalwireReauthenticateResponse)
@reply
model ReauthenticateReply is JsonRpcResponse<ReauthenticateResult>;

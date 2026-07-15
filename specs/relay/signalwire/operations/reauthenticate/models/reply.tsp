import "@signalwire/typespec-asyncapi";
import "../../connect/models/reply.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Signalwire;

@doc("""
  The result of a successful `signalwire.reauthenticate`: for media connections, updated
  `ice_servers`. A `signalwire.authorization.state` event is delivered alongside it
  carrying your refreshed authorization — save its `authorization_state` as usual.
  """)
@summary("Reauthenticate result")
model ReauthenticateResult {
  @doc("The refreshed authorization granted to this connection. Treat it as opaque. For a browser/SAT client this is normally absent — your refreshed authorization arrives on the `signalwire.authorization.state` event instead.")
  authorization?: Record<unknown>;

  @doc("Updated ICE servers to use for media. Returned for WebRTC connections; omitted when the connection carries no media.")
  ice_servers?: IceServer[];
}

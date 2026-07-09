import "@signalwire/typespec-asyncapi";
import "../../connect/models/reply.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Signalwire;

@doc("""
  The result of a successful `signalwire.reauthenticate`: your refreshed
  `authorization` and, for media connections, updated `ice_servers`. A
  `signalwire.authorization.state` event is delivered alongside it — save its
  `authorization_state` as usual.
  """)
@summary("Reauthenticate result")
model ReauthenticateResult {
  @doc("The refreshed authorization granted to this connection. Treat it as opaque. Omitted when there is none.")
  authorization?: Record<unknown>;

  @doc("Updated ICE servers to use for media. Returned for WebRTC connections; omitted when the connection carries no media.")
  ice_servers?: IceServer[];
}

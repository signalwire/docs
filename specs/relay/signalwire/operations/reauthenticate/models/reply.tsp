import "@signalwire/typespec-asyncapi";
import "../../connect/models/reply.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Signalwire;

@doc("""
  The result of a successful `signalwire.reauthenticate`: updated `ice_servers` and, for
  any token other than a Subscriber Access Token, your refreshed `authorization`. A
  `signalwire.authorization.state` event is delivered alongside it carrying your
  refreshed authorization state — save its `authorization_state` as usual.
  """)
@summary("Reauthenticate result")
model ReauthenticateResult {
  @doc("The refreshed authorization granted to this connection. Treat it as opaque. Absent for a Subscriber Access Token — your refreshed state arrives on the `signalwire.authorization.state` event instead.")
  authorization?: Record<unknown>;

  @doc("Always an empty string when present. Sent for every token except a Subscriber Access Token; ignore it.")
  @example("")
  authentication?: string;

  @doc("Updated ICE servers to use for media. Always returned — at least one entry is included.")
  ice_servers: IceServer[];
}

import "@signalwire/typespec-asyncapi";

import "./models/core.tsp";
import "./connect/main.tsp";
import "./disconnect/main.tsp";
import "./receive/main.tsp";

using SignalWire.AsyncAPI;

@doc("""
  The starting point for every Relay connection. Use the `signalwire` methods to
  authenticate, get back your authorization details and ICE servers for media, and
  subscribe to the contexts whose events you want to receive. Every other Relay
  service (`calling`, `messaging`, `tasking`, and so on) runs over a connection you
  open here.

  Browser and client apps authenticate with a `jwt_token`; backend apps that hold
  your credentials authenticate with a `project` + `token` pair. Start with
  `signalwire.connect`.
  """)
namespace Relay.Signalwire;

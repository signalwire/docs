import "@signalwire/typespec-asyncapi";

import "./operations/connect/main.tsp";
import "./operations/disconnect/main.tsp";
import "./operations/ping/main.tsp";

using SignalWire.AsyncAPI;

@doc("""
  The starting point for every Relay connection. Open the socket, then send
  `signalwire.connect` as your first message to authenticate and get back your
  authorization details and ICE servers for media. Browser and mobile apps
  authenticate with a `jwt_token`; backend apps that hold your credentials
  authenticate with a `project` + `token` pair. Every other Relay service runs over
  a connection you open here.
  """)
namespace Relay.Signalwire;

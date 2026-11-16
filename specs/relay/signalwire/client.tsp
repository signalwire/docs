import "@signalwire/typespec-asyncapi";

// Client connect (jwt_token / SAT auth) + client-only signalwire methods.
import "./operations/connect/client.tsp";
// Ping in both directions, and the server-pushed disconnect. The service sends
// these to a 4.0.0 connection but not to a 2.0.0 server connection.
import "./operations/ping/client.tsp";
import "./operations/disconnect/main.tsp";
// Token refresh (a browser/JWT concern).
import "./operations/reauthenticate/client.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Signalwire;

import "@signalwire/typespec-asyncapi";

// Client connect (jwt_token / SAT auth) + client-only signalwire methods.
import "./operations/connect/client.tsp";
// Token refresh (a browser/JWT concern).
import "./operations/reauthenticate/client.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Signalwire;

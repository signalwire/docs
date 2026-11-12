import "@signalwire/typespec-asyncapi";

// Server connect (project + token auth) + server-only signalwire methods.
import "./operations/connect/server.tsp";
// Credential refresh (project + token).
import "./operations/reauthenticate/server.tsp";
// Context subscription (protocol major < 4). `receive/main.tsp` transitively
// imports `../../models/core.tsp` for `Acknowledgement`.
import "./operations/receive/main.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Signalwire;

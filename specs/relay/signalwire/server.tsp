import "@signalwire/typespec-asyncapi";

// Server connect (project + token auth) + server-only signalwire methods.
import "./operations/connect/server.tsp";
// Client-sent ping only. The service pushes ping (>= 2.4) and disconnect (>= 2.3)
// only to newer protocol versions, and rejects any non-zero minor, so a 2.0.0
// server connection receives neither.
import "./operations/ping/server.tsp";
// Credential refresh (project + token).
import "./operations/reauthenticate/server.tsp";
// Context subscription (protocol major < 4). `receive/main.tsp` transitively
// imports `../../models/core.tsp` for `Acknowledgement`.
import "./operations/receive/main.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Signalwire;

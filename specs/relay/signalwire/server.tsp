import "@signalwire/typespec-asyncapi";

// Server-only signalwire methods: context subscription (pre-4.0 flat surface).
// `receive/main.tsp` transitively imports `../../models/core.tsp` for `Acknowledgement`.
import "./operations/receive/main.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Signalwire;

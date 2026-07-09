import "@signalwire/typespec-asyncapi";

// Client-only signalwire methods: token refresh (a browser/JWT concern).
import "./operations/reauthenticate/main.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Signalwire;

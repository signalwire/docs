import "@signalwire/typespec-asyncapi";

// Shared models, then one file per method family / event group.
import "./common.tsp";
import "./methods/core-control.tsp";
import "./events/core.tsp";

using SignalWire.AsyncAPI;

/**
 * The `calling` service controls voice calls over Relay: dialing, answering,
 * bridging, media playback/collection, recording, detection, AI, and the
 * asynchronous `calling.call.*` events that report call/leg state.
 */
@service(#{ title: "SignalWire Relay — Calling" })
@server("production", #{
  host: "relay.signalwire.com",
  protocol: "wss",
  pathname: "/api/relay/wss",
  description: "SignalWire Relay WebSocket endpoint.",
})
@channel("calling")
@bearerAuth("JWT")
namespace Relay.Calling;

import "@signalwire/typespec-asyncapi";

// SignalWire Relay is ONE WebSocket/JSON-RPC (BLADE) connection. Each sub-service is
// authored in its own directory and tagged with a `@channel`; this entry point binds
// them together under the single `Relay` service, server, and auth.
import "./signalwire/main.tsp";
import "./calling/main.tsp";
import "./messaging/main.tsp";
import "./tasking/main.tsp";
import "./provisioning/main.tsp";
import "./webrtc/main.tsp";

using SignalWire.AsyncAPI;

/**
 * SignalWire Relay is a single WebSocket connection to `relay.signalwire.com`
 * speaking JSON-RPC (BLADE). A connection is bootstrapped by `signalwire.connect`,
 * then multiplexes every service — calling, messaging, tasking, provisioning, and
 * webrtc — over the same socket, routing each request by its JSON-RPC `method`
 * namespace. Each service is grouped as its own channel.
 */
@service(#{ title: "SignalWire Relay" })
@server("production", #{
  host: "relay.signalwire.com",
  protocol: "wss",
  description: "SignalWire Relay WebSocket endpoint.",
})
@bearerAuth("JWT")
namespace Relay;

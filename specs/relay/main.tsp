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
 *
 * ## Authentication
 *
 * Authentication is performed **in-band as the first message** — there is no HTTP
 * `Authorization` header on the WebSocket handshake. After the socket opens, the
 * client sends `signalwire.connect` with its credentials in `params.authentication`:
 *
 * - **Browser / client SDKs** send a server-minted **`jwt_token`** (an API token must
 *   never be exposed in the browser).
 * - **Server SDKs** send a **`project` + `token`** pair (or a `jwt_token`).
 *
 * Once connected, every subsequent request rides the authenticated socket; a
 * `signalwire.authorization.state` event is returned for fast reconnection.
 */
@service(#{ title: "SignalWire Relay" })
@server("production", #{
  host: "relay.signalwire.com",
  protocol: "wss",
  description: "SignalWire Relay WebSocket endpoint. Authenticate in-band via signalwire.connect (no HTTP Authorization header).",
})
namespace Relay;

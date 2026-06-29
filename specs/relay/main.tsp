import "@signalwire/typespec-asyncapi";

// JSON-RPC framing (request/response/event base templates), modeled in-spec.
import "./common/frames.tsp";

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

@doc("""
  SignalWire Relay gives you a single WebSocket connection to
  `relay.signalwire.com`. Open it with `signalwire.connect`, then use any service —
  calling, messaging, tasking, provisioning, and webrtc — over that one connection.
  Each service is grouped as its own channel.

  ## Authentication

  You authenticate with your **first message** — there is no HTTP `Authorization`
  header on the WebSocket handshake. Once the socket opens, send `signalwire.connect`
  with your credentials in `params.authentication`:

  - **Browser / client SDKs** send a server-generated **`jwt_token`** (never expose
  an API token in the browser).
  - **Server SDKs** send a **`project` + `token`** pair (or a `jwt_token`).

  After you connect, every request you send reuses the authenticated connection, and a
  `signalwire.authorization.state` event comes back that lets you reconnect quickly.
  """)
@service(#{ title: "SignalWire Relay" })
@server("production", #{
  host: "relay.signalwire.com",
  protocol: "wss",
  description: "SignalWire Relay WebSocket endpoint. Open the connection, then authenticate by sending `signalwire.connect` as your first message.",
})
namespace Relay;

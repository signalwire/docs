import "@signalwire/typespec-asyncapi";
import "./common/frames.tsp";

// Shared connection lifecycle (connect / ping / disconnect)
import "./signalwire/main.tsp";
// Client-only signalwire (reauthenticate)
import "./signalwire/client.tsp";

// Client-side services
import "./webrtc/main.tsp";
import "./fabric/main.tsp";

using SignalWire.AsyncAPI;

@doc("""
  SignalWire Relay gives your browser or mobile app a single WebSocket connection to
  `relay.signalwire.com`. Open it with `signalwire.connect`, then place and control
  calls with **Call Fabric** (`call.*`, `subscriber.*`) and **WebRTC / Verto**
  (`webrtc.*`) over that one connection.

  ## Authentication

  You authenticate with your **first message**, not the WebSocket handshake — there is
  no HTTP `Authorization` header. Once the socket opens, send `signalwire.connect` with
  a **`jwt_token`** in `params.authentication` (a server-generated token — never expose
  a project API token in the browser); Call Fabric uses a Subscriber Access Token. A
  `signalwire.authorization.state` event comes back that lets you reconnect quickly,
  and `signalwire.reauthenticate` refreshes your token.

  Building a backend integration instead? See the **Server** reference for the
  `calling`, `messaging`, `tasking`, and `provisioning` surface.
  """)
@service(#{ title: "SignalWire Relay — Client" })
@server("production", #{
  host: "relay.signalwire.com",
  protocol: "wss",
  description: "SignalWire Relay WebSocket endpoint. Open the connection, then authenticate by sending `signalwire.connect` as your first message.",
})
namespace Relay;

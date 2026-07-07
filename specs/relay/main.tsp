import "@signalwire/typespec-asyncapi";
import "./common/frames.tsp";
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

  You authenticate with your **first message**, not the WebSocket handshake — there is
  no HTTP `Authorization` header. Once the socket opens, send `signalwire.connect` with
  your credentials in `params.authentication`. You choose one of two styles, once, for
  the whole connection:

  - **`jwt_token`** — a server-generated token, for browser and client SDKs (never
  expose a project API token in the browser).
  - **`project` + `token`** — your Project ID and API token, for backend SDKs that hold
  your SignalWire credentials directly.

  Either style opens the same connection; what you can then *do* over it is governed by
  the scopes granted to your credentials, not by which style you used. Every later
  request reuses the authenticated connection, and a `signalwire.authorization.state`
  event comes back that lets you reconnect quickly.
  """)
@service(#{ title: "SignalWire Relay" })
@server("production", #{
  host: "relay.signalwire.com",
  protocol: "wss",
  description: "SignalWire Relay WebSocket endpoint. Open the connection, then authenticate by sending `signalwire.connect` as your first message.",
})
namespace Relay;

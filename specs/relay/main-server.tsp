import "@signalwire/typespec-asyncapi";
import "./common/frames.tsp";

// Shared connection lifecycle (connect / ping / disconnect)
import "./signalwire/main.tsp";
// Server-only signalwire (receive / unreceive)
import "./signalwire/server.tsp";

// Server-side services
import "./calling/main.tsp";
import "./messaging/main.tsp";
import "./tasking/main.tsp";
import "./provisioning/main.tsp";

using SignalWire.AsyncAPI;

@doc("""
  SignalWire Relay gives your backend a single WebSocket connection to
  `relay.signalwire.com`. Open it with `signalwire.connect`, then control calls, send
  messages, run AI agents, and handle tasks over that one connection — `calling`,
  `messaging`, `tasking`, and `provisioning` are each grouped as their own channel.

  ## Authentication

  You authenticate with your **first message**, not the WebSocket handshake — there is
  no HTTP `Authorization` header. Once the socket opens, send `signalwire.connect` with
  your **`project` + `token`** in `params.authentication`. What you can then *do* over
  the connection is governed by the scopes granted to your credentials. Every later
  request reuses the authenticated connection.

  ## Protocol version

  Send `version: {major: 2, minor: 0, revision: 0}` on `signalwire.connect` — the
  version the server SDKs use. Calling events, `messaging.send`, `signalwire.provision`,
  and `signalwire.receive` all require a `major` below `4`: on a connection at `4.0.0`,
  Calling events are not delivered as documented here and those methods are rejected
  with `-32001`. Version `4.0.0` is for browser and Call Fabric clients.

  Building a browser or mobile client instead? See the **Client** reference for the
  Call Fabric (`call.*`, `subscriber.*`) and WebRTC (`webrtc.*`) surface.
  """)
@service(#{ title: "SignalWire Relay — Server" })
@server("production", #{
  host: "relay.signalwire.com",
  protocol: "wss",
  description: "SignalWire Relay WebSocket endpoint. Open the connection, then authenticate by sending `signalwire.connect` as your first message.",
})
namespace Relay;

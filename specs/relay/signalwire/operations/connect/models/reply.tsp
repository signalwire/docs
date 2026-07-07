import "@signalwire/typespec-asyncapi";

namespace Relay.Signalwire;

@doc("A STUN/TURN ICE server to use for media in WebRTC connections.")
model IceServer {
  @doc("The ICE server URLs.")
  @example(#["turn:turn1.signalwire.com:443", "turn:turn2.signalwire.com:443"])
  urls: string[];

  @doc("The credential (password) for connecting to these ICE servers.")
  @example("kHt9Xq2vN8pLmR3wZ7yB1cF4=")
  credential: string;

  @doc("The credential type. Currently always `password`.")
  @example("password")
  credentialType: string;

  @doc("The username to authenticate with against these ICE servers.")
  @example("1712349999:b1c2d3e4-f5a6-7b8c-9d0e-1f2a3b4c5d6e")
  username: string;

  @doc("The ICE transport policy for this server, when set (e.g. `relay`).")
  @example("relay")
  iceTransportPolicy?: string;
}

@doc("""
  The result of a successful `signalwire.connect`: the `protocol` to use on later
  requests, your `identity` and `authorization`, and any ICE servers for media.
  """)
@summary("Connect result")
model ConnectResult {
  @doc("The protocol identifier to use on your subsequent requests. The only field guaranteed on every successful connect result.")
  @example("signalwire_c1d2e3f4a5b6")
  protocol: string;

  @doc("A unique identifier for this client, valid for the life of the connection. Omitted when the platform does not assign one.")
  @example("a3f1c2d4-5e6f-7a8b-9c0d-1e2f3a4b5c6d@node.example.signalwire.com")
  identity?: string;

  @doc("""
    The authorization granted to this connection. Treat it as opaque: store it
    and pass it back unchanged when you reconnect. Omitted when there is none.
    """)
  authorization?: Record<unknown>;

  @doc("ICE servers to use for media. Returned for WebRTC connections; omitted when the connection carries no media.")
  ice_servers?: IceServer[];
}

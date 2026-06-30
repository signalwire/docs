import "@signalwire/typespec-asyncapi";

namespace Relay.Signalwire;

@doc("A STUN/TURN ICE server to use for media in WebRTC connections.")
model IceServer {
  @doc("The ICE server URLs.")
  urls: string[];
  @doc("The credential (password) for connecting to these ICE servers.")
  credential: string;
  @doc("The credential type. Currently always `password`.")
  credentialType: string;
  @doc("The username to authenticate with against these ICE servers.")
  username: string;
}

model ConnectResult {
  @doc("A unique identifier for this client, valid for the life of the connection.")
  identity: string;

  @doc("""
    The authorization granted to this connection. Treat it as opaque: store it
    and pass it back unchanged when you reconnect.
    """)
  authorization: Record<unknown>;

  @doc("The protocol identifier to use on your subsequent requests.")
  protocol: string;

  @doc("ICE servers to use for media. Returned for WebRTC connections; omitted when the connection carries no media.")
  ice_servers?: IceServer[];
}

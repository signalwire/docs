import "@signalwire/typespec-asyncapi";

using SignalWire.AsyncAPI;

namespace Relay.Signalwire;

/** A STUN/TURN ICE server to use for media in WebRTC connections. */
model IceServer {
  /** The ICE server URLs. */
  urls: string[];
  /** The credential (password) for connecting to these ICE servers. */
  credential: string;
  /** The credential type. Currently always `password`. */
  credentialType: string;
  /** The username to authenticate with against these ICE servers. */
  username: string;
}

model ConnectResult {
  /** A unique identifier for this client, valid for the life of the connection. */
  identity: string;

  /**
   * The authorization granted to this connection. Treat it as opaque: store it
   * and pass it back unchanged when you reconnect.
   */
  authorization: Record<unknown>;

  /** The protocol identifier to use on your subsequent requests. */
  protocol: string;

  /** ICE servers to use for media. Returned for WebRTC connections; omitted when the connection carries no media. */
  ice_servers?: IceServer[];
}

model AuthorizationStateParams {
  /**
   * Your current authorization state. Save it and pass it back as
   * `connect.authorization_state` when you reconnect.
   * Format: `<encryptedAuthStateBase64>:<tagBase64>`.
   */
  authorization_state: string;
}

/**
 * Delivers your latest authorization state so you can restore it if you
 * reconnect. Save the `authorization_state` value each time this event arrives.
 */
@event("signalwire.authorization.state")
@example(#{
  authorization_state: "<encryptedAuthStateBase64>:<tagBase64>",
})
model AuthorizationStateEvent {
  ...AuthorizationStateParams;
}

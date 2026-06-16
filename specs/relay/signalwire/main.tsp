import "@signalwire/typespec-asyncapi";

using SignalWire.AsyncAPI;

/**
 * The `signalwire` protocol bootstraps a Relay connection: it authenticates the
 * client to the network, returns the authorization block and ICE servers, and
 * controls context (event) subscriptions. Every other Relay service
 * (`calling`, `messaging`, `tasking`, …) rides on top of a connection
 * established here.
 */
@service(#{ title: "SignalWire Relay — Signalwire (handshake & control)" })
@server("production", #{
  host: "relay.signalwire.com",
  protocol: "wss",
  pathname: "/api/relay/wss",
  description: "SignalWire Relay WebSocket endpoint.",
})
@channel("signalwire")
@bearerAuth("JWT")
namespace Relay.Signalwire;

// ─────────────────────────────────────────────────────────────────────────────
// signalwire.connect
// ─────────────────────────────────────────────────────────────────────────────

/** Relay protocol version. Clients currently send `3.0.0`. */
model Version {
  /** Major version. Currently `3`. */
  major: int32;
  /** Minor version. Currently `0`. */
  minor: int32;
  /** Revision. Currently `0`. */
  revision: int32;
}

/** Authentication material for the connection. */
model Authentication {
  /** The project JWT used to authenticate the client. */
  jwt_token: string;
}

model ConnectParams {
  /** Protocol version the client speaks. */
  version: Version;

  /** The authentication token block. */
  authentication: Authentication;

  /** Descriptive information about the SDK and application (e.g. `somesdk-1.2.3`). */
  agent?: string;

  /**
   * When provided, lets the client attempt to "hijack" a previously-established
   * protocol (provided the project and signature allow it).
   */
  protocol?: string;

  /**
   * Encrypted authorization state from a previous `signalwire.authorization.state`
   * event, used to reestablish permissions/state on a new node after reconnect.
   * Format: `<encryptedAuthStateBase64>:<tagBase64>`.
   */
  authorization_state?: string;

  /** Contexts to begin receiving inbound events for on connect. */
  contexts?: string[];
}

/** A STUN/TURN ICE server the client should use for media. */
model IceServer {
  /** ICE server URLs. */
  urls: string[];
  /** Credential for the ICE servers (HMAC-SHA1, base64). */
  credential: string;
  /** Credential type. Currently always `password`. */
  credentialType: string;
  /** Username to use — the project id with an expiration-encoded prefix. */
  username: string;
}

model ConnectResult {
  /** The identity of the client on the BLADE network (`<nodeid>@<hagridnodeid>.<fabrichost>`). */
  identity: string;

  /**
   * The current authorization block granted to the client. Opaque to clients;
   * stored and echoed back. (Field shapes are backend-internal — modeled as a
   * free-form object pending source confirmation.)
   */
  authorization: Record<unknown>;

  /** The protocol the client should use for subsequent requests. */
  protocol: string;

  /** ICE servers for media. */
  ice_servers: IceServer[];
}

/**
 * Establish connectivity with the network as an edge client and recover critical
 * connection information. After a successful connect a
 * `signalwire.authorization.state` event is sent with the current authorization
 * state for future reconnections.
 */
@rpcMethod("signalwire.connect")
@summary("Authenticate and establish a Relay connection")
op connect(...ConnectParams): ConnectResult;

// ─────────────────────────────────────────────────────────────────────────────
// signalwire.disconnect (server-initiated)
// ─────────────────────────────────────────────────────────────────────────────

model DisconnectParams {
  /** Indicates the client should restart with a fresh connection. */
  restart?: boolean;
}

/** Empty acknowledgement. */
model DisconnectResult {}

/**
 * Tells the client the service is about to disconnect it and that buffers should
 * be flushed (e.g. during a deployment). The client is expected to reply; this
 * reply should be the last thing it sends before the socket closes.
 *
 * Note: this message is sent server→client. It is documented here for
 * completeness; clients respond rather than initiate it.
 */
@rpcMethod("signalwire.disconnect")
@summary("Service is about to disconnect the client")
op disconnect(...DisconnectParams): DisconnectResult;

// ─────────────────────────────────────────────────────────────────────────────
// signalwire.receive / signalwire.unreceive
// ─────────────────────────────────────────────────────────────────────────────

/** Standard `{code, message}` acknowledgement used by receive/unreceive. */
model Acknowledgement {
  /** Result code (string). `"200"` on success; e.g. `"402"` Payment required. */
  code: string;
  /** Human-readable result message. */
  message: string;
}

model ReceiveParams {
  /**
   * A single context to set up for receiving inbound events.
   * Deprecated — use `contexts`.
   */
  #deprecated "Use `contexts` instead."
  context?: string;

  /** Multiple contexts to set up for receiving inbound events at once. */
  contexts?: string[];
}

/**
 * Request incoming events from SignalWire contexts on a previously-setup
 * protocol. Used for many different inbound receivers.
 */
@rpcMethod("signalwire.receive")
@summary("Subscribe to inbound events on one or more contexts")
op receive(...ReceiveParams): Acknowledgement;

model UnreceiveParams {
  /** Contexts to stop receiving events for. */
  contexts: string[];
}

/** Request incoming events from the given SignalWire contexts to stop. */
@rpcMethod("signalwire.unreceive")
@summary("Unsubscribe from inbound events on one or more contexts")
op unreceive(...UnreceiveParams): Acknowledgement;

// ─────────────────────────────────────────────────────────────────────────────
// setup (deprecated — superseded by signalwire.connect)
// ─────────────────────────────────────────────────────────────────────────────

model SetupParams {
  /** A protocol to recover. */
  protocol?: string;
}

model SetupResult {
  /** The protocol string the client should use for subsequent requests. */
  protocol: string;
}

/**
 * Request a Relay protocol. Deprecated — use `signalwire.connect`, which
 * supersedes setup and also accepts `contexts` directly.
 */
@rpcMethod("setup")
@summary("(Deprecated) Request a Relay protocol — use signalwire.connect")
op setup(...SetupParams): SetupResult;

// ─────────────────────────────────────────────────────────────────────────────
// Events
// ─────────────────────────────────────────────────────────────────────────────

model AuthorizationStateParams {
  /**
   * Encrypted authorization state (and validation tag) the client can present on
   * reconnect via `connect.authorization_state`.
   * Format: `<encryptedAuthStateBase64>:<tagBase64>`.
   */
  authorization_state: string;
}

/**
 * Provides updated authorization state to the client so it can reestablish that
 * state if it reconnects to another node.
 */
@event("signalwire.authorization.state")
model AuthorizationStateEvent {
  ...AuthorizationStateParams;
}

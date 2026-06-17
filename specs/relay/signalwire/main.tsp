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
  /** A unique identifier assigned to this client for the duration of the connection. */
  identity: string;

  /**
   * The authorization block granted to this connection. Treat it as opaque:
   * store it and present it unchanged when reconnecting.
   */
  authorization: Record<unknown>;

  /** The protocol the client should use for subsequent requests. */
  protocol: string;

  /** ICE servers for media. Present for WebRTC clients; omitted when the connection carries no media. */
  ice_servers?: IceServer[];
}

/**
 * Establish connectivity with the network as an edge client and recover critical
 * connection information. After a successful connect a
 * `signalwire.authorization.state` event is sent with the current authorization
 * state for future reconnections.
 */
@rpcMethod("signalwire.connect")
@summary("Authenticate and establish a Relay connection")
@opExample(#{
  parameters: #{
    version: #{ major: 3, minor: 0, revision: 0 },
    authentication: #{ jwt_token: "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9...." },
    agent: "somesdk-1.2.3",
    protocol: "signalwire_........",
    authorization_state: "<encryptedAuthStateBase64>:<tagBase64>",
    contexts: #["office"],
  },
  returnType: #{
    identity: "c1a2b3d4-5e6f-7a8b-9c0d-1e2f3a4b5c6d",
    authorization: #{},
    protocol: "signalwire_........",
    ice_servers: #[
      #{
        urls: #["turn1.signalwire.com", "turn2.signalwire.com"],
        credential: "<HMACSHA1Base64>",
        credentialType: "password",
        username: "<expiration>:<projectid>",
      }
    ],
  },
})
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
@opExample(#{
  parameters: #{ restart: true },
  returnType: #{},
})
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
@opExample(#{
  parameters: #{ contexts: #["pbx"] },
  returnType: #{ code: "200", message: "Receiving events" },
})
op receive(...ReceiveParams): Acknowledgement;

model UnreceiveParams {
  /** Contexts to stop receiving events for. */
  contexts: string[];
}

/** Request incoming events from the given SignalWire contexts to stop. */
@rpcMethod("signalwire.unreceive")
@summary("Unsubscribe from inbound events on one or more contexts")
@opExample(#{
  parameters: #{ contexts: #["pbx", "asdf"] },
  returnType: #{ code: "200", message: "Unreceiving events" },
})
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
@opExample(#{
  parameters: #{ protocol: "signalwire_<SIGNATURE>_<UUID>_<PROJECT-ID>" },
  returnType: #{ protocol: "signalwire_xyze2e6acb37a98e6f8363b2a7c5bc5aa90e846752d01a4f0f5a788bafa4682b_ca00e9e7-XXXX-YYYY-ZZZZ-894991ce3f46_78429ef1-1234-5678-9000-16b59f95bb1f" },
})
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
@example(#{
  authorization_state: "<encryptedAuthStateBase64>:<tagBase64>",
})
model AuthorizationStateEvent {
  ...AuthorizationStateParams;
}

import "@signalwire/typespec-asyncapi";

using SignalWire.AsyncAPI;

/**
 * The starting point for every Relay connection. Use the `signalwire` methods to
 * authenticate, get back your authorization details and ICE servers for media, and
 * subscribe to the contexts whose events you want to receive. Every other Relay
 * service (`calling`, `messaging`, `tasking`, and so on) runs over a connection you
 * open here.
 *
 * Browser and client apps authenticate with a `jwt_token`; backend apps that hold
 * your credentials authenticate with a `project` + `token` pair. Start with
 * `signalwire.connect`.
 */
namespace Relay.Signalwire;

// ─────────────────────────────────────────────────────────────────────────────
// signalwire.connect
// ─────────────────────────────────────────────────────────────────────────────

/** The Relay protocol version your client speaks. Currently `3.0.0`. */
model Version {
  /** Major version. Currently `3`. */
  major: int32;
  /** Minor version. Currently `0`. */
  minor: int32;
  /** Revision. Currently `0`. */
  revision: int32;
}

/**
 * JWT authentication, for browser and client apps. Generate the JWT on your
 * backend and hand it to the client — never ship a project API token to the browser.
 */
model JwtAuthentication {
  /** The JWT that authenticates this client, created by your backend. */
  jwt_token: string;
}

/**
 * Project + API token authentication, for backend apps that hold your
 * SignalWire credentials directly.
 */
model ProjectTokenAuthentication {
  /** Your SignalWire Project ID. */
  project: string;

  /** Your SignalWire API token. */
  token: string;
}

model ConnectParams {
  /** The Relay protocol version your client speaks. */
  version: Version;

  /**
   * The credentials that authenticate this connection — this is how you log in to
   * Relay. Send either a `jwt_token` (browser and client apps) or a `project` +
   * `token` pair (backend apps).
   */
  authentication: JwtAuthentication | ProjectTokenAuthentication;

  /** A label identifying your SDK and application, for example `somesdk-1.2.3`. */
  agent?: string;

  /**
   * The protocol identifier to resume. Provide this to rejoin a protocol you
   * established earlier, when your project and signature permit it.
   */
  protocol?: string;

  /**
   * Authorization state from an earlier `signalwire.authorization.state` event.
   * Pass it back when reconnecting to restore your permissions and state.
   * Format: `<encryptedAuthStateBase64>:<tagBase64>`.
   */
  authorization_state?: string;

  /** Contexts to start receiving inbound events for as soon as you connect. */
  contexts?: string[];
}

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

/**
 * Authenticate and open your Relay connection. Call this first, before any other
 * Relay command: send your credentials and protocol version, and you get back your
 * `identity`, `authorization`, the `protocol` to use on later requests, and ICE
 * servers for media. Right after a successful connect you also receive a
 * `signalwire.authorization.state` event — save its `authorization_state` so you
 * can restore your session if you need to reconnect.
 */
@channel("signalwire.connect")
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
op connect(...ConnectParams): ConnectResult | AuthorizationStateEvent;

// ─────────────────────────────────────────────────────────────────────────────
// signalwire.disconnect (server-initiated)
// ─────────────────────────────────────────────────────────────────────────────

model DisconnectParams {
  /** When `true`, you should open a fresh connection after disconnecting. */
  restart?: boolean;
}

/** Empty acknowledgement. */
model DisconnectResult {}

/**
 * A heads-up that SignalWire is about to close your connection — for example
 * during a deployment — so you can flush anything pending. Reply to acknowledge;
 * that reply should be the last thing you send before the connection closes. If
 * `restart` is `true`, reconnect afterward.
 *
 * You receive this message; you don't send it.
 */
@channel("signalwire.disconnect")
@summary("Service is about to disconnect the client")
@opExample(#{
  parameters: #{ restart: true },
  returnType: #{},
})
op disconnect(...DisconnectParams): DisconnectResult;

// ─────────────────────────────────────────────────────────────────────────────
// signalwire.receive / signalwire.unreceive
// ─────────────────────────────────────────────────────────────────────────────

/** A `{code, message}` acknowledgement returned by receive and unreceive. */
model Acknowledgement {
  /** The result code as a string. `"200"` means success; `"402"` means payment required. */
  code: string;
  /** A human-readable message describing the result. */
  message: string;
}

model ReceiveParams {
  /** The contexts to start receiving inbound events for. */
  contexts?: string[];
}

/**
 * Subscribe to one or more contexts so you start receiving inbound events for
 * them. This is how you ask SignalWire to deliver unsolicited notifications to
 * your connection — most importantly the `calling.call.receive` event for an
 * inbound call, which only reaches clients that have subscribed to the call's
 * context.
 */
@channel("signalwire.receive")
@summary("Subscribe to inbound events on one or more contexts")
@opExample(#{
  parameters: #{ contexts: #["pbx"] },
  returnType: #{ code: "200", message: "Receiving events" },
})
op receive(...ReceiveParams): Acknowledgement | Relay.Calling.CallReceiveEvent;

model UnreceiveParams {
  /** The contexts to stop receiving events for. */
  contexts: string[];
}

/** Unsubscribe from one or more contexts so you stop receiving their inbound events. */
@channel("signalwire.unreceive")
@summary("Unsubscribe from inbound events on one or more contexts")
@opExample(#{
  parameters: #{ contexts: #["pbx", "asdf"] },
  returnType: #{ code: "200", message: "Unreceiving events" },
})
op unreceive(...UnreceiveParams): Acknowledgement;

// ─────────────────────────────────────────────────────────────────────────────
// Events
// ─────────────────────────────────────────────────────────────────────────────

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

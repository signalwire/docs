import "@signalwire/typespec-asyncapi";

using SignalWire.AsyncAPI;

namespace Relay.Signalwire;

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

import "@signalwire/typespec-asyncapi";

using SignalWire.AsyncAPI;

namespace Relay.Signalwire;

@doc("""
  Fresh credentials for `signalwire.reauthenticate`. Provide a new `jwt_token` — for Call
  Fabric a Subscriber Access Token (SAT). When reauthenticating a legacy (non-SAT) JWT
  connection you may also pass `project`; for a SAT it is ignored.
  """)
model ReauthenticateAuthentication {
  @doc("Your SignalWire Project ID. Only used when reauthenticating a legacy (non-SAT) JWT connection, where it must match the project the connection already authenticated with — reauthenticating into a different project is rejected. Ignored for a Subscriber Access Token.")
  @example("b1c2d3e4-f5a6-7b8c-9d0e-1f2a3b4c5d6e")
  project?: string;

  @doc("A new JWT to authenticate this connection with, created by your backend.")
  @example("eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.payload.sig")
  jwt_token: string;
}

@doc("""
  The parameters you send with `signalwire.reauthenticate`: fresh credentials to
  apply to the current connection, and — for token-bound connections — a matching
  proof-of-possession token.
  """)
@summary("Reauthenticate parameters")
model ReauthenticateParams {
  @doc("""
    The new credentials to apply to this connection. Rotating auth this way keeps the
    connection — and any in-progress media — open, unlike reconnecting.
    """)
  authentication: ReauthenticateAuthentication;

  @doc("""
    Proof-of-possession token, required when this connection was established with a
    client-bound token. Leave it unset otherwise.
    """)
  @example("eyJ0eXAiOiJkcG9wK2p3dCIsImFsZyI6IkVTMjU2In0.eyJodG0iOiJQT1NUIn0.sig")
  dpop_token?: string;
}

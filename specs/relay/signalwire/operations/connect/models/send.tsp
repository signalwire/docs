import "@signalwire/typespec-asyncapi";

using SignalWire.AsyncAPI;

namespace Relay.Signalwire;

@doc("The Relay protocol version your client speaks. Current Relay realtime SDKs send `4.0.0`. The platform accepts any version up to major `4`; a connection reporting a major above `4` is rejected.")
model Version {
  @doc("Major version. Current Relay realtime SDKs send `4`; the platform accepts up to major `4`.")
  @example(4)
  major: int32;
  @doc("Minor version. Current Relay realtime SDKs send `0`.")
  @example(0)
  minor: int32;
  @doc("Revision. Current Relay realtime SDKs send `0`.")
  @example(0)
  revision: int32;
}

@doc("""
  JWT authentication, for browser and client apps. Generate the JWT on your
  backend and hand it to the client — never ship a project API token to the browser.
  """)
model JwtAuthentication {
  @doc("The JWT that authenticates this client, created by your backend.")
  @example("eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.payload.sig")
  jwt_token: string;
}

@doc("""
  Project + API token authentication, for backend apps that hold your
  SignalWire credentials directly.
  """)
model ProjectTokenAuthentication {
  @doc("Your SignalWire Project ID.")
  @example("b1c2d3e4-f5a6-7b8c-9d0e-1f2a3b4c5d6e")
  project: string;

  @doc("Your SignalWire API token.")
  @example("PT1a2b3c4d5e6f7a8b9c0d1e2f3a4b5c6d")
  token: string;
}

model ConnectParams {
  @doc("The Relay protocol version your client speaks.")
  version: Version;

  @doc("""
    The credentials that authenticate this connection — this is how you log in to
    Relay. Send either a `jwt_token` (browser and client apps) or a `project` +
    `token` pair (backend apps).
    """)
  authentication: JwtAuthentication | ProjectTokenAuthentication;

  @doc("A label identifying your SDK and application, for example `somesdk-1.2.3`.")
  @example("somesdk-1.2.3")
  agent?: string;

  @doc("""
    The protocol identifier to resume. Provide this to rejoin a protocol you
    established earlier, when your project and signature permit it.
    """)
  @example("signalwire_c1d2e3f4a5b6")
  protocol?: string;

  @doc("""
    Authorization state from an earlier `signalwire.authorization.state` event.
    Pass it back when reconnecting to restore your permissions and state.
    Format: `<encryptedAuthStateBase64>:<tagBase64>`.
    """)
  @example("eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..aBcDeF:Z9y8x7w6v5")
  authorization_state?: string;

  @doc("""
    Contexts to start receiving inbound events for as soon as you connect. This is
    the current (4.0) subscription mechanism — subscribe here at connect time rather
    than with the legacy `signalwire.receive`/`signalwire.unreceive` methods.
    """)
  @example(#["office", "support"])
  contexts?: string[];

  @doc("Whether the client acknowledges events; SDKs default to true.")
  @example(true)
  event_acks?: boolean;

  @doc("DPoP proof JWT for Client-Bound SATs.")
  @example("eyJ0eXAiOiJkcG9wK2p3dCIsImFsZyI6IkVTMjU2In0.eyJodG0iOiJQT1NUIn0.sig")
  dpop_token?: string;
}

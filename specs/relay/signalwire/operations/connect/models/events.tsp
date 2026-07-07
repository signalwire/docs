import "@signalwire/typespec-asyncapi";
import "../../../../common/frames.tsp";
import "@typespec/openapi";

using TypeSpec.OpenAPI;

namespace Relay.Signalwire;

@doc("The payload of a `signalwire.authorization.state` event, carrying your latest authorization state.")
model AuthorizationStateParams {
  @doc("""
    Your current authorization state — an opaque string. Save it and pass it back
    unchanged as `connect.authorization_state` when you reconnect.
    """)
  @example("eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..aBcDeF:Z9y8x7w6v5")
  authorization_state: string;
}

const signalwireAuthorizationState = "signalwire.authorization.state";
@doc("""
  Delivers your latest authorization state so you can restore it if you
  reconnect. Save the `authorization_state` value each time this event arrives.
  """)
@summary(signalwireAuthorizationState)
@extension("x-fern-display-name", signalwireAuthorizationState)
model AuthorizationStateEvent is SignalwireEvent<typeof signalwireAuthorizationState, AuthorizationStateParams>;

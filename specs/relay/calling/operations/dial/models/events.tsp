import "@signalwire/typespec-asyncapi";
import "../../../../common/frames.tsp";
import "@typespec/openapi";

import "../../../models/core.tsp";
import "../../../models/devices.tsp";
import "../../../events/shared.tsp";

using TypeSpec.OpenAPI;

namespace Relay.Calling;

@summary("Dial event payload")
model CallDialParams {
  @doc("Opaque identifier that, paired with `call_id`, scopes this dial and its resulting call. Echo it back on follow-up commands; treat it as opaque.")
  @example("a3f1c2d4-5e6f-7a8b-9c0d-1e2f3a4b5c6d")
  node_id: string;

  @doc("The `tag` you set on the `calling.dial` request, so you can match this event to it.")
  @example("my-tag-1")
  tag: string;

  @doc("Where the dial stands: `dialing`, `answered`, or `failed`.")
  @example("answered")
  dial_state: "dialing" | "answered" | "failed";

  @doc("The call that answered, as a full call-state payload (the same shape as a `calling.call.state` event). Present only when `dial_state` is `answered`; the winning leg is marked by `dial_winner`.")
  call?: CallStateParams;

  @doc("Why the dial failed. Present when `dial_state` is `failed`.")
  @example("NO_ANSWER")
  reason?: string;

  @doc("What caused the dial to fail. Present when `dial_state` is `failed`.")
  @example("callee")
  source?: string;
}

const callingCallDial = "calling.call.dial";
@doc("Fires as a `calling.dial` request progresses. Watch `dial_state` to know when your call is ringing, has been answered, or failed; when it is answered the `call` field gives you the call that picked up.")
@summary(callingCallDial)
@extension("x-fern-display-name", callingCallDial)
model CallDialEvent is SignalwireEvent<typeof callingCallDial, CallDialParams>;

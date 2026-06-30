import "@signalwire/typespec-asyncapi";
import "../../../../common/frames.tsp";
import "@typespec/openapi";

import "../../../models/core.tsp";
import "../../../models/devices.tsp";

using TypeSpec.OpenAPI;

namespace Relay.Calling;

@doc("The call that answered, included once a `calling.dial` succeeds.")
model DialWinnerCall {
  @doc("Identifier of the node hosting the answered call.")
  node_id?: string;

  @doc("The answered call's `call_id`.")
  call_id?: string;

  @doc("The `tag` set on the answered call.")
  tag?: string;

  @doc("The device that answered.")
  device?: CallDevice;

  @doc("`\"true\"` for the call that won the dial. When you dial several destinations at once, this marks the first one to answer. Present only on the winning call.")
  dial_winner?: "true";
}

model CallDialParams {
  @doc("Identifier of the node handling the dial.")
  node_id: string;

  @doc("The `tag` you set on the `calling.dial` request, so you can match this event to it.")
  tag: string;

  @doc("Where the dial stands: `dialing`, `answered`, or `failed`.")
  dial_state: "dialing" | "answered" | "failed";

  @doc("The call that answered. Present only when `dial_state` is `answered`.")
  call?: DialWinnerCall;

  @doc("Why the dial failed. Present when `dial_state` is `failed`.")
  reason?: string;

  @doc("What caused the dial to fail. Present when `dial_state` is `failed`.")
  source?: string;
}

const callingCallDial = "calling.call.dial";
@doc("Fires as a `calling.dial` request progresses. Watch `dial_state` to know when your call is ringing, has been answered, or failed; when it is answered the `call` field gives you the call that picked up.")
@summary(callingCallDial)
@extension("x-fern-display-name", callingCallDial)
model CallDialEvent is SignalwireEvent<typeof callingCallDial, CallDialParams>;

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
  @example("a3f1c2d4-5e6f-7a8b-9c0d-1e2f3a4b5c6d")
  node_id?: string;

  @doc("The answered call's `call_id`.")
  @example("c2a1e9f4-6b3d-4e7a-8f1c-2d3e4f5a6b7c")
  call_id?: string;

  @doc("The `tag` set on the answered call.")
  @example("my-tag-1")
  tag?: string;

  @doc("The device that answered.")
  device?: CallDevice;

  @doc("`\"true\"` for the call that won the dial. When you dial several destinations at once, this marks the first one to answer. Present only on the winning call.")
  @example("true")
  dial_winner?: "true";
}

model CallDialParams {
  @doc("Identifier of the node handling the dial.")
  @example("a3f1c2d4-5e6f-7a8b-9c0d-1e2f3a4b5c6d")
  node_id: string;

  @doc("The `tag` you set on the `calling.dial` request, so you can match this event to it.")
  @example("my-tag-1")
  tag: string;

  @doc("Where the dial stands: `dialing`, `answered`, or `failed`.")
  @example("answered")
  dial_state: "dialing" | "answered" | "failed";

  @doc("The call that answered. Present only when `dial_state` is `answered`.")
  call?: DialWinnerCall;

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

import "@signalwire/typespec-asyncapi";
import "../../../../common/frames.tsp";
import "@typespec/openapi";

import "../../../models/core.tsp";

using TypeSpec.OpenAPI;

namespace Relay.Calling;

// ─────────────────────────────────────────────────────────────────────────────
// calling.call.pay
// ─────────────────────────────────────────────────────────────────────────────

@doc("Where a payment is in its lifecycle: `processing`, `finished`, or `error`.")
union PayState {
  "processing",
  "finished",
  "error",
}

model CallPayParams {
  ...CallAddress;

  @doc("The `control_id` of the payment this event belongs to.")
  control_id: string;

  @doc("Whether the payment is in progress (`processing`), completed (`finished`), or failed (`error`).")
  state: PayState;
}

const callingCallPay = "calling.call.pay";
@doc("Fires as a pay session progresses, letting you track whether it is processing, has finished, or hit an error.")
@summary(callingCallPay)
@extension("x-fern-display-name", callingCallPay)
model CallPayEvent is SignalwireEvent<typeof callingCallPay, CallPayParams>;

// NOTE: `calling.error` is intentionally NOT modeled here. Verified in
// mod_infrastructure/relay.c (relay_call_error_event_create, ~line 1545): error events have their
// event_channel rewritten to the call_id specifically so they are "only delivered to database / UI"
// and "do not get delivered over websocket to client SDK." Clients never receive it. Operation
// failures surface to clients via each command's own event error state (e.g. call.play
// state:"error", CallCollectResultError, call.detect "error") and the RPC reply.

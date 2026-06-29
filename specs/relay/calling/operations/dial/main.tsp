import "@signalwire/typespec-asyncapi";

import "./models/requests.tsp";
import "./models/responses.tsp";
import "../../events/state.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model DialRequest is JsonRpcRequest<"calling.dial", DialParams>;
@reply model DialReply is JsonRpcResponse<DialResult>;

@doc("""
  Places one or more outbound calls to the devices you specify. The first device
  to answer wins, and any others stop ringing. Use this to start a brand-new call
  (as opposed to `calling.connect`, which adds a leg to an existing call). The
  synchronous result only confirms the request was accepted — the call's
  identifiers and progress arrive asynchronously through `calling.call.dial` and
  `calling.call.state` events keyed on `tag`.
  """)
// NOTE: no @opExample here — the required `devices: DialDevice[][]` is a @discriminator
// base, and TypeSpec value-checking does not narrow a discriminated base to its
// variant, so an inline frame example can't carry real device `params`. The
// DialDevice variant models in common.tsp carry schema-level @example values instead.
@channel("calling.dial")
@summary("Dial outbound call(s); first to answer wins")
op dial(...DialRequest): DialReply | CallDialEvent;

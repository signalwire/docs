import "@signalwire/typespec-asyncapi";
import "../../../common/frames.tsp";
import "@typespec/openapi";

import "./models/requests.tsp";
import "./models/responses.tsp";
import "../../events/state.tsp";

using SignalWire.AsyncAPI;
using TypeSpec.OpenAPI;

namespace Relay.Calling;

// Single source of truth for this method's wire name: the JSON-RPC `method` (via typeof, a type
// context), the @channel, and the Fern display name all reference this one const.
const callingDial = "calling.dial";
const callingDialResponse = "${callingDial} response";

model DialRequest is JsonRpcRequest<typeof callingDial, DialParams>;

@extension("x-fern-display-name", callingDialResponse)
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
@channel(callingDial)
@summary("Dial outbound call(s); first to answer wins")
@extension("x-fern-display-name", callingDial)
op dial(...DialRequest): DialReply | CallDialEvent;

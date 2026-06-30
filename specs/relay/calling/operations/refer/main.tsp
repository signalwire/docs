import "@signalwire/typespec-asyncapi";
import "../../../common/frames.tsp";
import "@typespec/openapi";

import "./models/requests.tsp";
import "./models/responses.tsp";
import "../../events/refer.tsp";

using SignalWire.AsyncAPI;
using TypeSpec.OpenAPI;

namespace Relay.Calling;

const callingRefer = "calling.refer";
const callingReferResponse = "${callingRefer} response";

model ReferRequest is JsonRpcRequest<typeof callingRefer, ReferParams>;
@extension("x-fern-display-name", callingReferResponse)
@reply model ReferReply is JsonRpcResponse<ReferResult>;

// NOTE: no @opExample here — `device: ReferDevice` is a REQUIRED @discriminator union,
// and TypeSpec value-checking does not narrow a discriminated base to its variant, so an
// inline frame example can't carry real `params`. The ReferSipDevice variant model carries
// a schema-level @example value instead.
@doc("Transfers a SIP call to another SIP endpoint using a SIP REFER. Use it to hand the call off to an external destination without staying in the media path. The result confirms the refer was sent; the transfer's progress and final outcome arrive on a refer event.")
@channel(callingRefer)
@summary("Transfer a SIP call via SIP REFER")
@extension("x-fern-display-name", callingRefer)
op refer(...ReferRequest): ReferReply | CallReferEvent;

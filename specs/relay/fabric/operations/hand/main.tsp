import "@signalwire/typespec-asyncapi";
import "../../../common/frames.tsp";
import "@typespec/openapi";

import "./models/send.tsp";

using SignalWire.AsyncAPI;
using TypeSpec.OpenAPI;

namespace Relay.Fabric;

const callRaisehand = "call.raisehand";
const callRaisehandResponse = "${callRaisehand} response";
model RaisehandRequest is JsonRpcRequest<typeof callRaisehand, RaisehandParams>;
model RaisehandResult { ...FabricResult<"Hand raised">; }
@extension("x-fern-display-name", callRaisehandResponse)
@reply
model RaisehandReply is JsonRpcResponse<RaisehandResult>;

@doc("Raises a member's hand in a Call Fabric conference. Target yourself with `self` or another member with `target`. A `member.updated` event follows for the affected member.")
@channel(callRaisehand)
@summary("Raise a member's hand")
@extension("x-fern-display-name", callRaisehand)
op raisehand(...RaisehandRequest): RaisehandReply;

const callLowerhand = "call.lowerhand";
const callLowerhandResponse = "${callLowerhand} response";
model LowerhandRequest is JsonRpcRequest<typeof callLowerhand, LowerhandParams>;
model LowerhandResult { ...FabricResult<"Hand lowered">; }
@extension("x-fern-display-name", callLowerhandResponse)
@reply
model LowerhandReply is JsonRpcResponse<LowerhandResult>;

@doc("Lowers a member's hand, reversing `call.raisehand`. Target yourself with `self` or another member with `target`. A `member.updated` event follows.")
@channel(callLowerhand)
@summary("Lower a member's hand")
@extension("x-fern-display-name", callLowerhand)
op lowerhand(...LowerhandRequest): LowerhandReply;

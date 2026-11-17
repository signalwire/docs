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
model RaisehandResult { ...FabricResult; }
@extension("x-fern-display-name", callRaisehandResponse)
@reply
model RaisehandReply is JsonRpcResponse<RaisehandResult>;

@doc("""
  Raises your hand in a Call Fabric conference. Set `target` equal to `self`. A
  `member.updated` event follows.

  Returns code `"403"` when `target` is another member, unless your token grants that
  capability. It also returns `"403"` when the target is on a 1:1 call rather than in a
  conference, or when you lack permission.
  """)
@channel(callRaisehand)
@summary("Raise a member's hand")
@extension("x-fern-display-name", callRaisehand)
op raisehand(...RaisehandRequest): RaisehandReply;

const callLowerhand = "call.lowerhand";
const callLowerhandResponse = "${callLowerhand} response";
model LowerhandRequest is JsonRpcRequest<typeof callLowerhand, LowerhandParams>;
model LowerhandResult { ...FabricResult; }
@extension("x-fern-display-name", callLowerhandResponse)
@reply
model LowerhandReply is JsonRpcResponse<LowerhandResult>;

@doc("""
  Lowers your hand, reversing `call.raisehand`. Set `target` equal to `self`. A
  `member.updated` event follows.

  Returns code `"403"` when `target` is another member, unless your token grants that
  capability. It also returns `"403"` when the target is on a 1:1 call rather than in a
  conference, or when you lack permission.
  """)
@channel(callLowerhand)
@summary("Lower a member's hand")
@extension("x-fern-display-name", callLowerhand)
op lowerhand(...LowerhandRequest): LowerhandReply;

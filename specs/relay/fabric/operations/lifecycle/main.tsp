import "@signalwire/typespec-asyncapi";
import "../../../common/frames.tsp";
import "@typespec/openapi";

import "./models/send.tsp";

using SignalWire.AsyncAPI;
using TypeSpec.OpenAPI;

namespace Relay.Fabric;

const callEnd = "call.end";
const callEndResponse = "${callEnd} response";
model EndRequest is JsonRpcRequest<typeof callEnd, EndParams>;
model EndResult { ...FabricResult<"Ended">; }
@extension("x-fern-display-name", callEndResponse)
@reply
model EndReply is JsonRpcResponse<EndResult>;

@doc("Ends a Call Fabric call leg. Target your own leg with `self` or another member's with `target`. Fires `call.left`, `member.left`, and `call.state` as the leg tears down.")
@channel(callEnd)
@summary("End a call leg")
@extension("x-fern-display-name", callEnd)
op end(...EndRequest): EndReply;

const callHangup = "call.hangup";
const callHangupResponse = "${callHangup} response";
model HangupRequest is JsonRpcRequest<typeof callHangup, HangupParams>;
model HangupResult { ...FabricResult<"Hung up">; }
@extension("x-fern-display-name", callHangupResponse)
@reply
model HangupReply is JsonRpcResponse<HangupResult>;

@doc("Hangs up your own call leg. Unlike `call.end`, this always acts on `self`. Fires `call.left`, `member.left`, and `call.state`.")
@channel(callHangup)
@summary("Hang up your call leg")
@extension("x-fern-display-name", callHangup)
op hangup(...HangupRequest): HangupReply;

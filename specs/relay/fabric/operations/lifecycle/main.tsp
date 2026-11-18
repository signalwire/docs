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
model EndResult { ...FabricResult; }
@extension("x-fern-display-name", callEndResponse)
@reply
model EndReply is JsonRpcResponse<EndResult>;

@doc("""
  Ends the call that `target` is on. What that means depends on the call:

  - **1:1 call** — hangs up the `target` leg. Fires `call.left`, `member.left`, and
    `call.state` as the leg tears down.
  - **Conference** — removes **every** member from the conference, not just `target`.
    To remove one member and leave the rest in place, use `call.member.remove`; to
    leave yourself, use `call.hangup`.

  Returns code `"403"` when you lack permission to end the call.
  """)
@channel(callEnd)
@summary("End a call leg")
@extension("x-fern-display-name", callEnd)
op end(...EndRequest): EndReply;

const callHangup = "call.hangup";
const callHangupResponse = "${callHangup} response";
model HangupRequest is JsonRpcRequest<typeof callHangup, HangupParams>;
model HangupResult { ...FabricResult; }
@extension("x-fern-display-name", callHangupResponse)
@reply
model HangupReply is JsonRpcResponse<HangupResult>;

@doc("Hangs up your own call leg. Unlike `call.end`, this always acts on `self`. Fires `call.left`, `member.left`, and `call.state`.")
@channel(callHangup)
@summary("Hang up your call leg")
@extension("x-fern-display-name", callHangup)
op hangup(...HangupRequest): HangupReply;

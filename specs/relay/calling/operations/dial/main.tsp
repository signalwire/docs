import "@signalwire/typespec-asyncapi";
import "../../../common/frames.tsp";
import "@typespec/openapi";

import "./models/send.tsp";
import "./models/reply.tsp";
import "./models/events.tsp";

using SignalWire.AsyncAPI;
using TypeSpec.OpenAPI;

namespace Relay.Calling;

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
@channel(callingDial)
@summary("Dial outbound call(s); first to answer wins")
@extension("x-fern-display-name", callingDial)
@extension("x-fern-sdk-group-name", GroupSetupDial)
op dial(...DialRequest): DialReply | CallDialEvent;

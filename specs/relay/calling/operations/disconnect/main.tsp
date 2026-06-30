import "@signalwire/typespec-asyncapi";
import "../../../common/frames.tsp";
import "@typespec/openapi";

import "./models/requests.tsp";
import "./models/responses.tsp";

using SignalWire.AsyncAPI;
using TypeSpec.OpenAPI;

namespace Relay.Calling;

const callingDisconnect = "calling.disconnect";
const callingDisconnectResponse = "${callingDisconnect} response";

model DisconnectRequest is JsonRpcRequest<typeof callingDisconnect, DisconnectParams>;

@extension("x-fern-display-name", callingDisconnectResponse)
@reply model DisconnectReply is JsonRpcResponse<DisconnectResult>;

@doc("""
  Splits apart legs that were joined with `calling.connect`, separating the calls
  without hanging up on either one. Each call stays live so you can keep
  controlling it or connect it elsewhere.
  """)
@channel(callingDisconnect)
@summary("Disconnect connected legs without hanging up")
@extension("x-fern-display-name", callingDisconnect)
op disconnect(...DisconnectRequest): DisconnectReply;

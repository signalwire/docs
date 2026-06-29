import "@signalwire/typespec-asyncapi";

import "./models/requests.tsp";
import "./models/responses.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model DisconnectRequest is JsonRpcRequest<"calling.disconnect", DisconnectParams>;
@reply model DisconnectReply is JsonRpcResponse<DisconnectResult>;

@doc("""
  Splits apart legs that were joined with `calling.connect`, separating the calls
  without hanging up on either one. Each call stays live so you can keep
  controlling it or connect it elsewhere.
  """)
@channel("calling.disconnect")
@summary("Disconnect connected legs without hanging up")
op disconnect(...DisconnectRequest): DisconnectReply;

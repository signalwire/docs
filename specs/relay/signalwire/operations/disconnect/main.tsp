import "@signalwire/typespec-asyncapi";

import "./models/requests.tsp";
import "./models/responses.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Signalwire;

model DisconnectRequest is JsonRpcRequest<"signalwire.disconnect", DisconnectParams>;
@reply model DisconnectReply is JsonRpcResponse<DisconnectResult>;

@doc("""
  A heads-up that SignalWire is about to close your connection — for example
  during a deployment — so you can flush anything pending. Reply to acknowledge;
  that reply should be the last thing you send before the connection closes. If
  `restart` is `true`, reconnect afterward.

  You receive this message; you don't send it.
  """)
@channel("signalwire.disconnect")
@summary("Service is about to disconnect the client")
op disconnect(...DisconnectRequest): DisconnectReply;

import "@signalwire/typespec-asyncapi";
import "../../../common/frames.tsp";
import "@typespec/openapi";

import "./models/send.tsp";
import "./models/reply.tsp";

using SignalWire.AsyncAPI;
using TypeSpec.OpenAPI;

namespace Relay.Signalwire;
const GroupSignalwireDisconnect = #["signalwire", "disconnect"];

const signalwireDisconnect = "signalwire.disconnect";
const signalwireDisconnectResponse = "${signalwireDisconnect} response";

model DisconnectRequest is JsonRpcRequest<typeof signalwireDisconnect, DisconnectParams>;

@extension("x-fern-display-name", signalwireDisconnectResponse)
@reply model DisconnectReply is JsonRpcResponse<DisconnectResult>;

@doc("""
  A heads-up that SignalWire is about to close your connection — for example
  during a deployment — so you can flush anything pending. Reply to acknowledge;
  that reply should be the last thing you send before the connection closes. If
  `restart` is `true`, reconnect afterward.

  You receive this message; you don't send it.
  """)
@channel(signalwireDisconnect)
@summary("Service is about to disconnect the client")
@extension("x-fern-display-name", signalwireDisconnect)
@extension("x-fern-sdk-group-name", GroupSignalwireDisconnect)
op disconnect(...DisconnectRequest): DisconnectReply;

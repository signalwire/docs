import "@signalwire/typespec-asyncapi";
import "../../../common/frames.tsp";
import "@typespec/openapi";

import "./models/send.tsp";
import "./models/reply.tsp";
import "./models/events.tsp";

using SignalWire.AsyncAPI;
using TypeSpec.OpenAPI;

namespace Relay.Calling;

const callingConnect = "calling.connect";
const callingConnectResponse = "${callingConnect} response";

model ConnectRequest is JsonRpcRequest<typeof callingConnect, ConnectParams>;

@extension("x-fern-display-name", callingConnectResponse)
@reply model ConnectReply is JsonRpcResponse<ConnectResult>;

@doc("""
  Calls a new device and bridges it to this already-active call, joining both
  legs together. Use this to add a party to a live call, such as forwarding or
  transferring a caller. Only one connect can run at a time on a given call — if
  another operation is still in progress, the request fails with a conflict error
  telling you to wait for it to finish. Connection progress arrives through
  `calling.call.connect` events.
  """)
@channel(callingConnect)
@summary("Connect a device to an active call")
@extension("x-fern-display-name", callingConnect)
@extension("x-fern-sdk-group-name", GroupControlConnect)
op connect(...ConnectRequest): ConnectReply | CallConnectEvent;

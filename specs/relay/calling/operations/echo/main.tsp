import "@signalwire/typespec-asyncapi";

import "./models/requests.tsp";
import "./models/responses.tsp";
import "../../events/echo.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model EchoRequest is JsonRpcRequest<"calling.echo", EchoParams>;
@reply model EchoReply is JsonRpcResponse<EchoResult>;

@doc("""
  Echoes the caller's audio back to them — whatever they say is played straight
  back. Handy for testing that audio is flowing in both directions on a call.
  Echo stops on its own when the `timeout` expires or the call ends.
  """)
@channel("calling.echo")
@summary("Echo audio back to the caller")
op echo(...EchoRequest): EchoReply | CallEchoEvent;

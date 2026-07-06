import "@signalwire/typespec-asyncapi";
import "../../../common/frames.tsp";
import "@typespec/openapi";

import "./models/send.tsp";
import "./models/reply.tsp";
import "./models/events.tsp";

using SignalWire.AsyncAPI;
using TypeSpec.OpenAPI;

namespace Relay.Calling;

const callingEcho = "calling.echo";
const callingEchoResponse = "${callingEcho} response";

model EchoRequest is JsonRpcRequest<typeof callingEcho, EchoParams>;

@extension("x-fern-display-name", callingEchoResponse)
@reply model EchoReply is JsonRpcResponse<EchoResult>;

@doc("""
  Echoes the caller's audio back to them — whatever they say is played straight
  back. Handy for testing that audio is flowing in both directions on a call.
  Echo stops on its own when the `timeout` expires or the call ends.
  """)
@channel(callingEcho)
@summary("Echo audio back to the caller")
@extension("x-fern-display-name", callingEcho)
@extension("x-fern-sdk-group-name", GroupAudioEcho)
op echo(...EchoRequest): EchoReply | CallEchoEvent;

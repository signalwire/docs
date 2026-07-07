import "@signalwire/typespec-asyncapi";
import "../../../common/frames.tsp";
import "@typespec/openapi";

import "./models/send.tsp";
import "./models/reply.tsp";
import "./models/events.tsp";

using SignalWire.AsyncAPI;
using TypeSpec.OpenAPI;

namespace Relay.Calling;

const callingStream = "calling.stream";
const callingStreamResponse = "${callingStream} response";

model StreamRequest is JsonRpcRequest<typeof callingStream, StreamParams>;
@extension("x-fern-display-name", callingStreamResponse)
@reply model StreamReply is JsonRpcResponse<StreamResult>;

@doc("""
  Stream the call's audio in real time to a `wss://` WebSocket endpoint while
  the call continues normally. Pick which track to send with `track`, and
  optionally pass an `authorization_bearer_token` and `custom_parameters` that
  are sent to your endpoint when the connection opens. Stream lifecycle events
  arrive as `calling.call.stream` events keyed on your `control_id`.
  """)
@channel(callingStream)
@summary("Stream call audio to a WebSocket endpoint")
@extension("x-fern-display-name", callingStream)
op stream(...StreamRequest): StreamReply | CallStreamEvent;

const callingStreamStop = "calling.stream.stop";
const callingStreamStopResponse = "${callingStreamStop} response";

model StreamStopRequest is JsonRpcRequest<typeof callingStreamStop, StreamStopParams>;
@extension("x-fern-display-name", callingStreamStopResponse)
@reply model StreamStopReply is JsonRpcResponse<StreamStopResult>;

@doc("Stop an active call stream.")
@channel(callingStreamStop)
@summary("Stop a call stream")
@extension("x-fern-display-name", callingStreamStop)
op streamStop(...StreamStopRequest): StreamStopReply;

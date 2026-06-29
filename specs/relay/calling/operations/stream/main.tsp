import "@signalwire/typespec-asyncapi";

import "./models/requests.tsp";
import "./models/responses.tsp";
import "../../events/stream.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model StreamRequest is JsonRpcRequest<"calling.stream", StreamParams>;
@reply model StreamReply is JsonRpcResponse<StreamResult>;

@doc("""
  Stream the call's audio in real time to a `wss://` WebSocket endpoint while
  the call continues normally. Pick which track to send with `track`, and
  optionally pass an `authorization_bearer_token` and `custom_parameters` that
  are sent to your endpoint when the connection opens. Stream lifecycle events
  arrive as `calling.call.stream` events keyed on your `control_id`. Note this
  result echoes `node_id` rather than `call_id`.
  """)
@channel("calling.stream")
@summary("Stream call audio to a WebSocket endpoint")
op stream(...StreamRequest): StreamReply | CallStreamEvent;

model StreamStopRequest is JsonRpcRequest<"calling.stream.stop", StreamStopParams>;
@reply model StreamStopReply is JsonRpcResponse<StreamStopResult>;

@doc("Stop an active call stream.")
@channel("calling.stream.stop")
@summary("Stop a call stream")
op streamStop(...StreamStopRequest): StreamStopReply;

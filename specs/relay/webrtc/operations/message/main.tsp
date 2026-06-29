import "@signalwire/typespec-asyncapi";

import "./models/requests.tsp";
import "./models/responses.tsp";
import "../../events/message.tsp";

using SignalWire.AsyncAPI;

namespace Relay.WebRTC;

model VertoRequest is JsonRpcRequest<"webrtc.verto", MessageParams>;
@reply model VertoReply is JsonRpcResponse<MessageResult>;

@doc("""
  Send a Verto frame to SignalWire over the Relay connection — this is how you
  place, answer, modify, or end a peer call from the browser. Pass the frame in
  `message` and the call's `callID`; optionally subscribe to conference/room
  event channels in the same request.

  The reply carries the Verto outcome in `result` (for example the answer to a
  `verto.invite`), along with the `node_id` now hosting the call. Capture that
  `node_id` and send it on later frames for the same call.
  """)
@channel("webrtc.verto")
@summary("Send a Verto frame")
op verto(...VertoRequest): VertoReply | MessageEvent;

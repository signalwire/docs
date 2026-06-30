import "@signalwire/typespec-asyncapi";
import "../../../common/frames.tsp";
import "@typespec/openapi";

import "./models/requests.tsp";
import "./models/responses.tsp";
import "../../events/message.tsp";

using SignalWire.AsyncAPI;
using TypeSpec.OpenAPI;

namespace Relay.WebRTC;

const webrtcVerto = "webrtc.verto";
const webrtcVertoResponse = "${webrtcVerto} response";

model VertoRequest is JsonRpcRequest<typeof webrtcVerto, MessageParams>;

@extension("x-fern-display-name", webrtcVertoResponse)
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
@channel(webrtcVerto)
@summary("Send a Verto frame")
@extension("x-fern-display-name", webrtcVerto)
op verto(...VertoRequest): VertoReply | MessageEvent;

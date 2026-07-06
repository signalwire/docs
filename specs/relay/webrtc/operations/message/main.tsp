import "@signalwire/typespec-asyncapi";
import "../../../common/frames.tsp";
import "@typespec/openapi";

import "./models/send.tsp";
import "./models/reply.tsp";
import "./models/events.tsp";

using SignalWire.AsyncAPI;
using TypeSpec.OpenAPI;

namespace Relay.WebRTC;
const GroupWebrtcVerto = #["webrtc", "verto"];

const webrtcVerto = "webrtc.verto";
const webrtcVertoResponse = "${webrtcVerto} response";

model VertoRequest is JsonRpcRequest<typeof webrtcVerto, MessageParams>;

@extension("x-fern-display-name", webrtcVertoResponse)
@reply model VertoReply is JsonRpcResponse<MessageResult>;

@doc("""
  Send a Verto frame to SignalWire over the Relay connection — this is how you
  place, answer, modify, or end a peer call from the browser. Pass the frame in
  `message`; the call's `callID` lives inside that frame, at
  `dialogParams.callID`, not at the top level. Optionally subscribe to
  conference/room event channels in the same request.

  The reply carries the Verto outcome in `result` (for example the answer to a
  `verto.invite`), along with the `node_id` now hosting the call. Capture that
  `node_id` and send it on later frames for the same call.
  """)
@channel(webrtcVerto)
@summary("Send a Verto frame")
@extension("x-fern-display-name", webrtcVerto)
@extension("x-fern-sdk-group-name", GroupWebrtcVerto)
op verto(...VertoRequest): VertoReply | MessageEvent;

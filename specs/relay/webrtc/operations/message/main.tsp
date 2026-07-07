import "@signalwire/typespec-asyncapi";
import "../../../common/frames.tsp";
import "@typespec/openapi";

import "./models/send.tsp";
import "./models/reply.tsp";
import "./models/events.tsp";

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
  `message`; the call's `callID` lives inside that frame, at
  `dialogParams.callID`, not at the top level. Optionally subscribe to
  conference/room event channels in the same request.

  The reply carries the Verto outcome in `result` (for example the answer to a
  `verto.invite`), along with the `node_id` now hosting the call. Capture that
  `node_id` and send it on later frames for the same call. Asynchronous and
  server-initiated Verto frames (an incoming call, the far end hanging up, media
  updates) arrive separately on the receive-only `webrtc.message` channel.

  Authentication: this channel is available only to sessions authenticated with a
  SignalWire Access Token (SAT); other session types are rejected.
  """)
@channel(webrtcVerto)
@summary("Send a Verto frame")
@extension("x-fern-display-name", webrtcVerto)
op verto(...VertoRequest): VertoReply;

@doc("""
  Receive-only. Delivers inbound Verto frames from SignalWire on your connection.
  These include asynchronous responses to your `webrtc.verto` frames, but also
  frames SignalWire initiates on its own — an incoming `verto.invite`, a
  `verto.bye` when the far end hangs up, `verto.media`/`verto.display` updates, and
  conference/room events on channels you subscribed to — so they arrive without you
  sending anything. The frame is passed through in `params` as-is; see SignalWire's
  Verto message reference for the full set of Verto methods.
  """)
@channel(webrtcMessage)
@summary("Receive inbound Verto frames")
@extension("x-fern-display-name", webrtcMessage)
op receiveMessage(): MessageEvent;

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

model VertoRequest is JsonRpcRequest<typeof webrtcVerto, VertoParams>;

@extension("x-fern-display-name", webrtcVertoResponse)
@reply model VertoReply is JsonRpcResponse<VertoResult>;

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
  updates) arrive separately as `webrtc.message` events.

  Authentication: this channel is available only to connections authenticated with
  a Subscriber Access Token (SAT). Any other credential — a project + API token, or
  another kind of JWT — is rejected with a JSON-RPC `error` (`-32003`). Server-side
  code should use the `calling` service instead.

  Other requests rejected with a JSON-RPC `error` before the frame is sent:
  - `-32003` — a screen-share or additional-device invite sent before the main
    participant invite, a frame other than `verto.bye` or `verto.subscribe` sent
    before any invite, or a `verto.answer` without a `node_id`.
  - `-32603` — the service could not resolve where to route the frame.
  """)
@channel(webrtcVerto)
@summary("Send a Verto frame")
@extension("x-fern-display-name", webrtcVerto)
op verto(...VertoRequest): VertoReply;

model WebRTCMessageRequest is JsonRpcRequest<typeof webrtcMessage, WebRTCMessageParams>;

@extension("x-fern-display-name", webrtcMessageResponse)
@reply model WebRTCMessageReply is JsonRpcResponse<WebRTCMessageResult>;

@doc("""
  Delivers inbound Verto frames from SignalWire on your connection, and — for
  connections authenticated with a Relay JWT rather than a Subscriber Access Token —
  lets you send Verto frames with a `webrtc.message` request.

  **Sending.** Pass the Verto frame in `message`. A `verto.invite` needs no
  `node_id`; every other frame must carry the `node_id` returned for the call,
  otherwise the reply has `code` `"400"`. Your credentials must carry the `webrtc`
  scope and a resource; otherwise the request is rejected with a JSON-RPC `error`
  (`-32003`). Subscriber Access Token connections use `webrtc.verto` instead.

  **Receiving.** These include asynchronous responses to your Verto frames, but also
  frames SignalWire initiates on its own — an incoming `verto.invite`, a
  `verto.bye` when the far end hangs up, `verto.media`/`verto.display` updates, and
  conference/room events on channels you subscribed to — so they arrive without you
  sending anything. The Verto frame arrives at `params.params`, passed through
  as-is (the surrounding `params` object is the event envelope: `node_id`,
  `event_channel`, timestamps). Each frame is a Verto-protocol signaling message
  whose contents depend on the Verto method it carries.
  """)
@channel(webrtcMessage)
@summary("Send and receive Verto frames")
@extension("x-fern-display-name", webrtcMessage)
op message(...WebRTCMessageRequest): WebRTCMessageReply | MessageEvent;

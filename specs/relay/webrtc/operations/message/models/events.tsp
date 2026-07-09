import "@signalwire/typespec-asyncapi";
import "../../../../common/frames.tsp";
import "@typespec/openapi";

using TypeSpec.OpenAPI;

namespace Relay.WebRTC;

const webrtcMessage = "webrtc.message";
@doc("""
  Delivers a Verto frame from SignalWire to your client. This fires when SignalWire
  has a Verto response to one of your `webrtc.verto` frames, but also when
  SignalWire initiates signaling on its own — an incoming `verto.invite`, a
  `verto.bye` when the far end hangs up, `verto.media`/`verto.display` updates, or a
  conference/room event on a channel you subscribed to — so it can arrive without
  you sending anything.

  The Verto frame arrives at `params.params`, passed through as-is (the surrounding
  `params` object is the event envelope: `node_id`, `event_channel`, timestamps).
  Each frame is a Verto-protocol signaling message whose contents depend on the
  Verto method it carries.
  """)
@summary("Inbound Verto frame")
@extension("x-fern-display-name", webrtcMessage)
model MessageEvent is WebRTCEvent<typeof webrtcMessage, Record<unknown>>;

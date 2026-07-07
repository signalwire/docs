import "@signalwire/typespec-asyncapi";
import "../../../../common/frames.tsp";
import "@typespec/openapi";

using TypeSpec.OpenAPI;

namespace Relay.WebRTC;

const webrtcMessage = "webrtc.message";
@doc("""
  Delivers a Verto frame (the WebRTC signaling message format used for peer calls)
  from SignalWire to your client. This fires when SignalWire has a Verto response to
  one of your `webrtc.verto` frames, but also when SignalWire initiates signaling on
  its own — an incoming `verto.invite`, a `verto.bye` when the far end hangs up,
  `verto.media`/`verto.display` updates, or a conference/room event on a channel you
  subscribed to — so it can arrive without you sending anything.

  The frame in `params` is passed through as-is; see SignalWire's Verto message
  reference for the full set of Verto methods and their `params`.
  """)
@summary(webrtcMessage)
@extension("x-fern-display-name", webrtcMessage)
model MessageEvent is WebRTCEvent<typeof webrtcMessage, Record<unknown>>;

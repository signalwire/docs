import "@signalwire/typespec-asyncapi";
import "../../common/frames.tsp";
import "@typespec/openapi";

using TypeSpec.OpenAPI;

namespace Relay.WebRTC;

model MessageEventData {
  @doc("""
    The node that sent this event. Capture it once your call starts and reuse
    it as the `node_id` on your subsequent `message` requests so they reach the
    same node.
    """)
  node_id: string;

  @doc("""
    The Verto frame being delivered — either a Verto response or a
    conference/room event. Passed through as-is; see `verto_messages.md`.
    """)
  params: Record<unknown>;
}

const webrtcMessage = "webrtc.message";
@doc("""
  Delivers a Verto frame from SignalWire back to your client. This fires when
  SignalWire has a Verto response to one of your `message` requests, or when a
  conference/room event arrives on a channel you subscribed to. Read the frame
  in `params` to learn the outcome.

  The frame in `params` is passed through as-is; see `verto_messages.md` for
  the full set of Verto methods and their `params`.
  """)
@summary(webrtcMessage)
@extension("x-fern-display-name", webrtcMessage)
model MessageEvent is SignalwireEvent<typeof webrtcMessage, MessageEventData>;

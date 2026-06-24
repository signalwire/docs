import "@signalwire/typespec-asyncapi";

using SignalWire.AsyncAPI;

namespace Relay.WebRTC;

/**
 * Delivers a Verto frame from SignalWire back to your client. This fires when
 * SignalWire has a Verto response to one of your `message` requests, or when a
 * conference/room event arrives on a channel you subscribed to. Read the frame
 * in `params` to learn the outcome.
 *
 * The frame in `params` is passed through as-is; see `verto_messages.md` for
 * the full set of Verto methods and their `params`.
 */
@event("webrtc.message")
@example(#{
  node_id: "f1d2c3b4-a596-4877-8b1e-0123456789ab",
  params: #{
    jsonrpc: "2.0",
    id: "12345",
    method: "verto.media",
    params: #{
      callID: "7c6d5e4f-3a2b-4c1d-0fed-cba987654321",
      sdp: "v=0...",
    },
  },
})
model MessageEvent {
  /**
   * The node that sent this event. Capture it once your call starts and reuse
   * it as the `node_id` on your subsequent `message` requests so they reach the
   * same node.
   */
  node_id?: string;

  /**
   * The Verto frame being delivered — either a Verto response or a
   * conference/room event. Passed through as-is; see `verto_messages.md`.
   */
  params: Record<unknown>;
}

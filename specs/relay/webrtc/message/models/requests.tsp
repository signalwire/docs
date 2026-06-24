import "@signalwire/typespec-asyncapi";

using SignalWire.AsyncAPI;

namespace Relay.WebRTC;

model MessageParams {
  /**
   * The node hosting your call. Once a call exists, set this to the `node_id`
   * you received in an earlier event or response so the frame reaches the right
   * place. Leave it absent on your first message, before a call has been
   * established — SignalWire picks the node.
   */
  node_id?: string;

  /**
   * The Verto frame to send (for example a `verto.invite` carrying
   * `dialogParams`/`sdp`/`layout`/`positions`). The frame is passed through
   * as-is; see `verto_messages.md` for the full list of Verto methods and their
   * `params`.
   */
  message: Record<unknown>;

  /**
   * Event channels to subscribe to alongside this request — useful when you
   * join a conference and want its event feed. Values are conference/room event
   * channels such as `member.joined`, `member.left`, `room.ended`,
   * `room.updated`, `layout.changed`, and `member.updated` (illustrative, not
   * exhaustive).
   */
  subscribe?: string[];
}

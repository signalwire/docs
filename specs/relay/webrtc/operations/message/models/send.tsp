import "@signalwire/typespec-asyncapi";

using SignalWire.AsyncAPI;

namespace Relay.WebRTC;

@summary("Verto request parameters")
model MessageParams {
  @doc("""
    Opaque identifier that scopes this call. Once a call exists, set this to the
    `node_id` you received in an earlier event or response so the frame reaches
    the right place. Leave it absent on your first message, before a call has been
    established — SignalWire assigns one for you.
    """)
  @example("a3f1c2d4-5e6f-7a8b-9c0d-1e2f3a4b5c6d")
  node_id?: string;

  @doc("""
    The Verto frame (the WebRTC signaling message format used for peer calls) to
    send — for example a `verto.invite` carrying
    `dialogParams`/`sdp`/`layout`/`positions`. The frame is passed through
    as-is; see SignalWire's Verto message reference for the full list of Verto
    methods and their `params`. The Verto call ID belongs inside this frame, at
    `dialogParams.callID` — generate one when you create a call and reuse it on
    every frame for that call. There is no top-level `callID`.
    """)
  message: Record<unknown>;

  @doc("""
    Event channels to subscribe to alongside this request — useful when you
    join a conference and want its event feed. Values are conference/room event
    channels such as `member.joined`, `member.left`, `room.ended`,
    `room.updated`, `layout.changed`, and `member.updated` (illustrative, not
    exhaustive).
    """)
  @example(#["member.joined", "member.left", "room.ended"])
  subscribe?: string[];
}

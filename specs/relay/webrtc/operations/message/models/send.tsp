import "@signalwire/typespec-asyncapi";

using SignalWire.AsyncAPI;

namespace Relay.WebRTC;

@doc("The parameters for a `webrtc.verto` request: the Verto frame to send, the `node_id` that scopes it to your call, and any event channels to subscribe to.")
@summary("Verto request parameters")
model VertoParams {
  @doc("""
    The node currently hosting your call. Once a call exists, set this to the
    `node_id` you received in an earlier event or response so the frame reaches
    the right node. Leave it absent on your first message, before a call has been
    established — SignalWire assigns one for you.
    """)
  @example("a3f1c2d4-5e6f-7a8b-9c0d-1e2f3a4b5c6d")
  node_id?: string;

  @doc("""
    The Verto frame (the WebRTC signaling message format used for peer calls) to
    send — a JSON-RPC 2.0 object `{ jsonrpc, id, method, params }`. For a
    `verto.invite`, `params` carries your `sdp` (the Session Description Protocol
    offer) and a `dialogParams` object; `layout` and `positions` apply only when
    inviting into a conference. Each frame is a Verto-protocol signaling message
    whose `params` depend on the Verto method it carries, and SignalWire passes it
    through as-is. The Verto call ID belongs inside this frame, at
    `dialogParams.callID` — generate one when you create a call and reuse it on
    every frame for that call. There is no top-level `callID`.
    """)
  @example(#{
    jsonrpc: "2.0",
    id: "6c413717-7595-4c86-9586-506bcc3abd7a",
    method: "verto.invite",
    params: #{
      sdp: "v=0\r\no=- 4363463200085990471 2 IN IP4 127.0.0.1\r\ns=-\r\nt=0 0\r\n... (your WebRTC SDP offer) ...",
      dialogParams: #{
        callID: "2689709c-5c02-4db3-9df9-81cdd9005209",
        destination_number: "1003",
        caller_id_name: "SW JS client",
        caller_id_number: "user@example.com",
        audio: true,
        video: true,
      },
    },
  })
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

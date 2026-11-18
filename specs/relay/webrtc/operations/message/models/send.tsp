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
    The room events to receive, by event type. Read only when this frame is a
    participant `verto.invite` that joins a Video Room: from then on, that room's
    events reach this connection only if their type is in this list, except
    `room.subscribed`, which always arrives. A screen-share or additional-device
    invite reuses the list from the participant invite. Calls to any other kind of
    address deliver their call, member, and room events without this list, so you
    can omit it.
    """)
  @example(#["member.joined", "member.left", "room.ended"])
  subscribe?: string[];
}

@doc("The parameters for a `webrtc.message` request: the Verto frame to send and the `node_id` hosting the call.")
@summary("WebRTC message request parameters")
model WebRTCMessageParams {
  @doc("""
    The Verto frame to send — a JSON-RPC 2.0 object `{ jsonrpc, id, method, params }`,
    passed through as-is. See `webrtc.verto` for the frame format.
    """)
  @example(#{
    jsonrpc: "2.0",
    id: "6c413717-7595-4c86-9586-506bcc3abd7a",
    method: "verto.bye",
    params: #{ dialogParams: #{ callID: "2689709c-5c02-4db3-9df9-81cdd9005209" } },
  })
  message: Record<unknown>;

  @doc("""
    The node hosting the call. Omit it on a `verto.invite`; required on every other
    frame — use the `node_id` from the invite's reply or a later event.
    """)
  @example("a3f1c2d4-5e6f-7a8b-9c0d-1e2f3a4b5c6d")
  node_id?: string;
}

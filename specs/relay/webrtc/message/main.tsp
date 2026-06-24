import "@signalwire/typespec-asyncapi";

import "./models/requests.tsp";
import "./models/responses.tsp";

using SignalWire.AsyncAPI;

namespace Relay.WebRTC;

@doc("""
  Send a Verto frame from your client to SignalWire — this is how you place,
  answer, modify, or end a peer call. Pass the frame in `message`, and
  optionally subscribe to conference/room event channels in the same request.

  The result only confirms that SignalWire received and forwarded the frame
  (`"Received"`). The actual Verto outcome arrives later as a `webrtc.message`
  event, so wait for that event rather than treating this acknowledgement as
  the call result.
  """)
@channel("message")
@summary("Send a Verto frame")
@opExample(#{
  parameters: #{
    node_id: "f1d2c3b4-a596-4877-8b1e-0123456789ab",
    message: #{
      jsonrpc: "2.0",
      id: "12345",
      method: "verto.invite",
      params: #{
        dialogParams: #{},
        sdp: "v=0...",
        layout: "screenshare",
        restore_layout: true,
        positions: #{ self: "reserved-1", `12345678`: "standard" },
      },
    },
    subscribe: #[
      "member.joined",
      "member.left",
      "room.ended",
      "room.updated",
      "layout.changed",
      "member.updated",
    ],
  },
  returnType: #{ code: "200", message: "Received" },
})
op message(...MessageParams): MessageResult;

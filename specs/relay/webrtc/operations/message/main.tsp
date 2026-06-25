import "@signalwire/typespec-asyncapi";

import "./models/requests.tsp";
import "./models/responses.tsp";

using SignalWire.AsyncAPI;

namespace Relay.WebRTC;

@doc("""
  Send a Verto frame to SignalWire over the Relay connection — this is how you
  place, answer, modify, or end a peer call from the browser. Pass the frame in
  `message` and the call's `callID`; optionally subscribe to conference/room
  event channels in the same request.

  The reply carries the Verto outcome in `result` (for example the answer to a
  `verto.invite`), along with the `node_id` now hosting the call. Capture that
  `node_id` and send it on later frames for the same call.
  """)
@channel("webrtc.verto")
@summary("Send a Verto frame")
@opExample(#{
  parameters: #{
    callID: "c7f9d2e1-3a4b-5c6d-7e8f-9a0b1c2d3e4f",
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
  returnType: #{
    code: "200",
    node_id: "f1d2c3b4-a596-4877-8b1e-0123456789ab",
    result: #{ message: "CALL CREATED", callID: "c7f9d2e1-3a4b-5c6d-7e8f-9a0b1c2d3e4f" },
  },
})
op verto(...MessageParams): MessageResult;

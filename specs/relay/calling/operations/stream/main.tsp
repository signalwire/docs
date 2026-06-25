import "@signalwire/typespec-asyncapi";

import "./models/requests.tsp";
import "./models/responses.tsp";
import "../../events/stream.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@doc("""
  Stream the call's audio in real time to a `wss://` WebSocket endpoint while
  the call continues normally. Pick which track to send with `track`, and
  optionally pass an `authorization_bearer_token` and `custom_parameters` that
  are sent to your endpoint when the connection opens. Stream lifecycle events
  arrive as `calling.call.stream` events keyed on your `control_id`. Note this
  result echoes `node_id` rather than `call_id`.
  """)
@channel("calling.stream")
@summary("Stream call audio to a WebSocket endpoint")
@opExample(#{
  parameters: #{
    node_id: "a3b3e8e0-1234-4a4b-8c8d-000000000001",
    call_id: "b4c4f9f1-2345-4b5c-9d9e-000000000002",
    control_id: "stream-1",
    url: "wss://example.com/audio",
    name: "my_stream",
    codec: "PCMU",
    track: "inbound_track",
    status_url: "https://example.com/status",
    authorization_bearer_token: "my-token",
    custom_parameters: #{ user_id: "12345" },
  },
  returnType: #{
    code: "200",
    message: "Starting stream",
    control_id: "stream-1",
    node_id: "a3b3e8e0-1234-4a4b-8c8d-000000000001",
  },
})
op stream(...StreamParams): StreamResult | CallStreamEvent;

@doc("Stop an active call stream.")
@channel("calling.stream.stop")
@summary("Stop a call stream")
@opExample(#{
  parameters: #{
    node_id: "a3b3e8e0-1234-4a4b-8c8d-000000000001",
    call_id: "b4c4f9f1-2345-4b5c-9d9e-000000000002",
    control_id: "stream-1",
  },
  returnType: #{
    code: "200",
    message: "Stopping stream",
    control_id: "stream-1",
    call_id: "b4c4f9f1-2345-4b5c-9d9e-000000000002",
  },
})
op streamStop(...StreamStopParams): StreamStopResult;

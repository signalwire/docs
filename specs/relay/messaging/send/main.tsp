import "@signalwire/typespec-asyncapi";

import "./models/requests.tsp";
import "./models/responses.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Messaging;

/**
 * Send an SMS or MMS to a phone number. Include `body`, `media`, or both. A
 * successful response means SignalWire accepted the message and returns its
 * `message_id` — it does not mean the message was delivered yet. Watch for
 * `messaging.state` events on the same `context` to follow delivery.
 */
@channel("messaging.send")
@summary("Send an outbound message")
@opExample(#{
  parameters: #{
    context: "my_context",
    tags: #["Custom", "client", "data"],
    region: "us",
    to_number: "+15553214321",
    from_number: "+15551231234",
    body: "Message Body",
    media: #["https://example.com/cat.jpg"],
  },
  returnType: #{
    code: "200",
    message: "Message accepted",
    message_id: "b1c2d3e4-5f6a-7b8c-9d0e-1f2a3b4c5d6e",
  },
})
op send(...SendParams): SendResult;

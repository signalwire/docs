import "@signalwire/typespec-asyncapi";

import "./models/requests.tsp";
import "./models/responses.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@doc("(async-safe) Send (inject) a message into an active AI agent session.")
@channel("calling.ai_message")
@summary("Send a message to an active AI agent session")
@opExample(#{
  parameters: #{
    node_id: "a3e1b2c4-...",
    call_id: "c7f9d2e1-...",
    message_text: "The user's order has been confirmed.",
    role: "system",
  },
  returnType: #{ code: "200", message: "Message sent" },
})
op aiMessage(...AiMessageParams): AiMessageResult;

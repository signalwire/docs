import "@signalwire/typespec-asyncapi";

import "./models/requests.tsp";
import "./models/responses.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

/** Put an AI agent session on hold. */
@channel("calling.ai_hold")
@summary("Put an AI agent session on hold")
@opExample(#{
  parameters: #{
    node_id: "a3e1b2c4-...",
    call_id: "c7f9d2e1-...",
    timeout: "60",
    prompt: "Please hold while we transfer you.",
  },
  returnType: #{ code: "200", message: "AI on hold" },
})
op aiHold(...AiHoldParams): AiHoldResult;

/** Resume an AI agent session from hold. */
@channel("calling.ai_unhold")
@summary("Resume an AI agent session from hold")
@opExample(#{
  parameters: #{
    node_id: "a3e1b2c4-...",
    call_id: "c7f9d2e1-...",
    prompt: "Thank you for holding.",
  },
  returnType: #{ code: "200", message: "AI resumed" },
})
op aiUnhold(...AiUnholdParams): AiUnholdResult;

import "@signalwire/typespec-asyncapi";

import "./models/requests.tsp";
import "./models/responses.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@doc("""
  Start an AI agent on the call. Blocking — acquires a block (preventing other
  blocking operations like `connect` or `play_and_collect`) and runs the AI
  session; the block is released when the session ends. Events continue to flow
  while the session is active.
  """)
@channel("calling.ai")
@summary("Start an AI agent on the call")
@opExample(#{
  parameters: #{
    node_id: "a3e1b2c4-...",
    call_id: "c7f9d2e1-...",
    control_id: "ai-session-1",
    prompt: #{
      text: "You are a helpful assistant. Greet the user and ask how you can help.",
      temperature: 0.3,
    },
    SWAIG: #{
      functions: #[
        #{
          function: "get_weather",
          description: "Get current weather for a location",
          web_hook_url: "https://example.com/swaig",
        }
      ],
    },
    params: #{ end_of_speech_timeout: 3000, attention_timeout: 30000 },
  },
  returnType: #{
    code: "200",
    message: "AI started",
    call_id: "c7f9d2e1-...",
    control_id: "ai-session-1",
  },
})
op ai(...AiParams): AiResult;

@doc("(async-safe) Stop an active AI agent session on the call.")
@channel("calling.ai.stop")
@summary("Stop an active AI agent session")
@opExample(#{
  parameters: #{
    node_id: "a3e1b2c4-...",
    call_id: "c7f9d2e1-...",
    control_id: "ai-session-1",
  },
  returnType: #{
    code: "200",
    message: "+OK stopped",
    call_id: "c7f9d2e1-...",
    control_id: "ai-session-1",
  },
})
op aiStop(...AiStopParams): AiStopResult;

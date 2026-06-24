import "@signalwire/typespec-asyncapi";

import "./models/requests.tsp";
import "./models/responses.tsp";
import "../events/ai-sidecar.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@doc("""
  Attach a real-time AI observer (sidecar) to an answered call, or — when
  `action.summarize` is present — generate a one-off conversation summary instead
  of attaching a sidecar. Requires an active `live_transcribe`.
  """)
@channel("calling.ai_sidecar")
@summary("Attach a real-time AI observer (sidecar) to the call")
@opExample(#{
  parameters: #{
    node_id: "a3e1b2c4-...",
    call_id: "c7f9d2e1-...",
    lang: "en-US",
    prompt: #{
      text: "You coach the agent in real time. Suggest concise next steps and flag risks.",
    },
    hints: #["ACME", "Globex"],
  },
  returnType: #{
    code: "200",
    message: "Sidecar attached",
    call_id: "c7f9d2e1-...",
  },
})
op aiSidecar(...AiSidecarParams): AiSidecarResult | AiSidecarEvent;

@doc("""
  (async-safe) Send a message to the sidecar and prompt it to respond right away,
  without waiting for the next customer turn.
  """)
@channel("calling.ai_sidecar.poke")
@summary("Poke the sidecar to respond immediately")
@opExample(#{
  parameters: #{
    node_id: "a3e1b2c4-...",
    call_id: "c7f9d2e1-...",
    text: "The customer just mentioned a competitor — suggest a comparison.",
  },
  returnType: #{ code: "200", message: "+OK", call_id: "c7f9d2e1-..." },
})
op aiSidecarPoke(...AiSidecarPokeParams): AiSidecarResult;

@doc("""
  (async-safe) Ask the sidecar a one-off question without affecting the live
  conversation. Returns an `ask_id` immediately; the answer is delivered later as a
  `calling.ai.sidecar` event (`type: ask_answer`) with the matching `ask_id`.
  """)
@channel("calling.ai_sidecar.ask")
@summary("Ask the sidecar a one-off question")
@opExample(#{
  parameters: #{
    node_id: "a3e1b2c4-...",
    call_id: "c7f9d2e1-...",
    text: "What objections has the customer raised so far?",
  },
  returnType: #{
    code: "200",
    message: "+OK",
    call_id: "c7f9d2e1-...",
    ask_id: "ask-9f3c1a",
  },
})
op aiSidecarAsk(...AiSidecarAskParams): AiSidecarAskResult;

@doc("(async-safe) Stop and detach the AI sidecar from the call.")
@channel("calling.ai_sidecar.stop")
@summary("Stop and detach the AI sidecar")
@opExample(#{
  parameters: #{ node_id: "a3e1b2c4-...", call_id: "c7f9d2e1-..." },
  returnType: #{ code: "200", message: "+OK stopped", call_id: "c7f9d2e1-..." },
})
op aiSidecarStop(...AiSidecarStopParams): AiSidecarResult;

@doc("(async-safe) Get a snapshot of the sidecar's activity counters.")
@channel("calling.ai_sidecar.status")
@summary("Get a snapshot of the sidecar's activity counters")
@opExample(#{
  parameters: #{ node_id: "a3e1b2c4-...", call_id: "c7f9d2e1-..." },
  returnType: #{
    code: "200",
    message: "+OK running=1 ticks=12 insights=4 skips=8 tools=2 errors=0 in_tokens=5123 out_tokens=842 history_size=18 event_log_bytes=20480",
    call_id: "c7f9d2e1-...",
  },
})
op aiSidecarStatus(...AiSidecarStatusParams): AiSidecarStatusResult;

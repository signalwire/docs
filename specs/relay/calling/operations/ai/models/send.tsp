import "@signalwire/typespec-asyncapi";
import "../../../../../swml/calling";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@summary("AI params")
model AiParams {
  ...CallAddress;

  @doc("""
    Your own identifier for this AI session. It is echoed in the result and on the
    `calling.call.ai` event, so you can match them to this request.
    """)
  @example("d4b2e1a0-7c9f-4a3b-8e2d-1f0a9b8c7d6e")
  control_id: string;

  ...OmitProperties<SWML.Calling.AIObject, "prompt" | "agent">;

  @doc("""
    Defines the AI agent's personality, goals, behaviors, and instructions for
    handling conversations. Required: without a `prompt` no agent runs, even though
    the request still returns `AI started`. Pre-configured agents (`agent`) are not
    supported on this method; an `agent` key is accepted but has no effect.
    """)
  prompt: SWML.Calling.AIPrompt;
}

@summary("AI stop params")
model AiStopParams {
  ...CallAddress;

  @doc("""
    Optional and ignored: the stop applies to whichever AI session is running on the
    call. When sent, it is echoed in the result.
    """)
  @example("d4b2e1a0-7c9f-4a3b-8e2d-1f0a9b8c7d6e")
  control_id?: string;
}

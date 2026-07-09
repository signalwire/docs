import "@signalwire/typespec-asyncapi";
import "@signalwire/typespec-emit-filter";
import "../../../../../swml/calling";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;
using SignalWire.EmitFilter;

namespace Relay.Calling;

@@excludeFromEmit(SWMLVar);

@summary("AI params")
model AiParams {
  ...CallAddress;

  @doc("""
    Your own identifier for this AI session. Reuse it later to control the
    session — for example, pass it to `calling.ai.stop` to end the agent.
    """)
  @example("d4b2e1a0-7c9f-4a3b-8e2d-1f0a9b8c7d6e")
  control_id: string;

  ...OmitProperties<SWML.Calling.AIObject, "prompt" | "agent">;

  @doc("""
    The UUID of a pre-configured AI agent to run. When set, that agent's saved
    configuration is applied to the session. Optional here: supply at least one
    of `agent` or `prompt`. When you reference an `agent`, its saved prompt is
    used unless you override it with `prompt` here.
    """)
  @format("uuid")
  @example("13ecec00-1210-4de5-97e3-6a4f2f8fa2b0")
  agent?: string;

  @doc("""
    Defines the AI agent's personality, goals, behaviors, and instructions for
    handling conversations. Optional here: supply at least one of `agent` or
    `prompt`. When you reference a pre-configured `agent`, its saved prompt is
    used unless you override it here.
    """)
  prompt?: SWML.Calling.AIPrompt;
}

@summary("AI stop params")
model AiStopParams {
  ...CallAddress;

  @doc("The `control_id` you set when you started the session with `calling.ai`.")
  @example("d4b2e1a0-7c9f-4a3b-8e2d-1f0a9b8c7d6e")
  control_id: string;
}

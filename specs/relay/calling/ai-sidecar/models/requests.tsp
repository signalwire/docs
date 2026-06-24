import "@signalwire/typespec-asyncapi";
import "../../../../swml/calling";

import "../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

// ═════════════════════════════════════════════════════════════════════════════
// calling.ai_sidecar (+ .poke / .ask / .stop / .status)
//
// The AI sidecar attaches a real-time AI observer to a live call: it watches the
// conversation and streams agent-facing advice as `calling.ai.sidecar` events (and,
// when a `url` is set, webhook callbacks). It never speaks on the call. The config is
// reused WHOLESALE from the shared SWML `AISidecarObject` — the same object the SWML
// `ai_sidecar` instruction and the REST `calling.ai_sidecar` command use (one engine
// path through `mod_openai`). At most one sidecar exists per call, so every sidecar
// method addresses it by `call_id` alone (no `control_id`). Requires an active
// `live_transcribe` on the call.
// ═════════════════════════════════════════════════════════════════════════════

model AiSidecarParams {
  ...CallAddress;
  ...SWML.Calling.AISidecarObject;
}

model AiSidecarPokeParams {
  ...CallAddress;

  /** The message to send to the sidecar. */
  text: string;
}

model AiSidecarAskParams {
  ...CallAddress;

  /** The question for the sidecar to answer. */
  text: string;
}

model AiSidecarStopParams {
  ...CallAddress;
}

model AiSidecarStatusParams {
  ...CallAddress;
}

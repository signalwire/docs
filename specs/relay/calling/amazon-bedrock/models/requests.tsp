import "@signalwire/typespec-asyncapi";
import "../../../../swml/calling";

import "../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

// ═════════════════════════════════════════════════════════════════════════════
// calling.amazon_bedrock
//
// Bedrock is a SEPARATE engine path (`mod_openai/bedrock.c`) with its own, smaller config object.
// Reused wholesale from the shared SWML `AmazonBedrockObject`: a narrowed `BedrockParams` (only the
// handful of `params` Bedrock actually reads), `BedrockSWAIG`, `BedrockPostPrompt`, plus
// `global_data`/`post_prompt_url`. `prompt` is a structured `BedrockPrompt` (text|POM + voice_id +
// inference tunables) — the engine parses it as an object, NOT a plain string. No `control_id`,
// `post_prompt_auth_*`, `pronounce`, `hints`, or `languages` on this surface.
model AmazonBedrockParams {
  ...CallAddress;
  ...SWML.Calling.AmazonBedrockObject;
}

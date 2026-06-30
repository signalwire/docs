import "@signalwire/typespec-asyncapi";
import "@signalwire/typespec-emit-filter";
import "../../../../../swml/calling";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;
using SignalWire.EmitFilter;

namespace Relay.Calling;

// ═════════════════════════════════════════════════════════════════════════════
// AI config (calling.ai / calling.amazon_bedrock)
//
// The Relay `calling.ai` surface and the SWML `ai` verb are two front-ends to the SAME
// backend AI-agent config object — FreeSWITCH `mod_openai` parses both through one
// transport-agnostic parser (`create_app_from_json`), reading each field by literal name.
// So the AI config sub-shapes are reused DIRECTLY from the engine-verified SWML models
// (`SWML.Calling.*`) instead of being hand-replicated: prompt, post_prompt, languages,
// pronounce, hints, SWAIG (incl. the full function/parameters/data_map tree), params, and
// global_data. The SWML template-variable `| SWMLVar` arms are markup-only and are stripped
// at emit time via a single `@@excludeFromEmit(SWMLVar)` self-exclusion below (they never
// reach the live JSON-RPC wire). Marking the scalar once removes it everywhere it appears in
// this emit — a `T | SWMLVar` arm collapses to `T`, a bare-`SWMLVar` property disappears — so
// no per-model decorator is needed. The augment lives here (not on the SWML scalar itself) to
// keep the standalone SWML build free of the emit-filter dependency. Relay-specific fields
// (control_id, agent, post_prompt_auth_*) and the Bedrock plain-string prompt stay local.
// See SWML-REUSE-GAPS.md for SWML fields still needing truing.
// ═════════════════════════════════════════════════════════════════════════════

// SWMLVar is a markup-only template-variable placeholder (resolved at SWML execution time,
// never present on the live JSON-RPC wire), so it is excluded from every reused SWML shape in
// this AsyncAPI emit. Honoring is per-emitter — the SWML JSON Schema / OpenAPI builds ignore
// this and still render SWMLVar.
@@excludeFromEmit(SWMLVar);

// The AI-agent config is reused WHOLESALE from the shared SWML `AIObject` — the engine parses
// both the SWML `ai` verb and Relay `calling.ai` through one `create_app_from_json`
// (`mod_openai/app_config.c`), so the field set is one-to-one (prompt, post_prompt[_url],
// post_prompt_auth_*, pronounce, hints, languages, SWAIG, global_data, params). `control_id` is
// the only Relay-specific field: a transport session id (used by `calling.ai.stop`), not part of
// the AI config the engine parses. The internal `agent` UUID is intentionally NOT exposed — there
// is no public way for a customer to obtain one — so an inline `prompt` is the only configuration
// path and is correctly required (inherited from `AIObject`).
model AiParams {
  ...CallAddress;

  @doc("""
    Your own identifier for this AI session. Reuse it later to control the
      session — for example, pass it to `calling.ai.stop` to end the agent.
    """)
  control_id: string;

  ...SWML.Calling.AIObject;
}

model AiStopParams {
  ...CallAddress;

  @doc("The `control_id` assigned in `calling.ai`.")
  control_id: string;
}

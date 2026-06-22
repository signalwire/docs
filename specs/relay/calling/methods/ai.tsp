import "@signalwire/typespec-asyncapi";
import "@signalwire/typespec-emit-filter";
import "../../../swml/calling";
import "../common.tsp";

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

// ═════════════════════════════════════════════════════════════════════════════
// calling.ai
// ═════════════════════════════════════════════════════════════════════════════

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

  /** Identifier used to control (e.g. stop) this AI session. */
  control_id: string;

  ...SWML.Calling.AIObject;
}

model AiResult {
  ...RelayResult;

  /** Echo of the call id. */
  call_id?: string;

  /** Echo of the control id for this AI session. */
  control_id?: string;
}

/**
 * Start an AI agent on the call. Blocking — acquires a block (preventing other
 * blocking operations like `connect` or `play_and_collect`) and runs the AI
 * session; the block is released when the session ends. Events continue to flow
 * while the session is active.
 */
@rpcMethod("calling.ai")
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

// ═════════════════════════════════════════════════════════════════════════════
// calling.ai.stop
// ═════════════════════════════════════════════════════════════════════════════

model AiStopParams {
  ...CallAddress;

  /** The `control_id` assigned in `calling.ai`. */
  control_id: string;
}

model AiStopResult {
  ...RelayResult;

  /** Echo of the call id. */
  call_id?: string;

  /** Echo of the control id. */
  control_id?: string;
}

/** (async-safe) Stop an active AI agent session on the call. */
@rpcMethod("calling.ai.stop")
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

model AmazonBedrockResult {
  ...RelayResult;
}

/** Connect to an Amazon Bedrock AI agent. */
@rpcMethod("calling.amazon_bedrock")
@summary("Connect to an Amazon Bedrock AI agent")
@opExample(#{
  parameters: #{
    node_id: "a3e1b2c4-...",
    call_id: "c7f9d2e1-...",
    prompt: #{ text: "You are a helpful assistant." },
  },
  returnType: #{ code: "200", message: "AI started" },
})
op amazonBedrock(...AmazonBedrockParams): AmazonBedrockResult;

// ═════════════════════════════════════════════════════════════════════════════
// calling.ai_message
// ═════════════════════════════════════════════════════════════════════════════

/** Role of an injected AI-message sender. */
union AiMessageRole {
  "system",
  "user",
  "assistant",
}

/**
 * Conversation-reset configuration. Each field clears or replaces part of the
 * session context.
 */
model AiMessageReset {
  /** Clear the entire conversation history. */
  full_reset?: boolean;

  /** Replace (or clear) the user prompt context. */
  user_prompt?: string;

  /** Replace (or clear) the system prompt context. */
  system_prompt?: string;
}

model AiMessageParams {
  ...CallAddress;

  /** Message text to inject into the session. */
  message_text?: string;

  /** Role of the message sender. */
  role?: AiMessageRole;

  /** Conversation-reset configuration. */
  reset?: AiMessageReset;

  /** Updated global data for SWAIG functions. */
  global_data?: Record<unknown>;
}

model AiMessageResult {
  ...RelayResult;
}

/** (async-safe) Send (inject) a message into an active AI agent session. */
@rpcMethod("calling.ai_message")
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

// ═════════════════════════════════════════════════════════════════════════════
// calling.ai_hold
// ═════════════════════════════════════════════════════════════════════════════

model AiHoldParams {
  ...CallAddress;

  /** Hold timeout. Sent as a string in the example (e.g. `"60"`); unit is seconds. */
  timeout?: string;

  /** Hold prompt / music (plain string). */
  prompt?: string;
}

model AiHoldResult {
  ...RelayResult;
}

/** Put an AI agent session on hold. */
@rpcMethod("calling.ai_hold")
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

// ═════════════════════════════════════════════════════════════════════════════
// calling.ai_unhold
// ═════════════════════════════════════════════════════════════════════════════

model AiUnholdParams {
  ...CallAddress;

  /** Resume prompt (plain string). */
  prompt?: string;
}

model AiUnholdResult {
  ...RelayResult;
}

/** Resume an AI agent session from hold. */
@rpcMethod("calling.ai_unhold")
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

// ═════════════════════════════════════════════════════════════════════════════
// calling.user_event
// ═════════════════════════════════════════════════════════════════════════════

model UserEventParams {
  ...CallAddress;

  /** The custom event name. */
  event?: string;
}

model UserEventResult {
  ...RelayResult;
}

/** Send a custom user-defined event. */
@rpcMethod("calling.user_event")
@summary("Send a custom user-defined event")
@opExample(#{
  parameters: #{
    node_id: "a3e1b2c4-...",
    call_id: "c7f9d2e1-...",
    event: "custom_event_name",
  },
  returnType: #{ code: "200", message: "Event sent" },
})
op userEvent(...UserEventParams): UserEventResult;

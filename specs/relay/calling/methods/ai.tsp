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
// at emit time via @excludeFromEmit on the entry models (they never reach the live JSON-RPC
// wire). Relay-specific fields (control_id, agent, post_prompt_auth_*) and the Bedrock
// plain-string prompt stay local. See SWML-REUSE-GAPS.md for SWML fields still needing truing.
// ═════════════════════════════════════════════════════════════════════════════

/**
 * AI agent behavior parameters — automatic speech recognition (ASR), text-to-speech
 * (TTS), turn detection, barge-in, LLM tunables, thinking/vision, video, SWAIG knobs,
 * and debugging. Every field is optional.
 */
@excludeFromEmit(SWMLVar)
model AiBehaviorParams {
  ...SWML.Calling.AIParams;
}

// ═════════════════════════════════════════════════════════════════════════════
// calling.ai
// ═════════════════════════════════════════════════════════════════════════════

// Only SWMLVar is excluded — it is a markup-only template-variable placeholder (resolved at
// SWML execution time, never present on the live JSON-RPC wire). Everything else SWML accepts,
// including a full SWML document returned by a SWAIG data_map action, is a legitimate Relay
// surface and is emitted as-is.
@excludeFromEmit(SWMLVar)
model AiParams {
  ...CallAddress;

  /** Identifier used to control (e.g. stop) this AI session. */
  control_id: string;

  /**
   * Pre-configured agent UUID. If an inline `prompt` is also present, the inline
   * configuration takes precedence.
   */
  agent?: string;

  /** Inline prompt configuration for the AI agent (plain text or a structured POM). */
  prompt?: SWML.Calling.AIPrompt;

  /** Post-conversation prompt configuration. */
  post_prompt?: SWML.Calling.AIPostPrompt;

  /** URL to receive post-prompt status callbacks. */
  post_prompt_url?: url;

  /** Basic-auth username for `post_prompt_url`. */
  post_prompt_auth_user?: string;

  /** Basic-auth password for `post_prompt_url`. */
  post_prompt_auth_password?: string;

  /** Global data accessible to all SWAIG functions. */
  global_data?: SWML.Calling.GlobalData;

  /** Global pronunciation rules. */
  pronounce?: SWML.Calling.Pronounce[];

  /** Context hints biasing speech recognition. May be bare strings or rewrite objects. */
  hints?: (string | SWML.Calling.Hint)[];

  /** Supported language configurations. */
  languages?: SWML.Calling.Languages[];

  /** SWAIG function configuration. */
  SWAIG?: SWML.Calling.SWAIG;

  /** AI agent behavior parameters (ASR, TTS, turn detection, barge-in, LLM config, video, …). */
  params?: AiBehaviorParams;
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
  parameters: #{ node_id: "a3e1b2c4-...", call_id: "c7f9d2e1-...", control_id: "ai-session-1" },
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
// Parallels calling.ai but with a smaller surface: no control_id, agent,
// post_prompt_auth_*, pronounce, hints, or languages. `prompt` is a plain string
// (the system prompt), unlike calling.ai's object form.
// ═════════════════════════════════════════════════════════════════════════════

@excludeFromEmit(SWMLVar)
model AmazonBedrockParams {
  ...CallAddress;

  /** System prompt for the Bedrock agent. */
  prompt?: string;

  /** SWAIG function configuration. */
  SWAIG?: SWML.Calling.SWAIG;

  /** AI agent behavior parameters. See `calling.ai` `params`. */
  params?: AiBehaviorParams;

  /** Global data accessible to all SWAIG functions. */
  global_data?: SWML.Calling.GlobalData;

  /** Post-conversation prompt configuration. */
  post_prompt?: SWML.Calling.AIPostPrompt;

  /** URL to receive post-prompt results. */
  post_prompt_url?: url;
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
    prompt: "You are a helpful assistant.",
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
  parameters: #{ node_id: "a3e1b2c4-...", call_id: "c7f9d2e1-...", event: "custom_event_name" },
  returnType: #{ code: "200", message: "Event sent" },
})
op userEvent(...UserEventParams): UserEventResult;

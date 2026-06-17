import "@signalwire/typespec-asyncapi";
import "@signalwire/typespec-emit-filter";
import "../../../swml/calling";
import "../common.tsp";

using SignalWire.AsyncAPI;
using SignalWire.EmitFilter;

namespace Relay.Calling;

// ═════════════════════════════════════════════════════════════════════════════
// Shared AI sub-shapes (calling.ai / calling.amazon_bedrock)
//
// The Relay `calling.ai` surface shares its AI behavior `params` and SWAIG schema
// with the SWML `ai` verb (one FreeSWITCH engine parses both). `AiBehaviorParams` is
// imported directly from the SWML `AIParams` model — its template-variable `| SWMLVar`
// arms are stripped at emit time via @excludeFromEmit (they never reach the live
// JSON-RPC wire). The remaining sub-shapes below are hand-modeled from the
// engine-verified SWML schema; a few genuinely open ones (SWAIG `parameters`/`data_map`,
// `global_data`, `meta_data`) stay `Record<unknown>` and link to the SWML SWAIG reference.
// ═════════════════════════════════════════════════════════════════════════════

/**
 * Inline prompt configuration for the AI agent. Overrides a pre-configured
 * `agent` UUID when both are present.
 */
model AiPrompt {
  /** Instructions sent to the agent (plain text or SSML). */
  text?: string;

  /** Nucleus-sampling cutoff (0.0–1.0). Alternative to `temperature`. */
  @minValue(0.0)
  @maxValue(1.0)
  top_p?: float64;

  /** Randomness of generation (0.0–1.5). Lower is more deterministic. */
  @minValue(0.0)
  @maxValue(1.5)
  temperature?: float64;

  /** End-of-utterance speech-detect threshold (0.0–1.0). */
  @minValue(0.0)
  @maxValue(1.0)
  confidence?: float64;

  /** Confidence threshold for the user barging in over the agent (0.0–1.0). */
  @minValue(0.0)
  @maxValue(1.0)
  barge_confidence?: float64;

  /** Aversion to new topics (-2.0–2.0). Positive values encourage new topics. */
  @minValue(-2.0)
  @maxValue(2.0)
  presence_penalty?: float64;

  /** Aversion to repetition (-2.0–2.0). Positive values reduce verbatim repeats. */
  @minValue(-2.0)
  @maxValue(2.0)
  frequency_penalty?: float64;

  /** LLM model identifier to use for this prompt. */
  `model`?: string;
}

/**
 * Post-conversation prompt configuration. Same shape as `AiPrompt` minus
 * `confidence` (which has no meaning after the conversation has ended).
 */
model AiPostPrompt {
  /** Instructions sent to the agent after the conversation ends. */
  text?: string;

  /** Nucleus-sampling cutoff (0.0–1.0). Alternative to `temperature`. */
  @minValue(0.0)
  @maxValue(1.0)
  top_p?: float64;

  /** Randomness of generation (0.0–1.5). Lower is more deterministic. */
  @minValue(0.0)
  @maxValue(1.5)
  temperature?: float64;

  /** Confidence threshold for the user barging in over the agent (0.0–1.0). */
  @minValue(0.0)
  @maxValue(1.0)
  barge_confidence?: float64;

  /** Aversion to new topics (-2.0–2.0). Positive values encourage new topics. */
  @minValue(-2.0)
  @maxValue(2.0)
  presence_penalty?: float64;

  /** Aversion to repetition (-2.0–2.0). Positive values reduce verbatim repeats. */
  @minValue(-2.0)
  @maxValue(2.0)
  frequency_penalty?: float64;

  /** LLM model identifier to use for this post-prompt. */
  `model`?: string;
}

/**
 * A global pronunciation rule. Replaces a matched expression with a phonetic
 * spelling so the TTS engine pronounces it correctly.
 */
model AiPronounce {
  /** The expression to replace. */
  replace: string;

  /** The phonetic spelling to substitute. */
  with: string;

  /** Match case-insensitively. Default `true`. */
  ignore_case?: boolean = true;
}

/**
 * A context hint biasing speech recognition. May be a bare string, or an object
 * that rewrites a matched phrase before it reaches the model.
 */
model AiHint {
  /** The hint phrase to match exactly. */
  hint: string;

  /** A regular expression the hint must match before replacement. */
  pattern?: string;

  /** Text to replace the matched portion of the hint with. */
  replace?: string;

  /** Match case-insensitively. Default `false`. */
  ignore_case?: boolean = false;
}

/**
 * A supported language configuration for the dialogue. (Modeled per the SWML
 * `ai` verb; additional TTS engine-specific knobs may be accepted.)
 */
model AiLanguage {
  /** Human-readable language name, used in the system prompt (e.g. `French`). */
  name: string;

  /** ASR language code (e.g. `fr-FR`). */
  code: string;

  /** Voice in `<engine>.<voice>` form (e.g. `gcloud.fr-FR-Neural2-B`). */
  voice: string;

  /** TTS model for the selected engine. */
  `model`?: string;
}

/** Default settings applied to all SWAIG functions unless overridden. */
model AiSwaigDefaults {
  /**
   * Default webhook URL for function status callbacks. Basic auth may be inlined
   * as `username:password@url`.
   */
  web_hook_url?: string;

  /** Default basic-auth username for function webhooks. */
  web_hook_auth_user?: string;

  /** Default basic-auth password for function webhooks. */
  web_hook_auth_password?: string;

  /** Default scoping token applied to per-function `meta_data`. */
  meta_data_token?: string;

  /** Default user-defined metadata available to all functions. */
  meta_data?: Record<unknown>;
}

/**
 * A single SWAIG function definition. The agent calls these functions during the
 * conversation; the schema is shared with the `ai_sidecar` service.
 */
model AiSwaigFunction {
  /** Unique function name (or a reserved SignalWire hook name). */
  function: string;

  /**
   * The context and purpose of the function, explaining to the agent when to use
   * it. Modern alias for the legacy `purpose` field.
   */
  description?: string;

  /**
   * The context and purpose of the function. Legacy field — use `description`
   * (its modern alias) instead. If both are set, `description` takes precedence.
   */
  purpose?: string;

  /**
   * JSON Schema object describing the function's input parameters and their
   * validation rules. Modeled loosely — the structured schema is documented with
   * the SWML `ai` verb SWAIG reference.
   */
  parameters?: Record<unknown>;

  /**
   * Legacy field describing the function's input. Use `parameters` (the modern,
   * structured replacement) instead.
   */
  argument?: unknown;

  /** Whether the function is callable. Default `true`. */
  active?: boolean = true;

  /**
   * Arbitrary per-function data, referenceable within the function (e.g. from the
   * prompt via template strings). Open key/value object.
   */
  meta_data?: Record<unknown>;

  /**
   * Scoping token for `meta_data`. If unset, metadata is scoped to the function's
   * `web_hook_url`.
   */
  meta_data_token?: string;

  /**
   * Processes function inputs through expressions, webhooks, or direct output.
   * Modeled loosely — the structured shape is documented with the SWML `ai` verb
   * SWAIG reference.
   */
  data_map?: Record<unknown>;

  /**
   * Per-function webhook URL override for status callbacks. Basic auth may be
   * inlined as `username:password@url`.
   */
  web_hook_url?: string;

  /** Per-function basic-auth username for the webhook. */
  web_hook_auth_user?: string;

  /** Per-function basic-auth password for the webhook. */
  web_hook_auth_password?: string;
}

/** Remote SWAIG function include — pull function signatures from a URL. */
model AiSwaigIncludes {
  /** URL hosting the remote functions. Basic auth may be inlined. */
  url: string;

  /** Names of the remote functions to include. */
  functions: string[];

  /** User-defined metadata passed with the remote-function request. */
  meta_data?: Record<unknown>;
}

/** Prebuilt native functions the agent may call. */
union AiSwaigNativeFunction {
  /** Returns the current time for the time zone set in `params.local_tz`. */
  "check_time",

  /** Waits for the given number of seconds. */
  "wait_seconds",

  /**
   * Waits until the user speaks again. Used when the user asks the agent to wait
   * or hold on.
   */
  "wait_for_user",

  /** Adjusts how long the agent waits for the user to stop talking. */
  "adjust_response_latency",
}

/**
 * A Model Context Protocol (MCP) server the agent can pull tools/resources from.
 */
model AiMcpServer {
  /** The MCP server URL. */
  url: string;

  /**
   * HTTP headers sent to the MCP server. Authorization tokens go here — there is
   * no separate auth field.
   */
  headers?: Record<string>;

  /**
   * Whether to fetch the server's resources into `global_data`, when the server
   * advertises resource support. Default `false`.
   */
  resources?: boolean = false;

  /**
   * Variables passed to the MCP server when fetching resources. Used only when
   * `resources` is enabled.
   */
  resource_vars?: Record<string>;
}

/** SWAIG (SignalWire AI Gateway) function configuration. */
model AiSwaig {
  /** Default settings inherited by all functions. */
  defaults?: AiSwaigDefaults;

  /** User-defined functions the agent may call. */
  functions?: AiSwaigFunction[];

  /** Remote function-signature includes. */
  includes?: AiSwaigIncludes[];

  /** Prebuilt native functions the agent may call. */
  native_functions?: AiSwaigNativeFunction[];

  /** Model Context Protocol (MCP) servers to source tools/resources from. */
  mcp_servers?: AiMcpServer[];
}

// Imported directly from the engine-verified SWML `ai` verb model (one engine parses both
// surfaces), instead of hand-replicating it. The SWML template-variable arms (`| SWMLVar`)
// are stripped at emit time via @excludeFromEmit — they never reach the live wire.
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

model AiParams {
  ...CallAddress;

  /** Identifier used to control (e.g. stop) this AI session. */
  control_id: string;

  /**
   * Pre-configured agent UUID. If an inline `prompt` is also present, the inline
   * configuration takes precedence.
   */
  agent?: string;

  /** Inline prompt configuration for the AI agent. */
  prompt?: AiPrompt;

  /** Post-conversation prompt configuration. */
  post_prompt?: AiPostPrompt;

  /** URL to receive post-prompt status callbacks. */
  post_prompt_url?: url;

  /** Basic-auth username for `post_prompt_url`. */
  post_prompt_auth_user?: string;

  /** Basic-auth password for `post_prompt_url`. */
  post_prompt_auth_password?: string;

  /** Global data accessible to all SWAIG functions. */
  global_data?: Record<unknown>;

  /** Global pronunciation rules. */
  pronounce?: AiPronounce[];

  /** Context hints biasing speech recognition. */
  hints?: AiHint[];

  /** Supported language configurations. */
  languages?: AiLanguage[];

  /** SWAIG function configuration. */
  SWAIG?: AiSwaig;

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

model AmazonBedrockParams {
  ...CallAddress;

  /** System prompt for the Bedrock agent. */
  prompt?: string;

  /** SWAIG function configuration. */
  SWAIG?: AiSwaig;

  /** AI agent behavior parameters. See `calling.ai` `params`. */
  params?: AiBehaviorParams;

  /** Global data accessible to all SWAIG functions. */
  global_data?: Record<unknown>;

  /** Post-conversation prompt configuration. */
  post_prompt?: AiPostPrompt;

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

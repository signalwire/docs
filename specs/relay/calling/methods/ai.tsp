import "@signalwire/typespec-asyncapi";
import "../common.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

// ═════════════════════════════════════════════════════════════════════════════
// Shared AI sub-shapes (calling.ai / calling.amazon_bedrock)
//
// The Relay `calling.ai` protocol surface is a simplified projection of the SWML
// `ai` verb. Only the documented fields are modeled below; genuinely open-ended
// surfaces (the AI behavior `params` object, SWAIG function extras) are
// loose-modeled as `Record<unknown>`/`unknown` with openQuestions.
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
}

/**
 * A single SWAIG function definition. Only the historically documented fields
 * (`function`, `purpose`, `argument`) are typed; the live SWAIG schema accepts
 * many more (`description`, `parameters`, `data_map`, `web_hook_url`, fillers,
 * …) — see openQuestions.
 */
model AiSwaigFunction {
  /** Unique function name (or a reserved SignalWire hook name). */
  function: string;

  /** Description of when/why the agent should call this function. */
  purpose?: string;

  /** Description of the input the function expects. */
  argument?: unknown;

  /** Per-function webhook URL override. */
  web_hook_url?: string;
}

/** Remote SWAIG function include — pull function signatures from a URL. */
model AiSwaigIncludes {
  /** URL hosting the remote functions. Basic auth may be inlined. */
  url: string;

  /** Names of the remote functions to include. */
  functions: string[];
}

/** SWAIG (SignalWire AI Gateway) function configuration. */
model AiSwaig {
  /** Default settings inherited by all functions. */
  defaults?: AiSwaigDefaults;

  /** User-defined functions the agent may call. */
  functions?: AiSwaigFunction[];

  /** Remote function-signature includes. */
  includes?: AiSwaigIncludes[];

  /**
   * Names of prebuilt native functions the agent may call (e.g. `check_time`,
   * `wait_seconds`). Modeled loosely — the available set is documented with the
   * SWML `ai` verb.
   */
  native_functions?: string[];
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

  /**
   * Open-ended AI behavior parameters (ASR, TTS, turn detection, barge-in, LLM
   * config, video, …). Loose-modeled — the full enumeration lives with the SWML
   * `ai` verb. Example fields: `end_of_speech_timeout`, `attention_timeout` (ms).
   */
  params?: Record<unknown>;
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

  /**
   * Open-ended AI behavior parameters. Loose-modeled — see `calling.ai` `params`.
   */
  params?: Record<unknown>;

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
op userEvent(...UserEventParams): UserEventResult;

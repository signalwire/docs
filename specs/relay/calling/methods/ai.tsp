import "@signalwire/typespec-asyncapi";
import "../common.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

// ═════════════════════════════════════════════════════════════════════════════
// Shared AI sub-shapes (calling.ai / calling.amazon_bedrock)
//
// The Relay `calling.ai` surface shares its AI behavior `params` and SWAIG schema
// with the SWML `ai` verb (one FreeSWITCH engine parses both). The shapes below
// are replicated from the engine-verified SWML models — template-variable arms
// stripped (they never reach the live JSON-RPC wire). `AiBehaviorParams` keeps a
// trailing `...Record<unknown>` because the engine also reads less-common knobs;
// a few genuinely open sub-shapes (SWAIG `parameters`/`data_map`, `global_data`,
// `meta_data`) stay `Record<unknown>` and link to the SWML SWAIG reference.
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

/** Forces the direction of the call presented to the assistant. */
union AiCallDirection {
  /** Treat the call as inbound to the assistant. */
  "inbound",

  /** Treat the call as outbound from the assistant. */
  "outbound",
}

/** Role of a seeded conversation-history message. */
union AiConversationRole {
  /** A message from the user. */
  "user",

  /** A message from the AI assistant. */
  "assistant",

  /** A system message providing instructions or context. */
  "system",
}

/** A single turn in seeded conversation history (`params.convo`). */
model AiConversationMessage {
  /** Role of the message sender. */
  role: AiConversationRole;

  /** Text content of the message. */
  content: string;

  /** Optional language code for the message (e.g. `en`, `es`, `fr`). */
  lang?: string;
}

/**
 * AI agent behavior parameters — ASR, TTS, turn detection, barge-in, LLM
 * tunables, thinking/vision, video, SWAIG knobs, and debugging. Every field is
 * optional; the object is open (`...Record<unknown>`) because the engine also
 * reads additional, less-common knobs not enumerated here.
 */
model AiBehaviorParams {
  /** Acknowledge crosstalk and confirm user input when the user speaks over the agent. */
  acknowledge_interruptions?: boolean;

  /** LLM model for the AI. Suggested values: `gpt-4o-mini`, `gpt-4.1-mini`, `gpt-4.1-nano`. */
  ai_model?: string = "gpt-4o-mini";

  /**
   * The name the agent responds to for wake/activation. When using `enable_pause`,
   * `start_paused`, or `speak_when_spoken_to`, the user must say this name to get
   * the agent's attention. Matching is case-insensitive.
   */
  ai_name?: string = "computer";

  /** AI playback volume, `-50` to `50`. Default `0`. */
  @minValue(-50)
  @maxValue(50)
  ai_volume?: int32 = 0;

  /**
   * Custom identifier for the AI application instance. Included in webhook
   * payloads so backends can identify which configuration made the request.
   */
  app_name?: string = "swml app";

  /**
   * Enable smart formatting in ASR, improving formatting of numbers, dates, times,
   * and similar entities in the transcript. Default `false`.
   */
  asr_smart_format?: boolean;

  /**
   * Time, in ms, to wait before prompting the user to respond. `10000`–`600000`,
   * or `0` to disable. Default `5000` ms.
   */
  attention_timeout?: int32 | 0;

  /** Prompt fed into the AI when `attention_timeout` is reached. */
  attention_timeout_prompt?: string;

  /**
   * Enable speaker diarization in ASR, breaking the transcript into per-speaker
   * chunks. Default `false`.
   */
  asr_diarize?: boolean;

  /**
   * Force the agent to respond only to the speaker who responds first; other
   * speakers are ignored. Default `false`.
   */
  asr_speaker_affinity?: boolean;

  /** Announce the function being executed on the call. Default `false`. */
  audible_debug?: boolean = false;

  /** Announce latency information during the call (debugging). Default `false`. */
  audible_latency?: boolean = false;

  /** URL of an audio file to play in the background while the AI plays in the foreground. */
  background_file?: url;

  /** Maximum times to loop the background file. `null` loops indefinitely. */
  background_file_loops?: int32 | null;

  /** Background-file volume, `-50` to `50`. Default `0`. */
  @minValue(-50)
  @maxValue(50)
  background_file_volume?: int32 = 0;

  /**
   * Controls barge behavior. Accepts `"complete"`, `"partial"`, `"all"`, a
   * comma-separated combination, or a boolean. Default `"complete,partial"`.
   */
  enable_barge?: string | boolean = "complete,partial";

  /**
   * Run a separate background AI process that analyzes the conversation and gives
   * the main agent real-time insights ("internal thought process"). Default `false`.
   */
  enable_inner_dialog?: boolean = false;

  /**
   * Enable pause/resume. Adds a `pause_conversation` function the AI can call when
   * the user says things like "hold on". While paused, the agent waits until the
   * user speaks its name (`ai_name`) to resume. Cannot be combined with
   * `speak_when_spoken_to`. Default `false`.
   */
  enable_pause?: boolean = false;

  /**
   * Monitor partial transcripts for sentence-ending punctuation to proactively
   * finalize recognition, reducing latency. Works with `turn_detection_timeout`.
   * Default `true`.
   */
  enable_turn_detection?: boolean = true;

  /**
   * A string (may be a regular expression) defining barge behavior — e.g. stop
   * when a specific word is heard.
   */
  barge_match_string?: string;

  /** Number of words that must be heard before barge triggers, `1`–`99`. */
  @minValue(1)
  @maxValue(99)
  barge_min_words?: int32;

  /** Allow functions to execute while the AI is being interrupted. Default `true`. */
  barge_functions?: boolean = true;

  /** Enable response caching for improved performance. Default `false`. */
  cache_mode?: boolean = false;

  /** Prompt that binds the agent to its purpose. */
  conscience?: string;

  /**
   * Pre-existing conversation history injected at session startup, to seed the
   * agent with prior context or example interactions.
   */
  convo?: AiConversationMessage[];

  /** Identifies a conversation, used by `check_for_input` and `save_conversation`. */
  conversation_id?: string;

  /**
   * Size of the sliding window for conversation history sent to the model, limiting
   * how much history is included.
   */
  conversation_sliding_window?: int32;

  /** Debug verbosity posted to the debug webhook, `0`–`2`. Default `1` if a URL is set. */
  @minValue(0)
  @maxValue(2)
  debug_webhook_level?: int32;

  /** URL to which each interaction between the AI and user is posted in real time. */
  debug_webhook_url?: url;

  /**
   * Enable debug mode for the session, logging extra diagnostics (turn-detection
   * events, speech processing, internal state changes).
   */
  debug?: boolean | int32;

  /** Force the call direction presented to the assistant (`inbound` or `outbound`). */
  direction?: AiCallDirection;

  /** DTMF digit (as a string) that signals end of input (e.g. `#`). */
  digit_terminators?: string;

  /** Time, in ms, after digit input to detect end of input, `0`–`30000`. Default `3000` ms. */
  @minValue(0)
  @maxValue(30000)
  digit_timeout?: int32 = 3000;

  /**
   * Silence, in ms, at the end of an utterance to detect end of speech,
   * `250`–`10000`. Default `700` ms.
   */
  @minValue(250)
  @maxValue(10000)
  end_of_speech_timeout?: int32 = 700;

  /** Enable usage accounting. Default `false`. */
  enable_accounting?: boolean;

  /**
   * Enable thinking output for the agent. May add slight latency, as the AI uses an
   * extra turn to think about the query. Default `false`.
   */
  enable_thinking?: boolean = false;

  /**
   * Converts numbers, currency, dates, and similar values between written and
   * spoken forms. `heard` converts caller speech to written form; `spoken` converts
   * the AI's written response to spoken form; `both` applies both. `false`/`off`/
   * `none` disable it; `true`/`on` are aliases for `both`. Default `both`.
   */
  enable_text_normalization?:
    | "heard"
    | "spoken"
    | "both"
    | "true"
    | "on"
    | "false"
    | "off"
    | "none" = "both";

  /**
   * Enable visual input processing, letting the agent use the `get_visual_input`
   * function. Default `false`.
   */
  enable_vision?: boolean = false;

  /** Energy (in dB) required for the bot to hear the user, `0.0`–`100.0`. Default `52.0` dB. */
  @minValue(0.0)
  @maxValue(100.0)
  energy_level?: float64 = 52.0;

  /** Time, in ms, to wait for the first word after speech is detected, `0`–`10000`. Default `1000` ms. */
  @minValue(0)
  @maxValue(10000)
  first_word_timeout?: int32 = 1000;

  /**
   * If `true`, wait for any filler to finish before executing a function; if
   * `false`, execute asynchronously as the filler plays. Default `false`.
   */
  function_wait_for_talking?: boolean = false;

  /** Allow functions to execute when there is no user response after a timeout. Default `false`. */
  functions_on_no_response?: boolean = false;

  /** Final prompt fed into the AI when `hard_stop_time` is reached. */
  hard_stop_prompt?: string;

  /**
   * Maximum duration the agent stays active before exiting the session. Formats:
   * seconds (`30s`), minutes (`2m`), hours (`1h`), or combined (`1h45m30s`).
   */
  hard_stop_time?: string;

  /** URL of hold music to play. Accepts WAV, mp3, and FreeSWITCH tone_stream. */
  hold_music?: url;

  /** Enable hold music during SWAIG processing. Default `false`. */
  hold_on_process?: boolean = false;

  /**
   * Time, in ms, to wait before exiting due to inactivity, `10000`–`3600000`.
   * Default `600000` ms (10 minutes).
   */
  @minValue(10000)
  @maxValue(3600000)
  inactivity_timeout?: int32 = 600000;

  /**
   * Model for the inner-dialog feature (often a smaller/faster model). Suggested
   * values: `gpt-4o-mini`, `gpt-4.1-mini`, `gpt-4.1-nano`. Used only when
   * `enable_inner_dialog` is `true`.
   */
  inner_dialog_model?: string;

  /**
   * System prompt guiding the inner-dialog AI's analysis. Used only when
   * `enable_inner_dialog` is `true`.
   */
  inner_dialog_prompt?: string;

  /**
   * Synchronize the inner dialog with the main conversation flow, so it waits for
   * each turn to complete before providing analysis. Used only when
   * `enable_inner_dialog` is `true`. Default `false`.
   */
  inner_dialog_synced?: boolean = false;

  /** Time, in ms, to wait before starting the conversation, `0`–`300000`. Default `0`. */
  @minValue(0)
  @maxValue(300000)
  initial_sleep_ms?: int32 = 0;

  /**
   * Polling frequency, in ms, for `check_for_input` (e.g. feeding an inbound SMS to
   * the AI on a voice call), `1000`–`10000`. Default `2000` ms.
   */
  @minValue(1000)
  @maxValue(10000)
  input_poll_freq?: int32 = 2000;

  /** Barge the agent on any sound interruption longer than one second. */
  interrupt_on_noise?: boolean;

  /** Prompt for the agent to handle crosstalk. */
  interrupt_prompt?: string;

  /** Allow multilingualism. Default `false`. */
  languages_enabled?: boolean = false;

  /** Local timezone for the AI, as an IANA TZ ID (e.g. `America/Ensenada`). */
  local_tz?: string;

  /**
   * Involve the agent in diarization: users can state who they are at the start so
   * the agent can identify them later. Default `false`.
   */
  llm_diarize_aware?: boolean;

  /** Maximum emotion intensity for the AI voice, `1`–`30`. Default `30`. */
  @minValue(1)
  @maxValue(30)
  max_emotion?: int32 = 30;

  /**
   * Maximum tokens the model may generate in a single response. Lower values
   * produce shorter responses and reduce latency.
   */
  @minValue(1)
  @maxValue(16384)
  max_response_tokens?: int32;

  /** ASR engine to use. Common values include `nova-2` and `nova-3`. */
  openai_asr_engine?: string;

  /**
   * Time, in ms, for an outbound recipient to respond before timeout,
   * `10000`–`600000`. Default `120000` ms (2 minutes).
   */
  @minValue(10000)
  @maxValue(600000)
  outbound_attention_timeout?: int32 = 120000;

  /**
   * Automatically save `global_data` to a channel variable and restore it when a
   * new AI session starts on the same call, persisting data across invocations.
   * Default `true`.
   */
  persist_global_data?: boolean = true;

  /** Output format for structured (`pom`) prompts. `markdown` or `xml`. Default `markdown`. */
  pom_format?: "markdown" | "xml" = "markdown";

  /**
   * Send a summary of the conversation after the call ends. Requires a post URL and
   * a `conversation_id`; removes the need for a `post_prompt`.
   */
  save_conversation?: boolean;

  /** Time, in ms, to wait for a speech event, `0`–`10000`. Default `1400` ms. */
  @minValue(0)
  @maxValue(10000)
  speech_event_timeout?: int32 = 1400;

  /** Number of quick stops to generate for speech, `0`–`10`. Default `3`. */
  @minValue(0)
  @maxValue(10)
  speech_gen_quick_stops?: int32 = 3;

  /** Overall speech timeout, in ms, `0`–`600000`. Default `60000` ms. */
  @minValue(0)
  @maxValue(600000)
  speech_timeout?: int32 = 60000;

  /**
   * Keep the agent silent until directly addressed by name (`ai_name`), a
   * push-to-talk style interaction. Cannot be combined with `enable_pause`.
   * Default `false`.
   */
  speak_when_spoken_to?: boolean = false;

  /**
   * Start the agent paused until the user speaks its name (`ai_name`). Automatically
   * enables `enable_pause`. Default `false`.
   */
  start_paused?: boolean = false;

  /** Static greeting played when the call is answered; always plays at the start. */
  static_greeting?: string;

  /** Prevent the user from interrupting the static greeting by speaking over it. Default `false`. */
  static_greeting_no_barge?: boolean = false;

  /** Mode for summary generation. `string` or `original`. */
  summary_mode?: "string" | "original";

  /**
   * Allow tweaking settings (e.g. `barge_match_string`) via the SWML returned from a
   * SWAIG function. Default `true`.
   */
  swaig_allow_settings?: boolean = true;

  /** Allow SWAIG functions to return SWML to be executed. Default `true`. */
  swaig_allow_swml?: boolean = true;

  /** Post the entire conversation to every SWAIG call. Default `false`. */
  swaig_post_conversation?: boolean = false;

  /** Allow SWAIG to set global data that persists across calls. Default `true`. */
  swaig_set_global_data?: boolean = true;

  /**
   * Controls which SWML variables are posted in SWAIG webhook payloads. `true`
   * posts all; an array of names posts only those variables.
   */
  swaig_post_swml_vars?: boolean | string[];

  /**
   * Model for the agent's thinking capabilities. Suggested values: `gpt-4o-mini`,
   * `gpt-4.1-mini`, `gpt-4.1-nano`.
   */
  thinking_model?: string;

  /**
   * Ignore the user's input while they speak over the agent; the agent waits for
   * them to finish. The LLM's own barge attempts are ignored and scrubbed from the
   * logs. Default `true`.
   */
  transparent_barge?: boolean = true;

  /** Maximum time, in ms, for transparent-barge mode, `0`–`60000`. Default `3000` ms. */
  @minValue(0)
  @maxValue(60000)
  transparent_barge_max_time?: int32 = 3000;

  /** Pass a conversation summary from one agent to another (e.g. between departments). Default `false`. */
  transfer_summary?: boolean = false;

  /**
   * Time, in ms, to wait after detecting a potential end-of-turn before finalizing
   * recognition. Shorter is faster but may cut off mid-sentence; `0` finalizes
   * immediately. Used only when `enable_turn_detection` is `true`. Default `250` ms.
   */
  @minValue(0)
  @maxValue(10000)
  turn_detection_timeout?: int32 = 250;

  /**
   * Format for the agent to reference phone numbers. `international` (e.g.
   * `+12345678901`) or `national` (e.g. `(234) 567-8901`). Default `international`.
   */
  tts_number_format?: "international" | "national" = "international";

  /** Enable verbose logging. Default `false`. */
  verbose_logs?: boolean = false;

  /** URL of a video file to play when the AI is listening. Video-capable calls only. */
  video_listening_file?: url;

  /** URL of a video file to play when the AI is idle. Video-capable calls only. */
  video_idle_file?: url;

  /** URL of a video file to play when the AI is talking. Video-capable calls only. */
  video_talking_file?: url;

  /**
   * Model for the agent's vision capabilities. Suggested values: `gpt-4o-mini`,
   * `gpt-4.1-mini`, `gpt-4.1-nano`.
   */
  vision_model?: string;

  /**
   * Silero Voice Activity Detection (VAD) settings. Format `"threshold"` or
   * `"threshold:frame_ms"`. Threshold (`0`–`100`) sets sensitivity; optional
   * frame_ms (`16`–`40`) sets frame duration.
   */
  vad_config?: string;

  /** When `true`, the agent waits for the user to speak first. Default `false`. */
  wait_for_user?: boolean = false;

  /**
   * Additional prefix that must precede `ai_name` to wake the agent from a paused
   * state (e.g. with `ai_name` "computer" and `wake_prefix` "hey", say "hey
   * computer").
   */
  wake_prefix?: string;

  ...Record<unknown>;
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

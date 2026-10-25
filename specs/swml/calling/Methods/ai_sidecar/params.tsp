import "@typespec/json-schema";
import "../../../Shared/Types/main.tsp";

using TypeSpec.JsonSchema;

namespace SWML.Calling;

@summary("AISidecarParams object")
model AISidecarParams {
  @doc("How long the customer can be silent, in milliseconds, after they finish speaking before the sidecar evaluates the conversation. Lower values make the sidecar react faster. Range: 50-5000. **Default:** `200`.")
  @example(200)
  @minValue(50)
  @maxValue(5000)
  idle_timeout_ms?: integer | SWMLVar = 200;

  @doc("The minimum time, in milliseconds, between evaluations — a throttle that limits how often the sidecar runs on a busy call. Range: 0-60000. **Default:** `0`.")
  @example(1000)
  @minValue(0)
  @maxValue(60000)
  min_interval_ms?: integer | SWMLVar = 0;

  @doc("""
    The maximum number of model steps in a single evaluation, or in answering an ask. Each step is one model
    response, which can call several tools at once. When the limit is reached the evaluation stops, whether or
    not the model has produced its advice. Range: 1-20. **Default:** `5`.
    """)
  @example(5)
  @minValue(1)
  @maxValue(20)
  max_iters_per_tick?: integer | SWMLVar = 5;

  @doc("""
    A soft token budget for the sidecar's running conversation history. When the history grows past it, the
    oldest complete exchanges are dropped, keeping the sidecar's instructions at the start. Dropping stops once
    eight or fewer messages follow the instructions, so the history can stay above the budget. An exchange is
    always dropped whole, so fewer than eight messages can remain. Range: 1000-200000. **Default:** `8000`.
    """)
  @example(8000)
  @minValue(1000)
  @maxValue(200000)
  max_history_tokens?: integer | SWMLVar = 8000;

  @doc("Whether actions returned by your tools (such as transferring or hanging up the call) take effect on the call, or are only reported as callbacks. **Default:** `true`.")
  @example(true)
  act_on_channel?: boolean | SWMLVar = true;

  @doc("Whether to generate a closing summary of the sidecar's session when the call ends. The result is included in the final callback. **Default:** `false`.")
  @example(false)
  final_summary?: boolean | SWMLVar = false;

  @doc("Whether to generate an end-of-call summary of the conversation itself, distinct from `final_summary` (which summarizes the sidecar's session). **Default:** `false`.")
  @example(false)
  ai_summary?: boolean | SWMLVar = false;

  @doc("A custom prompt for the end-of-call conversation summary.")
  @example("Summarize the key points of this conversation.")
  ai_summary_prompt?: string;

  @doc("The model used for the end-of-call conversation summary, distinct from `model` (the sidecar's own model). Suggested values: `gpt-4o-mini`, `gpt-4.1-mini`, `gpt-4.1-nano`. **Default:** `gpt-4o-mini`.")
  @example("gpt-4.1-mini")
  summary_model?: SupportedAIModels = "gpt-4o-mini";

  @doc("Whether to emit a callback for each utterance the speech recognizer produces. **Default:** `false`.")
  @example(false)
  live_events?: boolean | SWMLVar = false;

  @doc("Whether each utterance callback includes full speech-recognition detail, such as word timings and alternatives. This increases the callback size, so leave it off unless you need it. **Default:** `false`.")
  @example(false)
  verbose_utterances?: boolean | SWMLVar = false;

  @doc("The speech recognition engine to use. **Default:** `deepgram`.")
  @example(SpeechEngine.google)
  speech_engine?: SpeechEngine = SpeechEngine.deepgram;

  @doc("How long, in milliseconds, the recognizer waits before finalizing speech. Range: 0-600000. When omitted or `0`, `60000` is used.")
  @example(30000)
  @minValue(0)
  @maxValue(600000)
  speech_timeout?: integer | SWMLVar;

  @doc("The amount of silence, in milliseconds, used to detect the end of speech. Range: 0-60000. When omitted or `0`, `700` is used with the `deepgram` speech engine and `500` with `google`.")
  @example(500)
  @minValue(0)
  @maxValue(60000)
  vad_silence_ms?: integer | SWMLVar;

  @doc("How sensitively the recognizer detects speech. Range: 0-10000. When omitted or `0`, `400` is used.")
  @example(400)
  @minValue(0)
  @maxValue(10000)
  vad_thresh?: integer | SWMLVar;

  @doc("Speech-engine debug verbosity. Range: 0-100. **Default:** `0`.")
  @example(0)
  @minValue(0)
  @maxValue(100)
  debug_level?: integer | SWMLVar = 0;

  @doc("Whether to enable verbose logging for the sidecar. **Default:** `false`.")
  @example(false)
  debug?: boolean | SWMLVar = false;

  @doc("""
    The default prompt for an on-demand summary (`action.summarize`) that sets no `prompt` of its own. It is not
    sent to the speech recognizer; use `hints` to help it recognize specific terms. This is distinct from the
    operator `prompt` and from `ai_summary_prompt`, which is used for the end-of-call summary.
    """)
  @example("Summarize the conversation so far, including the customer's main concerns.")
  transcribe_prompt?: string;
}

import "@signalwire/typespec-asyncapi";
import "../../../../common/frames.tsp";
import "@typespec/openapi";

import "../../../models/core.tsp";

using TypeSpec.OpenAPI;

namespace Relay.Calling;

model CallAiEventData {
  ...CallEventAddress;

  @doc("Your control identifier for the AI session this lifecycle event belongs to.")
  @example("d4b2e1a0-7c9f-4a3b-8e2d-1f0a9b8c7d6e")
  control_id: string;

  @doc("Terminal state of the AI session: `finished` when the session ended normally, or `error` when it ended abnormally.")
  @example("finished")
  state: "finished" | "error";
}

const callingCallAi = "calling.call.ai";
@summary(callingCallAi)
@extension("x-fern-display-name", callingCallAi)
model CallAiEvent is SignalwireEvent<typeof callingCallAi, CallAiEventData>;

// ---------------------------------------------------------------------------
// AI activity event stream (mod_openai). These fire while an AI session is
// active. Bodies are passed opaquely by the transform layer; the per-field
// public truth is mod_openai. `call_id`/`node_id` are injected into the event
// envelope by the platform.
// ---------------------------------------------------------------------------

model AiCompletionEventData {
  @doc("The assistant's completed utterance for the turn, with internal markup prefixes stripped. Redacted when the app has `redact_prompt` set.")
  @example("Sure — I can help you place an order. Would you like pickup or delivery?")
  text: string;

  @doc("Whether the turn completed normally or was cut short by a barge-in: `barged` when the caller interrupted the assistant, otherwise `normal`.")
  @example("normal")
  type: "normal" | "barged";
}

const callingAiCompletion = "calling.ai.completion";
@summary(callingAiCompletion)
@extension("x-fern-display-name", callingAiCompletion)
model AiCompletionEvent is SignalwireEvent<typeof callingAiCompletion, AiCompletionEventData>;

model AiResponseEventData {
  @doc("The full concatenated LLM response text for the turn. Redacted when the app has `redact_prompt` set.")
  @example("Sure — I can help you place an order. Would you like pickup or delivery?")
  response: string;
}

const callingAiResponseEvent = "calling.ai.response";
@summary(callingAiResponseEvent)
@extension("x-fern-display-name", callingAiResponseEvent)
model AiResponseEvent is SignalwireEvent<typeof callingAiResponseEvent, AiResponseEventData>;

model AiResponseUtteranceEventData {
  @doc("One spoken segment of the assistant's response, emitted as it streams, with internal markup prefixes stripped. Redacted when the app has `redact_prompt` set.")
  @example("Would you like pickup or delivery?")
  utterance: string;
}

const callingAiResponseUtterance = "calling.ai.response_utterance";
@summary(callingAiResponseUtterance)
@extension("x-fern-display-name", callingAiResponseUtterance)
model AiResponseUtteranceEvent is SignalwireEvent<typeof callingAiResponseUtterance, AiResponseUtteranceEventData>;

model AiSpeechDetectEventData {
  @doc("The caller's final recognized transcript for the turn.")
  @example("I'd like to order a large pepperoni pizza for delivery.")
  text: string;
}

const callingAiSpeechDetect = "calling.ai.speech_detect";
@summary(callingAiSpeechDetect)
@extension("x-fern-display-name", callingAiSpeechDetect)
model AiSpeechDetectEvent is SignalwireEvent<typeof callingAiSpeechDetect, AiSpeechDetectEventData>;

model AiPartialResultEventData {
  @doc("The caller's interim (partial) ASR transcript.")
  @example("I'd like to order a large")
  text: string;

  @doc("Present and `true` only when this partial transcript triggered a barge-in of the assistant's speech.")
  @example(true)
  barged?: boolean;
}

const callingAiPartialResult = "calling.ai.partial_result";
@summary(callingAiPartialResult)
@extension("x-fern-display-name", callingAiPartialResult)
model AiPartialResultEvent is SignalwireEvent<typeof callingAiPartialResult, AiPartialResultEventData>;

@doc("Signal-only event: the assistant has started speaking. The body is empty.")
model AiBeginSpeakingEventData {}

const callingAiBeginSpeaking = "calling.ai.begin_speaking";
@summary(callingAiBeginSpeaking)
@extension("x-fern-display-name", callingAiBeginSpeaking)
model AiBeginSpeakingEvent is SignalwireEvent<typeof callingAiBeginSpeaking, AiBeginSpeakingEventData>;

@doc("Signal-only event: the AI session has started. The body is empty.")
model AiStartEventData {}

const callingAiStart = "calling.ai.start";
@summary(callingAiStart)
@extension("x-fern-display-name", callingAiStart)
model AiStartEvent is SignalwireEvent<typeof callingAiStart, AiStartEventData>;

@doc("Signal-only event: the caller has started speaking (barge-in). The body is empty.")
model AiUserSpeakingEventData {}

const callingAiUserSpeaking = "calling.ai.user_speaking";
@summary(callingAiUserSpeaking)
@extension("x-fern-display-name", callingAiUserSpeaking)
model AiUserSpeakingEvent is SignalwireEvent<typeof callingAiUserSpeaking, AiUserSpeakingEventData>;

model AiWarningEventData {
  @doc("Human-readable warning message, e.g. an oversized system prompt.")
  @example("Excessive System Prompt.\n")
  error: string;

  @doc("The prompt token count that triggered the warning.")
  @example(78000)
  tokens: float64;
}

const callingAiWarning = "calling.ai.warning";
@summary(callingAiWarning)
@extension("x-fern-display-name", callingAiWarning)
model AiWarningEvent is SignalwireEvent<typeof callingAiWarning, AiWarningEventData>;

model AiTransparentBargeEventData {
  @doc("The caller's merged turn text after a transparent barge. Present only when non-empty.")
  @example("Actually, make that two large pepperoni pizzas.")
  combined_text?: string;
}

const callingAiTransparentBarge = "calling.ai.transparent_barge";
@summary(callingAiTransparentBarge)
@extension("x-fern-display-name", callingAiTransparentBarge)
model AiTransparentBargeEvent is SignalwireEvent<typeof callingAiTransparentBarge, AiTransparentBargeEventData>;

model AiStopEventData {
  @doc("When the AI session started, as a Unix timestamp in microseconds.")
  @example(1718000000000000)
  start_time: int64;

  @doc("When the AI session ended, as a Unix timestamp in microseconds.")
  @example(1718000123000000)
  end_time: int64;

  @doc("Total time in seconds the wallet was paused during the session.")
  @example(0)
  wallet_paused_sec: float64;

  @doc("Billing detail for the session. An open object: keys under `this_visit`/`cumulative` are dynamic per-resource/SKU maps, so the shape is not a fixed schema.")
  billing?: Record<unknown>;
}

const callingAiStopEvent = "calling.ai.stop";
@summary(callingAiStopEvent)
@extension("x-fern-display-name", callingAiStopEvent)
model AiStopEvent is SignalwireEvent<typeof callingAiStopEvent, AiStopEventData>;

// Envelope-only topics: the body is caller/engine-defined free-form and is not
// modeled as a closed schema. See followup/C — post_prompt, swaig, swaig_action.

@doc("End-of-call summary payload. The body is caller-defined and delivered as a free-form object; only fires when the app has a `post_url` set.")
model AiPostPromptEventData is Record<unknown>;

const callingAiPostPrompt = "calling.ai.post_prompt";
@summary(callingAiPostPrompt)
@extension("x-fern-display-name", callingAiPostPrompt)
model AiPostPromptEvent is SignalwireEvent<typeof callingAiPostPrompt, AiPostPromptEventData>;

@doc("SWAIG function-call log. The body is caller/engine-defined and delivered as a free-form object.")
model AiSwaigEventData is Record<unknown>;

const callingAiSwaig = "calling.ai.swaig";
@summary(callingAiSwaig)
@extension("x-fern-display-name", callingAiSwaig)
model AiSwaigEvent is SignalwireEvent<typeof callingAiSwaig, AiSwaigEventData>;

@doc("A single SWAIG action item, forwarded verbatim. The body is caller-defined with no fixed schema and delivered as a free-form object.")
model AiSwaigActionEventData is Record<unknown>;

const callingAiSwaigAction = "calling.ai.swaig_action";
@summary(callingAiSwaigAction)
@extension("x-fern-display-name", callingAiSwaigAction)
model AiSwaigActionEvent is SignalwireEvent<typeof callingAiSwaigAction, AiSwaigActionEventData>;

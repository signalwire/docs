import "@signalwire/typespec-asyncapi";
import "../../../../common/frames.tsp";
import "@typespec/openapi";

import "../../../models/core.tsp";

using TypeSpec.OpenAPI;

namespace Relay.Calling;

@summary("AI lifecycle event")
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

// Activity events that fire while an AI session is active.

@summary("AI completion event")
model AiCompletionEventData {
  ...CallEventAddress;

  @doc("The assistant's completed utterance for the turn. Redacted when the app has `redact_prompt` set. Always an empty string on `calling.amazon_bedrock` sessions.")
  @example("Sure — I can help you place an order. Would you like pickup or delivery?")
  text: string;

  @doc("Whether the turn completed normally or was cut short by a barge-in: `barged` when the caller interrupted the assistant, otherwise `normal`. Always `normal` on `calling.amazon_bedrock` sessions.")
  @example("normal")
  type: "normal" | "barged";
}

const callingAiCompletion = "calling.ai.completion";
@summary(callingAiCompletion)
@extension("x-fern-display-name", callingAiCompletion)
model AiCompletionEvent
  is SignalwireEvent<typeof callingAiCompletion, AiCompletionEventData>;

@summary("AI response event")
model AiResponseEventData {
  ...CallEventAddress;

  @doc("The assistant's full response text for the turn. Redacted when the app has `redact_prompt` set.")
  @example("Sure — I can help you place an order. Would you like pickup or delivery?")
  response: string;
}

const callingAiResponseEvent = "calling.ai.response";
@summary(callingAiResponseEvent)
@extension("x-fern-display-name", callingAiResponseEvent)
model AiResponseEvent
  is SignalwireEvent<typeof callingAiResponseEvent, AiResponseEventData>;

@summary("AI response utterance event")
model AiResponseUtteranceEventData {
  ...CallEventAddress;

  @doc("One spoken segment of the assistant's response, emitted as it streams. Redacted when the app has `redact_prompt` set.")
  @example("Would you like pickup or delivery?")
  utterance: string;
}

const callingAiResponseUtterance = "calling.ai.response_utterance";
@summary(callingAiResponseUtterance)
@extension("x-fern-display-name", callingAiResponseUtterance)
model AiResponseUtteranceEvent
  is SignalwireEvent<
    typeof callingAiResponseUtterance,
    AiResponseUtteranceEventData
  >;

@summary("AI speech detect event")
model AiSpeechDetectEventData {
  ...CallEventAddress;

  @doc("The caller's final recognized transcript for the turn. Not sent when the app has `redact_prompt` set, except with a realtime speech-to-speech model or on `calling.amazon_bedrock`.")
  @example("I'd like to order a large pepperoni pizza for delivery.")
  text: string;
}

const callingAiSpeechDetect = "calling.ai.speech_detect";
@summary(callingAiSpeechDetect)
@extension("x-fern-display-name", callingAiSpeechDetect)
model AiSpeechDetectEvent
  is SignalwireEvent<typeof callingAiSpeechDetect, AiSpeechDetectEventData>;

@summary("AI partial result event")
model AiPartialResultEventData {
  ...CallEventAddress;

  @doc("The caller's interim (partial) speech-recognition transcript. Absent when you use `calling.amazon_bedrock`, where this event fires with an empty body.")
  @example("I'd like to order a large")
  text?: string;

  @doc("Present and `true` only when this partial transcript triggered a barge-in of the assistant's speech.")
  @example(true)
  barged?: boolean;
}

const callingAiPartialResult = "calling.ai.partial_result";
@summary(callingAiPartialResult)
@extension("x-fern-display-name", callingAiPartialResult)
model AiPartialResultEvent
  is SignalwireEvent<typeof callingAiPartialResult, AiPartialResultEventData>;

@summary("AI begin speaking event")
@doc("""
  Signal-only event that carries only the call address. What it marks depends on the
  model: normally, the caller started speaking; with a realtime speech-to-speech
  model such as `gpt-realtime`, the assistant started speaking. On
  `calling.amazon_bedrock` it fires together with the caller's final transcript for
  the turn.
  """)
model AiBeginSpeakingEventData {
  ...CallEventAddress;
}

const callingAiBeginSpeaking = "calling.ai.begin_speaking";
@summary(callingAiBeginSpeaking)
@extension("x-fern-display-name", callingAiBeginSpeaking)
model AiBeginSpeakingEvent
  is SignalwireEvent<typeof callingAiBeginSpeaking, AiBeginSpeakingEventData>;

@summary("AI warning event")
@doc("""
  A non-fatal warning. Two kinds are sent: an oversized system prompt
  (`error: "Excessive System Prompt.\\n"` with `tokens`), and a variable expression
  in the prompt or static greeting that resolved to nothing
  (`error: "unresolved_variable"` with `field` and `expressions`).
  """)
model AiWarningEventData {
  ...CallEventAddress;

  @doc("The warning: `\"Excessive System Prompt.\\n\"` or `\"unresolved_variable\"`.")
  @example("Excessive System Prompt.\n")
  error: string;

  @doc("The prompt token count that triggered the warning. Present on the oversized-prompt warning.")
  @example(78000)
  tokens?: float64;

  @doc("Where the unresolved expressions were found: `prompt` or `static_greeting`. Present on `unresolved_variable` warnings.")
  @example("prompt")
  field?: "prompt" | "static_greeting";

  @doc("The expressions that resolved to nothing. Present on `unresolved_variable` warnings.")
  @example(#["\${global_data.customer_name}"])
  expressions?: string[];
}

const callingAiWarning = "calling.ai.warning";
@summary(callingAiWarning)
@extension("x-fern-display-name", callingAiWarning)
model AiWarningEvent
  is SignalwireEvent<typeof callingAiWarning, AiWarningEventData>;

@summary("AI transparent barge event")
model AiTransparentBargeEventData {
  ...CallEventAddress;

  @doc("""
    The caller's merged turn text after a transparent barge — when the caller interrupts but the
    assistant keeps listening and merges the interruption into the same turn. Present only when
    non-empty.
    """)
  @example("Actually, make that two large pepperoni pizzas.")
  combined_text?: string;

  @doc("""
    Present and `false` when the barge did not rewrite the conversation — for
    example, because the assistant's answer had already been delivered.
    """)
  @example(false)
  context_rewritten?: boolean;
}

const callingAiTransparentBarge = "calling.ai.transparent_barge";
@summary(callingAiTransparentBarge)
@extension("x-fern-display-name", callingAiTransparentBarge)
model AiTransparentBargeEvent
  is SignalwireEvent<
    typeof callingAiTransparentBarge,
    AiTransparentBargeEventData
  >;

@summary("AI stop event")
model AiStopEventData {
  ...CallEventAddress;

  @doc("When the AI session started, as a Unix timestamp in microseconds.")
  @example(1718000000000000)
  start_time: int64;

  @doc("When the AI session ended, as a Unix timestamp in microseconds.")
  @example(1718000123000000)
  end_time: int64;

  @doc("Total seconds that billing was paused during the session. Emitted only when you start the agent with `calling.ai`; absent when you use `calling.amazon_bedrock`.")
  @example(0)
  wallet_paused_sec?: float64;

  @doc("Per-session billing detail. The breakdown under `this_visit` and `cumulative` varies by the resources used, so the exact keys are not fixed.")
  billing?: Record<unknown>;
}

const callingAiStopEvent = "calling.ai.stop";
@summary(callingAiStopEvent)
@extension("x-fern-display-name", callingAiStopEvent)
model AiStopEvent
  is SignalwireEvent<typeof callingAiStopEvent, AiStopEventData>;

@summary("AI post-prompt event")
@doc("End-of-call summary payload. Beyond the call address, the body is caller-defined with no fixed schema; only fires when the app has a `post_prompt_url` set.")
model AiPostPromptEventData {
  ...CallEventAddress;
  ...Record<unknown>;
}

const callingAiPostPrompt = "calling.ai.post_prompt";
@summary(callingAiPostPrompt)
@extension("x-fern-display-name", callingAiPostPrompt)
model AiPostPromptEvent
  is SignalwireEvent<typeof callingAiPostPrompt, AiPostPromptEventData>;

@summary("AI SWAIG event")
@doc("Log of a SWAIG (SignalWire AI Gateway) function call. Beyond the call address, the body is caller-defined with no fixed schema.")
model AiSwaigEventData {
  ...CallEventAddress;
  ...Record<unknown>;
}

const callingAiSwaig = "calling.ai.swaig";
@summary(callingAiSwaig)
@extension("x-fern-display-name", callingAiSwaig)
model AiSwaigEvent is SignalwireEvent<typeof callingAiSwaig, AiSwaigEventData>;

@summary("AI SWAIG action event")
@doc("A single SWAIG action item, forwarded verbatim. Beyond the call address, the body is caller-defined with no fixed schema.")
model AiSwaigActionEventData {
  ...CallEventAddress;
  ...Record<unknown>;
}

const callingAiSwaigAction = "calling.ai.swaig_action";
@summary(callingAiSwaigAction)
@extension("x-fern-display-name", callingAiSwaigAction)
model AiSwaigActionEvent
  is SignalwireEvent<typeof callingAiSwaigAction, AiSwaigActionEventData>;

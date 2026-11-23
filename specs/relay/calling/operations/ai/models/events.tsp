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
@doc("""
  The assistant's full response for a turn. With a standard (non-realtime) model, the event is also
  posted to the agent's `event_webhook_url`, when set, with `event_type` `ai.response`.
  """)
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
@doc("""
  One spoken segment of the assistant's response. With a standard (non-realtime) model, the event
  is also posted to the agent's `event_webhook_url`, when set, with `event_type`
  `ai.response_utterance`.
  """)
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
  @example("My code is F as in Frank 2 9.")
  text: string;

  @doc("""
    The recognizer's own words for the final transcript, in order, each in its punctuated form when
    the recognizer gives one. These are the words as heard, so they need not match `text` word for
    word: hearing hints, transcript formatting, and merged turns change `text` but not `words`.
    Absent when the recognizer gives no words, and with a realtime speech-to-speech model.
    """)
  @example(#[
    #{ word: "My", confidence: 0.99 },
    #{ word: "code", confidence: 0.98 },
    #{ word: "is", confidence: 0.99 },
    #{ word: "F", confidence: 0.76 },
    #{ word: "as", confidence: 0.97 },
    #{ word: "in", confidence: 0.98 },
    #{ word: "Frank", confidence: 0.95 },
    #{ word: "2", confidence: 0.93 },
    #{ word: "9.", confidence: 0.94 }
  ])
  words?: AiSpeechDetectWord[];
}

@summary("AI speech detect word")
@doc("One word of the caller's final transcript, as the speech recognizer heard it.")
model AiSpeechDetectWord {
  @doc("The word, punctuated when the recognizer gives that form.")
  @example("Frank")
  word: string;

  @doc("The recognizer's confidence in the word.")
  @example(0.95)
  confidence: float64;
}

const callingAiSpeechDetect = "calling.ai.speech_detect";
@summary(callingAiSpeechDetect)
@extension("x-fern-display-name", callingAiSpeechDetect)
model AiSpeechDetectEvent
  is SignalwireEvent<typeof callingAiSpeechDetect, AiSpeechDetectEventData>;

@summary("AI partial result event")
model AiPartialResultEventData {
  ...CallEventAddress;

  @doc("The caller's interim (partial) speech-recognition transcript. Absent when the app has `redact_prompt` set, and when you use `calling.amazon_bedrock`, where this event fires with an empty body.")
  @example("I'd like to order a large")
  text?: string;

  @doc("""
    Present and `true` only when this partial transcript cut off the assistant's reply, or
    cancelled the model request for the turn before any of its reply played. Still sent when the
    app has `redact_prompt` set.
    """)
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
@doc("""
  Reports how a transparent barge was handled. Transparent barge lets a caller correct or extend
  what they just said: when their next statement begins within `transparent_barge_max_time` of
  their previous one, the agent's turn in between is discarded and the two statements go to the
  model as one. Each event carries one of two shapes: `combined_text` when the turn was discarded
  and the statements merged, or `context_rewritten: false` when the turn was kept.
  """)
model AiTransparentBargeEventData {
  ...CallEventAddress;

  @doc("""
    The caller's merged statement, each part as said. Present when the agent's turn was discarded
    and the caller's two statements were merged into one.
    """)
  @example("I want to change my order. The one from Tuesday.")
  combined_text?: string;

  @doc("""
    Present and `false` when the agent's turn was kept and the caller's new words became a turn of
    their own: the new statement began at or past the `transparent_barge_max_time` window, or the
    turn ran a function while `barge_functions` was off.
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

  @doc("When the AI session ended, as a Unix timestamp in microseconds. Subtract `start_time` for the session's duration.")
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

@summary("AI response heard event")
@doc("""
  Reports what the caller heard of one of the assistant's replies. It fires as the reply's audio
  stops, once for each reply that made a sound and has words: a model reply, or the greeting,
  including a static, cached, or replayed greeting. Words the model speaks before calling a
  function that doesn't wait for them to play are reported once their audio has finished, or when
  a barge-in flushes them, and carry `approximate: true`.

  When the caller cut the reply off, `text_heard_approx` estimates the words they heard. The
  estimate counts only the reply's own audio, not a filler that played before it, and uses the
  call's speaking rate, measured on each reply that plays to its end. It is cut at the end of a
  word, and is empty when the cut came before any of the reply's own audio.

  Not sent for a reply that made no sound, on a voice that plays through a blocking, non-streamed
  path (Amazon Polly, for example), or on `calling.amazon_bedrock`. When the agent sets
  `event_webhook_url`, the event is also posted there with `event_type` `ai.response_heard`.
  """)
model AiResponseHeardEventData {
  ...CallEventAddress;

  @doc("""
    `true` when the reply's audio was cut off: by the caller barging in, by a flush, by a
    text-to-speech failure, or by the call ending while it played.
    """)
  @example(true)
  barged: boolean;

  @doc("""
    How long the reply played, to the cut or to its end, in milliseconds. Counted from the turn's
    first sound, including a filler that played before the reply. With `approximate: true`, counted
    from those words' own first audio.
    """)
  @example(2140)
  played_ms: int64;

  @doc("""
    What the caller heard: the whole reply when it played to its end, otherwise an estimate of the
    words heard. Masked when the app has `redact_prompt` set, as in the call log.
    """)
  @example("Your order shipped on Tuesday and")
  text_heard_approx: string;

  @doc("""
    The reply as spoken, without language directives or `speech_markup` markup. Masked when the app
    has `redact_prompt` set, as in the call log.
    """)
  @example("Your order shipped on Tuesday and should arrive by Friday. Is there anything else I can help with?")
  text_spoken_total: string;

  @doc("""
    Present and `true` only for words the model spoke before calling a function that doesn't wait
    for them to play.
    """)
  @example(true)
  approximate?: boolean;
}

const callingAiResponseHeard = "calling.ai.response_heard";
@summary(callingAiResponseHeard)
@extension("x-fern-display-name", callingAiResponseHeard)
model AiResponseHeardEvent
  is SignalwireEvent<typeof callingAiResponseHeard, AiResponseHeardEventData>;

@summary("AI manual say event")
@doc("""
  Reports text the platform speaks itself, outside the model's replies, such as a SWAIG `say`
  action, a function's filler, or an error line. It fires once per item, when the item's first
  audio plays. These words are not in `calling.ai.response_utterance` or
  `calling.ai.response_heard`.

  Not sent with a realtime speech-to-speech model, or on a voice that plays through a blocking,
  non-streamed path (Amazon Polly, for example). When the agent sets `event_webhook_url`, the event
  is also posted there with `event_type` `ai.manual_say`.
  """)
model AiManualSayEventData {
  ...CallEventAddress;

  @doc("""
    What was said. Masked when the app has `redact_prompt` set; markup removed when
    `speech_markup` is on.
    """)
  @example("Bear with me, I need to rethink that.")
  text: string;

  @doc("""
    Where the text came from:

    - `say`: a SWAIG `say` action, or the agent's "Going to sleep." line.
    - `error`: an error line, such as "Bear with me, I need to rethink that."
    - `filler`: a function's or a semantic gate's filler, or anything else the platform queues to
      speak.
    """)
  @example("error")
  source: "say" | "error" | "filler";

  @doc("""
    Why the error line was spoken, for example `invalid_function`. The same reason the call
    timeline's `manual_say` entry records. Present only when `source` is `error`.
    """)
  @example("invalid_function")
  error_reason?: string;
}

const callingAiManualSay = "calling.ai.manual_say";
@summary(callingAiManualSay)
@extension("x-fern-display-name", callingAiManualSay)
model AiManualSayEvent
  is SignalwireEvent<typeof callingAiManualSay, AiManualSayEventData>;

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

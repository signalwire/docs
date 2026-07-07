import "@signalwire/typespec-asyncapi";
import "../../../../common/frames.tsp";
import "../../../events/shared.tsp";
import "@typespec/openapi";

using TypeSpec.OpenAPI;

namespace Relay.Calling;

@summary("Transcribe utterance")
@doc("A single transcribed utterance from a live-transcription session.")
model TranscribeUtterance {
  @doc("Who spoke: `remote-caller` (the far end) or `local-caller` (your side).")
  @example("remote-caller")
  role: string;

  @doc("The transcribed text.")
  @example("Hello, I'd like to check my balance.")
  content: string;

  @doc("The language of the utterance as a BCP-47 language code (e.g. `en`, `es-ES`).")
  @example("en")
  lang: string;

  @doc("Recognition confidence for the utterance, roughly 0.0-1.0.")
  @example(0.94)
  confidence?: float64;
}

@doc("""
  A live-transcription result delivered while the call is still in progress — one
  recognized utterance at a time. Streams to your `webhook` when you start
  `calling.live_transcribe`.
  """)
@summary("Live transcribe utterance event")
model TranscribeUtteranceEventData {
  @doc("Recognition confidence for this utterance, roughly 0.0-1.0.")
  @example(0.94)
  confidence?: float64;

  @doc("The recognized utterance.")
  utterance: TranscribeUtterance;
}

const callingAiTranscribeUtterance = "calling.ai.transcribe.utterance";
@summary(callingAiTranscribeUtterance)
@extension("x-fern-display-name", callingAiTranscribeUtterance)
model TranscribeUtteranceEvent is SignalwireEvent<typeof callingAiTranscribeUtterance, TranscribeUtteranceEventData>;

@doc("""
  An on-demand summary of a `calling.live_transcribe` session so far, produced when you send
  the `summarize` action (or when a sidecar closes). Requires a `webhook` on the session.
  """)
@summary("Live transcribe summarize event")
model TranscribeLiveSummarizeEventData {
  @doc("The conversation so far, one entry per turn.")
  conversation_log: ConversationLogEntry[];

  @doc("An AI-generated summary of the conversation so far.")
  @example("The caller asked to check their balance and confirmed their identity.")
  conversation_summary: string;
}

const callingAiTranscribeLiveSummarize = "calling.ai.transcribe.live_summarize";
@doc("A summary of the transcription so far, emitted for `calling.live_transcribe` when you request the `summarize` action.")
@summary(callingAiTranscribeLiveSummarize)
@extension("x-fern-display-name", callingAiTranscribeLiveSummarize)
model TranscribeLiveSummarizeEvent is SignalwireEvent<typeof callingAiTranscribeLiveSummarize, TranscribeLiveSummarizeEventData>;

@doc("""
  The full conversation log for a `calling.live_transcribe` session, delivered once when the
  session ends. Distinct from `calling.call.transcribe` (the event of the non-live
  `calling.transcribe` method) — this one carries the AI/live transcription conversation.
  """)
@summary("Live transcribe conversation log event")
model TranscribeConversationLogEventData {
  @doc("The full conversation, one entry per turn.")
  conversation_log: ConversationLogEntry[];

  @doc("An AI-generated summary of the full conversation. Present only when the session was started with AI summary enabled.")
  @example("The caller checked their balance and updated their mailing address.")
  conversation_summary?: string;

  @doc("Aggregate metrics for the session.")
  metrics: TranscriptionMetrics;
}

const callingAiTranscribeConversationLog = "calling.ai.transcribe.conversation_log";
@doc("The complete conversation log and metrics for a `calling.live_transcribe` session, emitted once the session ends.")
@summary(callingAiTranscribeConversationLog)
@extension("x-fern-display-name", callingAiTranscribeConversationLog)
model TranscribeConversationLogEvent is SignalwireEvent<typeof callingAiTranscribeConversationLog, TranscribeConversationLogEventData>;

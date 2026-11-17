import "@signalwire/typespec-asyncapi";
import "../../../../common/frames.tsp";
import "../../../models/core.tsp";
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

  @doc("Unique identifier for this utterance, for correlation and de-duplication.")
  @example("f0a9b8c7-d6e5-4a3b-8e2d-1f0a9b8c7d6e")
  utterance_id: string;

  @doc("When the utterance was produced, as a Unix timestamp in microseconds.")
  @example(1712345678123456)
  timestamp: int64;

  @doc("Recognition confidence for the utterance, roughly 0.0-1.0. Omitted when the engine reports none.")
  @example(0.94)
  confidence?: float64;

  @doc("Number of tokens in the utterance.")
  @example(7)
  tokens?: int32;

  @doc("Number of characters in the utterance text.")
  @example(38)
  char_count?: int32;

  @doc("Number of words in the utterance text.")
  @example(7)
  word_count?: int32;

  @doc("Milliseconds since this speaker's previous utterance. Omitted on the speaker's first utterance.")
  @example(850)
  silence_before_ms?: int32;

  @doc("The kind of content filter that matched this utterance, when one did.")
  filter_type?: string;

  @doc("The value the content filter matched, when one did.")
  filter_value?: string;

  @doc("Engine-reported start offset of the utterance, in seconds. Present with `verbose_utterances`.")
  start?: float64;

  @doc("Engine-reported end offset of the utterance, in seconds. Present with `verbose_utterances`.")
  end?: float64;

  @doc("Engine-reported duration of the utterance, in seconds. Present with `verbose_utterances`.")
  duration?: float64;

  @doc("Duration of the utterance, in milliseconds. Present with `verbose_utterances`.")
  duration_ms?: float64;

  @doc("Engine-reported word-level detail (timings, confidence). Present with `verbose_utterances`; the shape is engine-specific.")
  words?: unknown[];

  @doc("Engine-reported alternative transcripts. Present with `verbose_utterances`; the shape is engine-specific.")
  alternatives?: unknown[];

  @doc("Engine request identifier. Present with `verbose_utterances`.")
  request_id?: string;

  @doc("Language detected by the engine. Present with `verbose_utterances`.")
  detected_language?: string;

  @doc("Whether the engine marked this as the end of a spoken phrase. Present with `verbose_utterances`.")
  speech_final?: boolean;

  @doc("Whether the engine marked this result as final. Present with `verbose_utterances`.")
  is_final?: boolean;
}

@doc("""
  A live-transcription result delivered while the call is still in progress — one
  recognized utterance at a time. Sent only when you start
  `calling.live_transcribe` with `live_events` enabled.
  """)
@summary("Live transcribe utterance event")
model TranscribeUtteranceEventData {
  ...CallEventAddress;

  @doc("Recognition confidence for this utterance as reported by the engine, roughly 0.0-1.0. `null` when the engine reports none.")
  @example(0.94)
  confidence: float64 | null;

  @doc("The recognized utterance.")
  utterance: TranscribeUtterance;

  @doc("Call/session context for this delivery.")
  call_info: AiCallInfo;

  @doc("Extended call/channel context for this delivery.")
  channel_data: AiChannelData;
}

const callingAiTranscribeUtterance = "calling.ai.transcribe.utterance";
@doc("Streams a single recognized utterance during a `calling.live_transcribe` session started with `live_events` enabled.")
@summary(callingAiTranscribeUtterance)
@extension("x-fern-display-name", callingAiTranscribeUtterance)
model TranscribeUtteranceEvent
  is SignalwireEvent<
    typeof callingAiTranscribeUtterance,
    TranscribeUtteranceEventData
  >;

@doc("""
  An on-demand summary of a `calling.live_transcribe` session so far, produced when you send
  the `summarize` action (or when an attached AI sidecar closes; see `calling.ai_sidecar`).
  Requires a `webhook` on the session.
  """)
@summary("Live transcribe summarize event")
model TranscribeLiveSummarizeEventData {
  ...CallEventAddress;

  @doc("The conversation so far, one entry per turn.")
  conversation_log: ConversationLogEntry[];

  @doc("An AI-generated summary of the conversation so far.")
  @example("The caller asked to check their balance and confirmed their identity.")
  conversation_summary: string;

  @doc("Call/session context for this delivery.")
  call_info: AiCallInfo;

  @doc("Extended call/channel context for this delivery.")
  channel_data: AiChannelData;
}

const callingAiTranscribeLiveSummarize = "calling.ai.transcribe.live_summarize";
@doc("A summary of the transcription so far, emitted for `calling.live_transcribe` when you request the `summarize` action.")
@summary(callingAiTranscribeLiveSummarize)
@extension("x-fern-display-name", callingAiTranscribeLiveSummarize)
model TranscribeLiveSummarizeEvent
  is SignalwireEvent<
    typeof callingAiTranscribeLiveSummarize,
    TranscribeLiveSummarizeEventData
  >;

@doc("""
  The full conversation log for a `calling.live_transcribe` session, delivered once when the
  session ends. Distinct from `calling.call.transcribe` (the event of the non-live
  `calling.transcribe` method) — this one carries the AI/live transcription conversation.
  """)
@summary("Live transcribe conversation log event")
model TranscribeConversationLogEventData {
  ...CallEventAddress;

  @doc("The full conversation, one entry per turn.")
  conversation_log: ConversationLogEntry[];

  @doc("An AI-generated summary of the full conversation. Present only when the session was started with AI summary enabled.")
  @example("The caller checked their balance and updated their mailing address.")
  conversation_summary?: string;

  @doc("Aggregate metrics for the session.")
  metrics: TranscriptionMetrics;

  @doc("Call/session context for this delivery.")
  call_info: AiCallInfo;

  @doc("Extended call/channel context for this delivery.")
  channel_data: AiChannelData;
}

const callingAiTranscribeConversationLog = "calling.ai.transcribe.conversation_log";
@doc("The complete conversation log and metrics for a `calling.live_transcribe` session, emitted once the session ends.")
@summary(callingAiTranscribeConversationLog)
@extension("x-fern-display-name", callingAiTranscribeConversationLog)
model TranscribeConversationLogEvent
  is SignalwireEvent<
    typeof callingAiTranscribeConversationLog,
    TranscribeConversationLogEventData
  >;

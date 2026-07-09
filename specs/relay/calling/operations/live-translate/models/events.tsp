import "@signalwire/typespec-asyncapi";
import "../../../../common/frames.tsp";
import "../../../models/core.tsp";
import "../../../events/shared.tsp";
import "@typespec/openapi";

using TypeSpec.OpenAPI;

namespace Relay.Calling;

@summary("Translate utterance")
@doc("An incremental translated (or source) text fragment.")
model TranslateUtterance {
  @doc("The language of this fragment as a BCP-47 language code (e.g. `en`, `es-ES`).")
  @example("es")
  language: string;

  @doc("The incremental text for this fragment.")
  @example("Hola, quisiera")
  delta: string;
}

@summary("Per-leg translation settings")
@doc("The translation settings for one call leg, as echoed on the `calling.ai.translate.conversation_log` event.")
model TranslateLegData {
  @doc("The language spoken on this leg, as a language code (e.g. `en-US`).")
  @example("en-US")
  from_language: string;

  @doc("The language this leg is translated into, as a language code (e.g. `es-ES`).")
  @example("es-ES")
  to_language: string;

  @doc("The voice used to speak this leg's translated audio.")
  @example("josh")
  to_voice: string;

  @doc("Which side of the call this entry describes — the same value as its key: `local-caller` (the inbound leg) or `remote-caller` (the outbound leg).")
  @example("local-caller")
  role: "local-caller" | "remote-caller";

  @doc("This leg's position in the translation pair: `primary` or `secondary`.")
  @example("primary")
  position: "primary" | "secondary";

  @doc("The tone/style filter applied to this leg's translation. Present only when a filter was configured.")
  @example("professional")
  translate_filter?: string;
}

@doc("""
  A live-translation delta delivered while the call is in progress. Carries the
  incremental source text (`input_utterance`) and/or the translated text
  (`output_utterance`) as the call proceeds. Realtime delivery of these deltas is
  gated: you must start `calling.live_translate` with `live_events` enabled and a
  `webhook` URL configured — otherwise the incremental deltas are not emitted.
  """)
@summary("Live translate transcript delta event")
model TranslateTranscriptDeltaEventData {
  ...CallEventAddress;

  @doc("Present on source-language (input) fragments.")
  input_utterance?: TranslateUtterance;

  @doc("Present on translated (output) fragments.")
  output_utterance?: TranslateUtterance;

  @doc("Call/session context for this delivery.")
  call_info: AiCallInfo;

  @doc("Extended call/channel context for this delivery.")
  channel_data: AiChannelData;
}

const callingAiTranslateTranscriptDelta = "calling.ai.translate.transcript_delta";
@doc("Streams an incremental translation delta during a `calling.live_translate` session.")
@summary(callingAiTranslateTranscriptDelta)
@extension("x-fern-display-name", callingAiTranslateTranscriptDelta)
model TranslateTranscriptDeltaEvent
  is SignalwireEvent<
    typeof callingAiTranslateTranscriptDelta,
    TranslateTranscriptDeltaEventData
  >;

@doc("""
  A summary of a `calling.live_translate` session, covering both the source-language (`primary`)
  and translated (`secondary`) sides. This event carries two shapes depending on how it was
  produced: in realtime mode (delivered when the session closes) the two `*_conversation_summary`
  fields hold the raw transcript text and no logs are included; in on-demand `summarize` mode the
  `*_conversation_log` arrays are present and the summaries are AI-generated.
  """)
@summary("Live translate summary event")
model TranslateLiveSummaryEventData {
  ...CallEventAddress;

  @doc("The source-language side: raw transcript text in realtime mode, or an AI-generated summary in on-demand `summarize` mode.")
  primary_conversation_summary?: string;

  @doc("The translated side: raw transcript text in realtime mode, or an AI-generated summary in on-demand `summarize` mode.")
  secondary_conversation_summary?: string;

  @doc("The source-language conversation, one entry per turn. Present only in on-demand `summarize` mode.")
  primary_conversation_log?: ConversationLogEntry[];

  @doc("The translated conversation, one entry per turn. Present only in on-demand `summarize` mode.")
  secondary_conversation_log?: ConversationLogEntry[];

  @doc("Call/session context for this delivery.")
  call_info: AiCallInfo;

  @doc("Extended call/channel context for this delivery.")
  channel_data: AiChannelData;
}

const callingAiTranslateLiveSummary = "calling.ai.translate.live_summary";
@doc("A summary of a `calling.live_translate` session, covering both the source and translated sides.")
@summary(callingAiTranslateLiveSummary)
@extension("x-fern-display-name", callingAiTranslateLiveSummary)
model TranslateLiveSummaryEvent
  is SignalwireEvent<
    typeof callingAiTranslateLiveSummary,
    TranslateLiveSummaryEventData
  >;

@doc("The complete conversation log for a `calling.live_translate` session, delivered once the session ends, with both the source-language and translated sides.")
@summary("Live translate conversation log event")
model TranslateConversationLogEventData {
  ...CallEventAddress;

  @doc("The source-language conversation, one entry per turn.")
  primary_conversation_log: ConversationLogEntry[];

  @doc("An AI-generated summary of the source-language side. Present only when the session was started with AI summary enabled.")
  primary_conversation_summary?: string;

  @doc("The translated conversation, one entry per turn.")
  secondary_conversation_log: ConversationLogEntry[];

  @doc("An AI-generated summary of the translated side. Present only when the session was started with AI summary enabled.")
  secondary_conversation_summary?: string;

  @doc("Per-leg translation settings, keyed by leg role (`local-caller` = the inbound leg, `remote-caller` = the outbound leg).")
  translate_data: Record<TranslateLegData>;

  @doc("Call/session context for this delivery.")
  call_info: AiCallInfo;

  @doc("Extended call/channel context for this delivery.")
  channel_data: AiChannelData;
}

const callingAiTranslateConversationLog = "calling.ai.translate.conversation_log";
@doc("The complete conversation log for a `calling.live_translate` session — both the source-language and translated sides — emitted once the session ends.")
@summary(callingAiTranslateConversationLog)
@extension("x-fern-display-name", callingAiTranslateConversationLog)
model TranslateConversationLogEvent
  is SignalwireEvent<
    typeof callingAiTranslateConversationLog,
    TranslateConversationLogEventData
  >;

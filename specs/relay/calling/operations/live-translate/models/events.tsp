import "@signalwire/typespec-asyncapi";
import "../../../../common/frames.tsp";
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

@doc("""
  A live-translation delta delivered while the call is in progress. Carries the
  incremental source text (`input_utterance`) and/or the translated text
  (`output_utterance`) as the call proceeds. Streams to your `webhook` when you
  start `calling.live_translate`.
  """)
@summary("Live translate transcript delta event")
model TranslateTranscriptDeltaEventData {
  @doc("Present on source-language (input) fragments.")
  input_utterance?: TranslateUtterance;

  @doc("Present on translated (output) fragments.")
  output_utterance?: TranslateUtterance;
}

const callingAiTranslateTranscriptDelta = "calling.ai.translate.transcript_delta";
@summary(callingAiTranslateTranscriptDelta)
@extension("x-fern-display-name", callingAiTranslateTranscriptDelta)
model TranslateTranscriptDeltaEvent is SignalwireEvent<typeof callingAiTranslateTranscriptDelta, TranslateTranscriptDeltaEventData>;

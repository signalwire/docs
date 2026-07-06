import "@signalwire/typespec-asyncapi";
import "../../../../common/frames.tsp";
import "@typespec/openapi";

using TypeSpec.OpenAPI;

namespace Relay.Calling;

@doc("A single transcribed utterance from a live-transcription session.")
model TranscribeUtterance {
  @doc("Who spoke: `remote-caller` (the far end) or `local-caller` (your side).")
  @example("remote-caller")
  role: string;

  @doc("The transcribed text.")
  @example("Hello, I'd like to check my balance.")
  content: string;

  @doc("The language of the utterance, as an engine/BCP-47 code.")
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

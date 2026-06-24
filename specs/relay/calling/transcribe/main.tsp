import "@signalwire/typespec-asyncapi";

import "./models/requests.tsp";
import "./models/responses.tsp";
import "../events/transcribe.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

/**
 * Starts transcribing speech on a call to text. SignalWire records the call audio
 * and transcribes it in the background. Transcription results are not returned
 * here — they arrive as `calling.call.transcribe` events keyed on your `control_id`.
 * Only one transcription can run on a call at a time; starting another while one
 * is active returns `"409"` "Transcribe is already in progress". Stop it with
 * `calling.transcribe.stop`.
 */
@channel("calling.transcribe")
@summary("Start transcribing a call")
@opExample(#{
  parameters: #{
    node_id: "a3e1b2c4-...",
    call_id: "c7f9d2e1-...",
    control_id: "transcribe-1",
    status_url: "https://example.com/transcribe-callback",
  },
  returnType: #{ code: "200", message: "Transcribing", url: "recordings/<UUID>.wav" },
})
op transcribe(...TranscribeParams): TranscribeResult | CallTranscribeEvent;

/** Stops a transcription that is currently running on a call. */
@channel("calling.transcribe.stop")
@summary("Stop an active call transcription")
@opExample(#{
  parameters: #{ node_id: "a3e1b2c4-...", call_id: "c7f9d2e1-...", control_id: "transcribe-1" },
  returnType: #{ code: "200", message: "Stopping transcribe" },
})
op transcribeStop(...TranscribeStopParams): TranscribeStopResult;

import "@signalwire/typespec-asyncapi";
import "../../../common/frames.tsp";
import "@typespec/openapi";

import "./models/requests.tsp";
import "./models/responses.tsp";
import "../../events/transcribe.tsp";

using SignalWire.AsyncAPI;
using TypeSpec.OpenAPI;

namespace Relay.Calling;

const callingTranscribe = "calling.transcribe";
const callingTranscribeResponse = "${callingTranscribe} response";

model TranscribeRequest is JsonRpcRequest<typeof callingTranscribe, TranscribeParams>;
@extension("x-fern-display-name", callingTranscribeResponse)
@reply model TranscribeReply is JsonRpcResponse<TranscribeResult>;

@doc("""
  Starts transcribing speech on a call to text. SignalWire records the call audio
  and transcribes it in the background. Transcription results are not returned
  here — they arrive as `calling.call.transcribe` events keyed on your `control_id`.
  Only one transcription can run on a call at a time; starting another while one
  is active returns `"409"` "Transcribe is already in progress". Stop it with
  `calling.transcribe.stop`.
  """)
@channel(callingTranscribe)
@summary("Start transcribing a call")
@extension("x-fern-display-name", callingTranscribe)
op transcribe(...TranscribeRequest): TranscribeReply | CallTranscribeEvent;

const callingTranscribeStop = "calling.transcribe.stop";
const callingTranscribeStopResponse = "${callingTranscribeStop} response";

model TranscribeStopRequest is JsonRpcRequest<typeof callingTranscribeStop, TranscribeStopParams>;
@extension("x-fern-display-name", callingTranscribeStopResponse)
@reply model TranscribeStopReply is JsonRpcResponse<TranscribeStopResult>;

@doc("Stops a transcription that is currently running on a call.")
@channel(callingTranscribeStop)
@summary("Stop an active call transcription")
@extension("x-fern-display-name", callingTranscribeStop)
op transcribeStop(...TranscribeStopRequest): TranscribeStopReply;

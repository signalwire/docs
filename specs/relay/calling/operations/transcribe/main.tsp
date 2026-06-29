import "@signalwire/typespec-asyncapi";

import "./models/requests.tsp";
import "./models/responses.tsp";
import "../../events/transcribe.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model TranscribeRequest is JsonRpcRequest<"calling.transcribe", TranscribeParams>;
@reply model TranscribeReply is JsonRpcResponse<TranscribeResult>;

@doc("""
  Starts transcribing speech on a call to text. SignalWire records the call audio
  and transcribes it in the background. Transcription results are not returned
  here — they arrive as `calling.call.transcribe` events keyed on your `control_id`.
  Only one transcription can run on a call at a time; starting another while one
  is active returns `"409"` "Transcribe is already in progress". Stop it with
  `calling.transcribe.stop`.
  """)
@channel("calling.transcribe")
@summary("Start transcribing a call")
op transcribe(...TranscribeRequest): TranscribeReply | CallTranscribeEvent;

model TranscribeStopRequest is JsonRpcRequest<"calling.transcribe.stop", TranscribeStopParams>;
@reply model TranscribeStopReply is JsonRpcResponse<TranscribeStopResult>;

@doc("Stops a transcription that is currently running on a call.")
@channel("calling.transcribe.stop")
@summary("Stop an active call transcription")
op transcribeStop(...TranscribeStopRequest): TranscribeStopReply;

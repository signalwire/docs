import "@signalwire/typespec-asyncapi";
import "../../../common/frames.tsp";
import "@typespec/openapi";

import "./models/send.tsp";
import "./models/reply.tsp";
import "./models/events.tsp";

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
  and transcribes it in the background. The `calling.call.transcribe` events (keyed
  on your `control_id`) report only lifecycle state and the recording's metadata
  (location, duration, size, timestamps) — the transcript text itself is delivered
  to the `status_url` webhook you provide, not returned on this channel. For
  real-time streaming transcripts, use `calling.live_transcribe` instead.

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

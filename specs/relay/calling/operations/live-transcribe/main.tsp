import "@signalwire/typespec-asyncapi";
import "../../../common/frames.tsp";
import "@typespec/openapi";

import "./models/send.tsp";
import "./models/reply.tsp";
import "./models/events.tsp";

using SignalWire.AsyncAPI;
using TypeSpec.OpenAPI;

namespace Relay.Calling;

const callingLiveTranscribe = "calling.live_transcribe";
const callingLiveTranscribeResponse = "${callingLiveTranscribe} response";

model LiveTranscribeRequest
  is JsonRpcRequest<typeof callingLiveTranscribe, LiveTranscribeParams>;

@extension("x-fern-display-name", callingLiveTranscribeResponse)
@reply
model LiveTranscribeReply is JsonRpcResponse<LiveTranscribeResult>;

@doc("""
  Transcribes a call to text in real time, optionally on both legs at once. Unlike
  `calling.transcribe`, results stream live to your `webhook` while the call is
  still in progress, and you can request an AI summary at the end. Use the same
  method to start, stop, or summarize by setting the matching `action`.
  """)
@channel(callingLiveTranscribe)
@summary("Start, stop, or summarize live transcription on a call")
@extension("x-fern-display-name", callingLiveTranscribe)
op liveTranscribe(...LiveTranscribeRequest):
  | LiveTranscribeReply
  | TranscribeUtteranceEvent
  | TranscribeLiveSummarizeEvent
  | TranscribeConversationLogEvent;

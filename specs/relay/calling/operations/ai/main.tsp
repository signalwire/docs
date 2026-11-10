import "@signalwire/typespec-asyncapi";
import "../../../common/frames.tsp";
import "@typespec/openapi";

import "./models/send.tsp";
import "./models/reply.tsp";
import "./models/events.tsp";

using SignalWire.AsyncAPI;
using TypeSpec.OpenAPI;

namespace Relay.Calling;

const callingAi = "calling.ai";
const callingAiResponse = "${callingAi} response";

model AiRequest is JsonRpcRequest<typeof callingAi, AiParams>;

@extension("x-fern-display-name", callingAiResponse)
@reply
model AiReply is JsonRpcResponse<AiResult>;

@doc("""
  Start an AI agent on the call. This is a blocking operation: while the session
  runs, other blocking operations like `connect` or `play_and_collect` cannot
  start, and control returns when the session ends. Events continue to flow while
  the session is active.

  A `project_id` key anywhere in the params (for example inside `global_data` or a
  SWAIG function definition) is refused with a JSON-RPC error `-32602`, and the
  request is not processed.
  """)
@channel(callingAi)
@summary("Start an AI agent on the call")
@extension("x-fern-display-name", callingAi)
op ai(...AiRequest):
  | AiReply
  | CallAiEvent
  | AiCompletionEvent
  | AiResponseEvent
  | AiResponseUtteranceEvent
  | AiSpeechDetectEvent
  | AiPartialResultEvent
  | AiBeginSpeakingEvent
  | AiWarningEvent
  | AiTransparentBargeEvent
  | AiStopEvent
  | AiPostPromptEvent
  | AiSwaigEvent
  | AiSwaigActionEvent;

const callingAiStop = "calling.ai.stop";
const callingAiStopResponse = "${callingAiStop} response";

model AiStopRequest is JsonRpcRequest<typeof callingAiStop, AiStopParams>;

@extension("x-fern-display-name", callingAiStopResponse)
@reply
model AiStopReply is JsonRpcResponse<AiStopResult>;

@doc("Stop the AI agent session running on the call.")
@channel(callingAiStop)
@summary("Stop an active AI agent session")
@extension("x-fern-display-name", callingAiStop)
op aiStop(...AiStopRequest): AiStopReply;

import "@signalwire/typespec-asyncapi";

import "./models/requests.tsp";
import "./models/responses.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model AiRequest is JsonRpcRequest<"calling.ai", AiParams>;
@reply model AiReply is JsonRpcResponse<AiResult>;

@doc("""
  Start an AI agent on the call. Blocking — acquires a block (preventing other
  blocking operations like `connect` or `play_and_collect`) and runs the AI
  session; the block is released when the session ends. Events continue to flow
  while the session is active.
  """)
@channel("calling.ai")
@summary("Start an AI agent on the call")
op ai(...AiRequest): AiReply;

model AiStopRequest is JsonRpcRequest<"calling.ai.stop", AiStopParams>;
@reply model AiStopReply is JsonRpcResponse<AiStopResult>;

@doc("(async-safe) Stop an active AI agent session on the call.")
@channel("calling.ai.stop")
@summary("Stop an active AI agent session")
op aiStop(...AiStopRequest): AiStopReply;

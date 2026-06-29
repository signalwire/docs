import "@signalwire/typespec-asyncapi";

import "./models/requests.tsp";
import "./models/responses.tsp";
import "../../events/ai-sidecar.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model AiSidecarRequest is JsonRpcRequest<"calling.ai_sidecar", AiSidecarParams>;
@reply model AiSidecarReply is JsonRpcResponse<AiSidecarResult>;

@doc("""
  Attach a real-time AI observer (sidecar) to an answered call, or — when
  `action.summarize` is present — generate a one-off conversation summary instead
  of attaching a sidecar. Requires an active `live_transcribe`.
  """)
@channel("calling.ai_sidecar")
@summary("Attach a real-time AI observer (sidecar) to the call")
op aiSidecar(...AiSidecarRequest): AiSidecarReply | AiSidecarEvent;

model AiSidecarPokeRequest is JsonRpcRequest<"calling.ai_sidecar.poke", AiSidecarPokeParams>;
@reply model AiSidecarPokeReply is JsonRpcResponse<AiSidecarResult>;

@doc("""
  (async-safe) Send a message to the sidecar and prompt it to respond right away,
  without waiting for the next customer turn.
  """)
@channel("calling.ai_sidecar.poke")
@summary("Poke the sidecar to respond immediately")
op aiSidecarPoke(...AiSidecarPokeRequest): AiSidecarPokeReply;

model AiSidecarAskRequest is JsonRpcRequest<"calling.ai_sidecar.ask", AiSidecarAskParams>;
@reply model AiSidecarAskReply is JsonRpcResponse<AiSidecarAskResult>;

@doc("""
  (async-safe) Ask the sidecar a one-off question without affecting the live
  conversation. Returns an `ask_id` immediately; the answer is delivered later as a
  `calling.ai.sidecar` event (`type: ask_answer`) with the matching `ask_id`.
  """)
@channel("calling.ai_sidecar.ask")
@summary("Ask the sidecar a one-off question")
op aiSidecarAsk(...AiSidecarAskRequest): AiSidecarAskReply;

model AiSidecarStopRequest is JsonRpcRequest<"calling.ai_sidecar.stop", AiSidecarStopParams>;
@reply model AiSidecarStopReply is JsonRpcResponse<AiSidecarResult>;

@doc("(async-safe) Stop and detach the AI sidecar from the call.")
@channel("calling.ai_sidecar.stop")
@summary("Stop and detach the AI sidecar")
op aiSidecarStop(...AiSidecarStopRequest): AiSidecarStopReply;

model AiSidecarStatusRequest is JsonRpcRequest<"calling.ai_sidecar.status", AiSidecarStatusParams>;
@reply model AiSidecarStatusReply is JsonRpcResponse<AiSidecarStatusResult>;

@doc("(async-safe) Get a snapshot of the sidecar's activity counters.")
@channel("calling.ai_sidecar.status")
@summary("Get a snapshot of the sidecar's activity counters")
op aiSidecarStatus(...AiSidecarStatusRequest): AiSidecarStatusReply;

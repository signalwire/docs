import "@signalwire/typespec-asyncapi";
import "../../../common/frames.tsp";
import "@typespec/openapi";

import "./models/send.tsp";
import "./models/reply.tsp";
import "./models/events.tsp";

using SignalWire.AsyncAPI;
using TypeSpec.OpenAPI;

namespace Relay.Calling;

const callingAiSidecar = "calling.ai_sidecar";
const callingAiSidecarResponse = "${callingAiSidecar} response";

model AiSidecarRequest is JsonRpcRequest<typeof callingAiSidecar, AiSidecarParams>;

@extension("x-fern-display-name", callingAiSidecarResponse)
@reply model AiSidecarReply is JsonRpcResponse<AiSidecarResult>;

@doc("""
  Attach a real-time AI observer (sidecar) to an answered call, or — when
  `action.summarize` is present — generate a one-off conversation summary instead
  of attaching a sidecar. Requires an active `live_transcribe`.
  """)
@channel(callingAiSidecar)
@summary("Attach a real-time AI observer (sidecar) to the call")
@extension("x-fern-display-name", callingAiSidecar)
@extension("x-fern-sdk-group-name", GroupSidecarBase)
op aiSidecar(...AiSidecarRequest): AiSidecarReply | AiSidecarEvent;

const callingAiSidecarPoke = "calling.ai_sidecar.poke";
const callingAiSidecarPokeResponse = "${callingAiSidecarPoke} response";

model AiSidecarPokeRequest is JsonRpcRequest<typeof callingAiSidecarPoke, AiSidecarPokeParams>;

@extension("x-fern-display-name", callingAiSidecarPokeResponse)
@reply model AiSidecarPokeReply is JsonRpcResponse<AiSidecarResult>;

@doc("""
  (async-safe) Send a message to the sidecar and prompt it to respond right away,
  without waiting for the next customer turn.
  """)
@channel(callingAiSidecarPoke)
@summary("Poke the sidecar to respond immediately")
@extension("x-fern-display-name", callingAiSidecarPoke)
@extension("x-fern-sdk-group-name", GroupSidecarPoke)
op aiSidecarPoke(...AiSidecarPokeRequest): AiSidecarPokeReply;

const callingAiSidecarAsk = "calling.ai_sidecar.ask";
const callingAiSidecarAskResponse = "${callingAiSidecarAsk} response";

model AiSidecarAskRequest is JsonRpcRequest<typeof callingAiSidecarAsk, AiSidecarAskParams>;

@extension("x-fern-display-name", callingAiSidecarAskResponse)
@reply model AiSidecarAskReply is JsonRpcResponse<AiSidecarAskResult>;

@doc("""
  (async-safe) Ask the sidecar a one-off question without affecting the live
  conversation. Returns an `ask_id` immediately; the answer is delivered later as a
  `calling.ai.sidecar` event (`type: ask_answer`) with the matching `ask_id`.
  """)
@channel(callingAiSidecarAsk)
@summary("Ask the sidecar a one-off question")
@extension("x-fern-display-name", callingAiSidecarAsk)
@extension("x-fern-sdk-group-name", GroupSidecarAsk)
op aiSidecarAsk(...AiSidecarAskRequest): AiSidecarAskReply;

const callingAiSidecarStop = "calling.ai_sidecar.stop";
const callingAiSidecarStopResponse = "${callingAiSidecarStop} response";

model AiSidecarStopRequest is JsonRpcRequest<typeof callingAiSidecarStop, AiSidecarStopParams>;

@extension("x-fern-display-name", callingAiSidecarStopResponse)
@reply model AiSidecarStopReply is JsonRpcResponse<AiSidecarResult>;

@doc("(async-safe) Stop and detach the AI sidecar from the call.")
@channel(callingAiSidecarStop)
@summary("Stop and detach the AI sidecar")
@extension("x-fern-display-name", callingAiSidecarStop)
@extension("x-fern-sdk-group-name", GroupSidecarStop)
op aiSidecarStop(...AiSidecarStopRequest): AiSidecarStopReply;

const callingAiSidecarStatus = "calling.ai_sidecar.status";
const callingAiSidecarStatusResponse = "${callingAiSidecarStatus} response";

model AiSidecarStatusRequest is JsonRpcRequest<typeof callingAiSidecarStatus, AiSidecarStatusParams>;

@extension("x-fern-display-name", callingAiSidecarStatusResponse)
@reply model AiSidecarStatusReply is JsonRpcResponse<AiSidecarStatusResult>;

@doc("(async-safe) Get a snapshot of the sidecar's activity counters.")
@channel(callingAiSidecarStatus)
@summary("Get a snapshot of the sidecar's activity counters")
@extension("x-fern-display-name", callingAiSidecarStatus)
@extension("x-fern-sdk-group-name", GroupSidecarStatus)
op aiSidecarStatus(...AiSidecarStatusRequest): AiSidecarStatusReply;

import "@signalwire/typespec-asyncapi";
import "../../../common/frames.tsp";
import "@typespec/openapi";

import "./models/send.tsp";
import "./models/reply.tsp";

using SignalWire.AsyncAPI;
using TypeSpec.OpenAPI;

namespace Relay.Calling;

const callingAiAdjust = "calling.ai_adjust";
const callingAiAdjustResponse = "${callingAiAdjust} response";

model AiAdjustRequest is JsonRpcRequest<typeof callingAiAdjust, AiAdjustParams>;

@extension("x-fern-display-name", callingAiAdjustResponse)
@reply model AiAdjustReply is JsonRpcResponse<AiAdjustResult>;

@doc("""
  Change timing settings of the AI agent running on the call, without pausing it.
  Every value is validated before any is applied: one invalid value rejects the
  whole request and nothing changes.

  A `project_id` key anywhere in the params is refused with a JSON-RPC error
  `-32602`, and the request is not processed.
  """)
@channel(callingAiAdjust)
@summary("Adjust a running AI agent's settings")
@extension("x-fern-display-name", callingAiAdjust)
op aiAdjust(...AiAdjustRequest): AiAdjustReply;

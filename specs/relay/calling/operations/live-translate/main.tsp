import "@signalwire/typespec-asyncapi";
import "../../../common/frames.tsp";
import "@typespec/openapi";

import "./models/requests.tsp";
import "./models/responses.tsp";

using SignalWire.AsyncAPI;
using TypeSpec.OpenAPI;

namespace Relay.Calling;

const callingLiveTranslate = "calling.live_translate";
const callingLiveTranslateResponse = "${callingLiveTranslate} response";

model LiveTranslateRequest is JsonRpcRequest<typeof callingLiveTranslate, LiveTranslateParams>;

@extension("x-fern-display-name", callingLiveTranslateResponse)
@reply model LiveTranslateReply is JsonRpcResponse<LiveTranslateResult>;

@doc("""
  Translates speech on a call into another language in real time and speaks it back,
  so two parties can talk across a language barrier. Translation streams live to your
  `webhook` and is voiced into the call. Use the same method to start, stop, summarize,
  or inject a message by setting the matching `action`.
  """)
@channel(callingLiveTranslate)
@summary("Start or stop live translation on a call")
@extension("x-fern-display-name", callingLiveTranslate)
op liveTranslate(...LiveTranslateRequest): LiveTranslateReply;

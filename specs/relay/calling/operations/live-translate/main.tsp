import "@signalwire/typespec-asyncapi";

import "./models/requests.tsp";
import "./models/responses.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model LiveTranslateRequest is JsonRpcRequest<"calling.live_translate", LiveTranslateParams>;
@reply model LiveTranslateReply is JsonRpcResponse<LiveTranslateResult>;

@doc("""
  Translates speech on a call into another language in real time and speaks it back,
  so two parties can talk across a language barrier. Translation streams live to your
  `webhook` and is voiced into the call. Use the same method to start, stop, summarize,
  or inject a message by setting the matching `action`.
  """)
@channel("calling.live_translate")
@summary("Start or stop live translation on a call")
op liveTranslate(...LiveTranslateRequest): LiveTranslateReply;

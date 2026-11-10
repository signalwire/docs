import "@signalwire/typespec-asyncapi";
import "../../../common/frames.tsp";
import "@typespec/openapi";

import "./models/send.tsp";
import "./models/reply.tsp";

using SignalWire.AsyncAPI;
using TypeSpec.OpenAPI;

namespace Relay.Calling;

const callingRing = "calling.ring";
const callingRingResponse = "${callingRing} response";

model RingRequest is JsonRpcRequest<typeof callingRing, RingParams>;

@extension("x-fern-display-name", callingRingResponse)
@reply model RingReply is JsonRpcResponse<RingResult>;

@doc("""
  Tells the caller on an inbound call that the call is ringing, without answering it.
  Use it to give the caller ringing feedback while your application decides what to do
  with the call. No audio flows until you answer.

  Fails with `"409"` if the call is outbound, already answered, already in early media,
  or has ended. On WebRTC calls ringing does not apply: the request succeeds with the
  message `"Ring not applicable to this type of call"` and nothing is sent. If you ring a
  call and then never answer it or start any other work on it, SignalWire eventually
  ends it as unanswered.
  """)
@channel(callingRing)
@summary("Signal ringing on an inbound call")
@extension("x-fern-display-name", callingRing)
op ring(...RingRequest): RingReply;

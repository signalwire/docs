import "@signalwire/typespec-asyncapi";
import "../../../common/frames.tsp";
import "@typespec/openapi";

import "./models/requests.tsp";
import "./models/responses.tsp";
import "../../events/collect.tsp";

using SignalWire.AsyncAPI;
using TypeSpec.OpenAPI;

namespace Relay.Calling;

const callingCollect = "calling.collect";
const callingCollectResponse = "${callingCollect} response";

model CollectRequest is JsonRpcRequest<typeof callingCollect, CollectParams>;

@extension("x-fern-display-name", callingCollectResponse)
@reply model CollectReply is JsonRpcResponse<CollectResult>;

@doc("""
  Collects DTMF key presses, spoken input, or both from a caller on an active
  call. Use it to gather menu selections, account numbers, or short voice
  responses. The immediate response only confirms that collection started;
  the collected input arrives asynchronously in `calling.call.collect` events
  keyed on your `control_id`.
  """)
@channel(callingCollect)
@summary("Collect digits and/or speech from a call")
@extension("x-fern-display-name", callingCollect)
op collect(...CollectRequest): CollectReply | CallCollectEvent;

const callingCollectStop = "calling.collect.stop";
const callingCollectStopResponse = "${callingCollectStop} response";

model CollectStopRequest is JsonRpcRequest<typeof callingCollectStop, CollectStopParams>;

@extension("x-fern-display-name", callingCollectStopResponse)
@reply model CollectStopReply is JsonRpcResponse<CollectStopResult>;

@doc("Stops a running collect before it finishes on its own, for example when you no longer need the caller's input.")
@channel(callingCollectStop)
@summary("Stop an active collect")
@extension("x-fern-display-name", callingCollectStop)
op collectStop(...CollectStopRequest): CollectStopReply;

const callingCollectStartInputTimers = "calling.collect.start_input_timers";
const callingCollectStartInputTimersResponse = "${callingCollectStartInputTimers} response";

model CollectStartInputTimersRequest is JsonRpcRequest<typeof callingCollectStartInputTimers, CollectStartInputTimersParams>;

@extension("x-fern-display-name", callingCollectStartInputTimersResponse)
@reply model CollectStartInputTimersReply is JsonRpcResponse<CollectStartInputTimersResult>;

@doc("""
  Starts the `initial_timeout` countdown on a collect that was started with
  `start_input_timers: false`. Use it to begin the wait for input on your own
  schedule — for example, only after you have finished playing a prompt.
  """)
@channel(callingCollectStartInputTimers)
@summary("Start the initial-timeout timer on a collect")
@extension("x-fern-display-name", callingCollectStartInputTimers)
op collectStartInputTimers(...CollectStartInputTimersRequest): CollectStartInputTimersReply;

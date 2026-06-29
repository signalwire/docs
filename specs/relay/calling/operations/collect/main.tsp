import "@signalwire/typespec-asyncapi";

import "./models/requests.tsp";
import "./models/responses.tsp";
import "../../events/collect.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model CollectRequest is JsonRpcRequest<"calling.collect", CollectParams>;
@reply model CollectReply is JsonRpcResponse<CollectResult>;

@doc("""
  Collects DTMF key presses, spoken input, or both from a caller on an active
  call. Use it to gather menu selections, account numbers, or short voice
  responses. The immediate response only confirms that collection started;
  the collected input arrives asynchronously in `calling.call.collect` events
  keyed on your `control_id`.
  """)
@channel("calling.collect")
@summary("Collect digits and/or speech from a call")
op collect(...CollectRequest): CollectReply | CallCollectEvent;

model CollectStopRequest is JsonRpcRequest<"calling.collect.stop", CollectStopParams>;
@reply model CollectStopReply is JsonRpcResponse<CollectStopResult>;

@doc("Stops a running collect before it finishes on its own, for example when you no longer need the caller's input.")
@channel("calling.collect.stop")
@summary("Stop an active collect")
op collectStop(...CollectStopRequest): CollectStopReply;

model CollectStartInputTimersRequest is JsonRpcRequest<"calling.collect.start_input_timers", CollectStartInputTimersParams>;
@reply model CollectStartInputTimersReply is JsonRpcResponse<CollectStartInputTimersResult>;

@doc("""
  Starts the `initial_timeout` countdown on a collect that was started with
  `start_input_timers: false`. Use it to begin the wait for input on your own
  schedule — for example, only after you have finished playing a prompt.
  """)
@channel("calling.collect.start_input_timers")
@summary("Start the initial-timeout timer on a collect")
op collectStartInputTimers(...CollectStartInputTimersRequest): CollectStartInputTimersReply;

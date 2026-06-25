import "@signalwire/typespec-asyncapi";

import "./models/requests.tsp";
import "./models/responses.tsp";
import "../../events/collect.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@doc("""
  Collects DTMF key presses, spoken input, or both from a caller on an active
  call. Use it to gather menu selections, account numbers, or short voice
  responses. The immediate response only confirms that collection started;
  the collected input arrives asynchronously in `calling.call.collect` events
  keyed on your `control_id`.
  """)
@channel("calling.collect")
@summary("Collect digits and/or speech from a call")
@opExample(#{
  parameters: #{
    node_id: "a3e1b2c4-...",
    call_id: "c7f9d2e1-...",
    control_id: "collect-1",
    initial_timeout: 5.0,
    partial_results: false,
    continuous: false,
    send_start_of_input: true,
    start_input_timers: false,
    digits: #{ max: 4, terminators: "#*", digit_timeout: 1.0 },
    speech: #{
      end_silence_timeout: 1.0,
      speech_timeout: 5.0,
      language: "en-US",
      hints: #["sales", "support", "representative"],
    },
  },
  returnType: #{ code: "200", message: "Collecting", control_id: "collect-1" },
})
op collect(...CollectParams): CollectResult | CallCollectEvent;

@doc("Stops a running collect before it finishes on its own, for example when you no longer need the caller's input.")
@channel("calling.collect.stop")
@summary("Stop an active collect")
@opExample(#{
  parameters: #{ node_id: "a3e1b2c4-...", call_id: "c7f9d2e1-...", control_id: "collect-1" },
  returnType: #{ code: "200", message: "Stopping collect" },
})
op collectStop(...CollectStopParams): CollectStopResult;

@doc("""
  Starts the `initial_timeout` countdown on a collect that was started with
  `start_input_timers: false`. Use it to begin the wait for input on your own
  schedule — for example, only after you have finished playing a prompt.
  """)
@channel("calling.collect.start_input_timers")
@summary("Start the initial-timeout timer on a collect")
@opExample(#{
  parameters: #{ node_id: "a3e1b2c4-...", call_id: "c7f9d2e1-...", control_id: "collect-1" },
  returnType: #{ code: "200", message: "Starting input timers" },
})
op collectStartInputTimers(...CollectStartInputTimersParams): CollectStartInputTimersResult;

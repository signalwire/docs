import "@signalwire/typespec-asyncapi";

import "./models/requests.tsp";
import "./models/responses.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@doc("Runs a call method automatically when the caller presses a specific DTMF digit sequence — for example, play a message when they press `*1`.")
@channel("calling.bind_digit")
@summary("Trigger a call method when a DTMF sequence is pressed")
@opExample(#{
  parameters: #{
    node_id: "a3e1b2c4-...",
    call_id: "c7f9d2e1-...",
    digits: "*1",
    bind_method: "calling.play",
    params: #{ play: #[#{ type: "tts", text: "You pressed star one" }] },
    realm: "menu",
    max_triggers: 0,
  },
  returnType: #{ code: "200", message: "Digit binding created" },
})
op bindDigit(...BindDigitParams): BindDigitResult;

@doc("Removes digit bindings previously set with `calling.bind_digit`. Clears every binding on the call, or only those in a given `realm`.")
@channel("calling.clear_digit_bindings")
@summary("Clear digit bindings")
@opExample(#{
  parameters: #{ node_id: "a3e1b2c4-...", call_id: "c7f9d2e1-...", realm: "menu" },
  returnType: #{ code: "200", message: "Digit bindings cleared", cleared: 2 },
})
op clearDigitBindings(...ClearDigitBindingsParams): ClearDigitBindingsResult;

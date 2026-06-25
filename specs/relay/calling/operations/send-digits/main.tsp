import "@signalwire/typespec-asyncapi";

import "./models/requests.tsp";
import "./models/responses.tsp";
import "../../events/send-digits.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@doc("Plays a sequence of DTMF tones on a call, as if a caller pressed those keys. Use this to navigate IVR menus or send key presses to the far end. The string accepts digits, `*`, `#`, `A`-`D`, and `w`/`W` for pauses.")
@channel("calling.send_digits")
@summary("Send DTMF digit tones to a call")
@opExample(#{
  parameters: #{
    node_id: "a3e1b2c4-...",
    call_id: "c7f9d2e1-...",
    control_id: "send-digits-1",
    digits: "wW1234567890*#ABCD",
  },
  returnType: #{
    code: "200",
    message: "Sending",
    control_id: "send-digits-1",
    call_id: "c7f9d2e1-...",
  },
})
op sendDigits(...SendDigitsParams): SendDigitsResult | CallSendDigitsEvent;

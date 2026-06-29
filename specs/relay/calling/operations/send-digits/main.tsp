import "@signalwire/typespec-asyncapi";

import "./models/requests.tsp";
import "./models/responses.tsp";
import "../../events/send-digits.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model SendDigitsRequest is JsonRpcRequest<"calling.send_digits", SendDigitsParams>;
@reply model SendDigitsReply is JsonRpcResponse<SendDigitsResult>;

@doc("Plays a sequence of DTMF tones on a call, as if a caller pressed those keys. Use this to navigate IVR menus or send key presses to the far end. The string accepts digits, `*`, `#`, `A`-`D`, and `w`/`W` for pauses.")
@channel("calling.send_digits")
@summary("Send DTMF digit tones to a call")
op sendDigits(...SendDigitsRequest): SendDigitsReply | CallSendDigitsEvent;

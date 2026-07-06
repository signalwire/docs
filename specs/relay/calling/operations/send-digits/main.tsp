import "@signalwire/typespec-asyncapi";
import "../../../common/frames.tsp";
import "@typespec/openapi";

import "./models/send.tsp";
import "./models/reply.tsp";
import "./models/events.tsp";

using SignalWire.AsyncAPI;
using TypeSpec.OpenAPI;

namespace Relay.Calling;

const callingSendDigits = "calling.send_digits";
const callingSendDigitsResponse = "${callingSendDigits} response";

model SendDigitsRequest is JsonRpcRequest<typeof callingSendDigits, SendDigitsParams>;
@extension("x-fern-display-name", callingSendDigitsResponse)
@reply model SendDigitsReply is JsonRpcResponse<SendDigitsResult>;

@doc("Plays a sequence of DTMF tones on a call, as if a caller pressed those keys. Use this to navigate IVR menus or send key presses to the far end. The string accepts digits, `*`, `#`, `A`-`D`, and `w`/`W` for pauses.")
@channel(callingSendDigits)
@summary("Send DTMF digit tones to a call")
@extension("x-fern-display-name", callingSendDigits)
@extension("x-fern-sdk-group-name", GroupPromptSendDigits)
op sendDigits(...SendDigitsRequest): SendDigitsReply | CallSendDigitsEvent;

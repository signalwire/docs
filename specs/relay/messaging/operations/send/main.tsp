import "@signalwire/typespec-asyncapi";
import "../../../common/frames.tsp";
import "@typespec/openapi";

import "./models/requests.tsp";
import "./models/responses.tsp";
import "../../events/state.tsp";
import "../../events/receive.tsp";

using SignalWire.AsyncAPI;
using TypeSpec.OpenAPI;

namespace Relay.Messaging;

const messagingSend = "messaging.send";
const messagingSendResponse = "${messagingSend} response";

model SendRequest is JsonRpcRequest<typeof messagingSend, SendParams>;

@extension("x-fern-display-name", messagingSendResponse)
@reply model SendReply is JsonRpcResponse<SendResult>;

@doc("""
  Send an SMS or MMS to a phone number. Include `body`, `media`, or both. A
  successful response means SignalWire accepted the message and returns its
  `message_id` — it does not mean the message was delivered yet. Watch for
  `messaging.state` events on the same `context` to follow delivery.
  """)
@channel(messagingSend)
@summary("Send an outbound message")
@extension("x-fern-display-name", messagingSend)
op send(...SendRequest): SendReply | StateEvent | ReceiveEvent;

import "@signalwire/typespec-asyncapi";
import "../../../common/frames.tsp";
import "@typespec/openapi";

import "./models/send.tsp";
import "./models/reply.tsp";
import "./models/events.tsp";

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
op send(...SendRequest): SendReply | StateEvent;

@doc("""
  Receive-only. Fires when someone sends a message to one of your numbers on a
  context you're subscribed to. There is no request to make — subscribe to the
  context (via the `contexts` you pass to `signalwire.connect`) and listen. The
  payload is the full inbound message; it is not tied to any `messaging.send` of
  your own.
  """)
@channel(messagingReceive)
@summary("Receive inbound messages on a subscribed context")
@extension("x-fern-display-name", messagingReceive)
op receiveMessage(): ReceiveEvent;

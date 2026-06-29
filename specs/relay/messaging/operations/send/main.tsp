import "@signalwire/typespec-asyncapi";

import "./models/requests.tsp";
import "./models/responses.tsp";
import "../../events/state.tsp";
import "../../events/receive.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Messaging;

model SendRequest is JsonRpcRequest<"messaging.send", SendParams>;
@reply model SendReply is JsonRpcResponse<SendResult>;

@doc("""
  Send an SMS or MMS to a phone number. Include `body`, `media`, or both. A
  successful response means SignalWire accepted the message and returns its
  `message_id` — it does not mean the message was delivered yet. Watch for
  `messaging.state` events on the same `context` to follow delivery.
  """)
@channel("messaging.send")
@summary("Send an outbound message")
op send(...SendRequest): SendReply | StateEvent | ReceiveEvent;

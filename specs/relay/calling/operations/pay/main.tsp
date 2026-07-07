import "@signalwire/typespec-asyncapi";
import "../../../common/frames.tsp";
import "@typespec/openapi";

import "./models/send.tsp";
import "./models/reply.tsp";
import "./models/events.tsp";

using SignalWire.AsyncAPI;
using TypeSpec.OpenAPI;

namespace Relay.Calling;

const callingPay = "calling.pay";
const callingPayResponse = "${callingPay} response";

model PayRequest is JsonRpcRequest<typeof callingPay, PayParams>;

@extension("x-fern-display-name", callingPayResponse)
@reply model PayReply is JsonRpcResponse<PayResult>;

@doc("""
  Collects a payment on an active call. The caller is prompted to enter their
  card details on the keypad using DTMF (touch-tone) key presses, and the
  collected details are POSTed to
  the payment connector at `payment_connector_url` for processing. Use this to
  take card payments over the phone without handling raw card data yourself.

  The immediate result confirms the request was accepted; the outcome of the
  payment (and progress updates) arrives asynchronously via `calling.call.pay`
  events keyed on your `control_id`, and at `status_url` if you set one.
  """)
@channel(callingPay)
@summary("Collect a card payment over the phone")
@extension("x-fern-display-name", callingPay)
op pay(...PayRequest): PayReply | CallPayEvent;

const callingPayStop = "calling.pay.stop";
const callingPayStopResponse = "${callingPayStop} response";

model PayStopRequest is JsonRpcRequest<typeof callingPayStop, PayStopParams>;

@extension("x-fern-display-name", callingPayStopResponse)
@reply model PayStopReply is JsonRpcResponse<PayStopResult>;

@doc("Stop an active Pay flow (interactive voice response, or IVR) session.")
@channel(callingPayStop)
@summary("Stop an active pay")
@extension("x-fern-display-name", callingPayStop)
op payStop(...PayStopRequest): PayStopReply;

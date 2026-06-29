import "@signalwire/typespec-asyncapi";

import "./models/requests.tsp";
import "./models/responses.tsp";
import "../../events/pay.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model PayRequest is JsonRpcRequest<"calling.pay", PayParams>;
@reply model PayReply is JsonRpcResponse<PayResult>;

@doc("""
  Collects a payment on an active call. The caller is prompted to enter their
  card details on the keypad (DTMF), and the collected details are POSTed to
  the payment connector at `payment_connector_url` for processing. Use this to
  take card payments over the phone without handling raw card data yourself.

  The immediate result confirms the request was accepted; the outcome of the
  payment (and progress updates) arrives asynchronously via `calling.call.pay`
  events keyed on your `control_id`, and at `status_url` if you set one.
  """)
@channel("calling.pay")
@summary("Collect a payment via the Pay IVR")
op pay(...PayRequest): PayReply | CallPayEvent;

model PayStopRequest is JsonRpcRequest<"calling.pay.stop", PayStopParams>;
@reply model PayStopReply is JsonRpcResponse<PayStopResult>;

@doc("Stop an active Pay IVR session.")
@channel("calling.pay.stop")
@summary("Stop an active pay")
op payStop(...PayStopRequest): PayStopReply;

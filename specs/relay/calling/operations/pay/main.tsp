import "@signalwire/typespec-asyncapi";

import "./models/requests.tsp";
import "./models/responses.tsp";
import "../../events/pay.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

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
@opExample(#{
  parameters: #{
    node_id: "a3b3e8e0-1234-4a4b-8c8d-000000000001",
    call_id: "b4c4f9f1-2345-4b5c-9d9e-000000000002",
    control_id: "pay-1",
    input: "dtmf",
    status_url: "https://example.com/status-webhook",
    payment_method: "credit-card",
    timeout: "6",
    max_attempts: "3",
    security_code: "false",
    postal_code: "false",
    min_postal_code_length: "6",
    payment_connector_url: "https://example.com/accept-payment",
    token_type: "one-time",
    charge_amount: "15.00",
    currency: "usd",
    language: "en-US",
    voice: "polly.Sally",
    description: "book",
    valid_card_types: "amex mastercard visa jcb",
    parameters: #[#{ name: "customer_id", value: "93652a3c-1234-dcba-abcd-7980d413bv31" }],
    prompts: #[
      #{
        for: "payment-card-number",
        error_type: "invalid-card-number timeout invalid-card-type",
        actions: #[#{ type: "Say", phrase: "You entered an invalid card number. Please try again." }],
      }
    ],
  },
  returnType: #{ code: "200", message: "Processing payment", control_id: "pay-1" },
})
op pay(...PayParams): PayResult | CallPayEvent;

@doc("Stop an active Pay IVR session.")
@channel("calling.pay.stop")
@summary("Stop an active pay")
@opExample(#{
  parameters: #{
    node_id: "a3b3e8e0-1234-4a4b-8c8d-000000000001",
    call_id: "b4c4f9f1-2345-4b5c-9d9e-000000000002",
    control_id: "pay-1",
  },
  returnType: #{ code: "200", message: "Stopping payment" },
})
op payStop(...PayStopParams): PayStopResult;

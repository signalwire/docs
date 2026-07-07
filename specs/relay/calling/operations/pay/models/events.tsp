import "@signalwire/typespec-asyncapi";
import "../../../../common/frames.tsp";
import "@typespec/openapi";

import "../../../models/core.tsp";
import "./send.tsp";

using TypeSpec.OpenAPI;

namespace Relay.Calling;

@doc("Why the most recent collection attempt failed.")
union PayErrorType {
  "timeout",
  "invalid-card-number",
  "invalid-card-type",
  "invalid-date",
  "invalid-security-code",
  "invalid-postal-code",
  "invalid-bank-routing-number",
  "invalid-bank-account-number",
  "input-matching-failed",
  "session-in-progress",
  "card-declined",
}

@doc("Final outcome of a completed pay session.")
union PayOutcome {
  "success",
  "too-many-failed-attempts",
  "payment-connector-error",
  "caller-interrupted-with-star",
  "relay-pay-stop",
  "caller-hung-up",
  "validation-error",
  "internal-error",
}

@doc("Detected payment card brand.")
union PayCardType {
  "visa",
  "mastercard",
  "amex",
  "maestro",
  "discover",
  "jcb",
  "diners-club",
}

@doc("""
  Payload of a `calling.call.pay` event. The event fires repeatedly while a pay
  session runs. **Progress** events (as each field is collected) carry `for`,
  `error_type`, `attempt`, and the masked data gathered so far. The **final**
  event carries `result` and the full masked payment details. Card data is always
  masked. Fields are optional because which ones are present depends on whether
  this is a progress or final event.
  """)
@summary("Pay event")
model CallPayParams {
  ...CallAddress;

  @doc("The `control_id` of the pay session this event belongs to.")
  @example("d4b2e1a0-7c9f-4a3b-8e2d-1f0a9b8c7d6e")
  control_id: string;

  @doc("The `status_url` you set on the request, echoed back.")
  @example("https://example.com/webhooks/relay")
  status_url?: url;

  @doc("Constant \"POST\"; present when status_url is set.")
  @example("POST")
  status_url_method?: string;

  // --- Progress events ---
  @doc("Progress: the field currently being collected, or a lifecycle marker (`payment-processing`, `payment-completed`, `payment-failed`, `payment-canceled`).")
  @example("payment-card-number")
  "for"?: PayPromptFor;

  @doc("Progress: why the most recent collection attempt failed, if it did.")
  @example("invalid-card-number")
  error_type?: PayErrorType;

  @doc("Progress: the current attempt number, as a string.")
  @example("1")
  attempt?: string;

  @doc("Progress: masked security code collected so far.")
  @example("xxx")
  security_code?: string;

  @doc("Progress: card expiration date collected so far.")
  @example("12/2028")
  expiration_date?: string;

  // --- Final event ---
  @doc("Final: the outcome of the pay session.")
  @example("success")
  result?: PayOutcome;

  @doc("Final: token type issued for the payment.")
  @example("one-time")
  payment_token?: PayTokenType;

  @doc("Final: the payment connector's confirmation / charge identifier.")
  @example("ch_3Nk9c2Ij8xLm4Qp0")
  payment_confirmation_code?: string;

  @doc("Final: why the payment failed, if it did.")
  @example("card-declined")
  payment_error?: PayErrorType;

  @doc("Final: additional error code for the failure, if any.")
  @example("card_declined")
  payment_error_code?: string;

  @doc("Final: the payment connector's own error code, if any.")
  @example("card_declined")
  payment_connector_error_code?: string;

  @doc("Final: the payment connector's own error message, if any.")
  @example("Your card was declined.")
  payment_connector_error_message?: string;

  @doc("Final: masked security code.")
  @example("xxx")
  payment_card_security_code?: string;

  @doc("Final: card expiration date.")
  @example("12/2028")
  payment_card_expiration_date?: string;

  // --- Present on both progress and final events (masked) ---
  @doc("Payment method being collected.")
  @example("credit-card")
  payment_method?: PayMethod;

  @doc("Masked card number (only the last digits are shown).")
  @example("xxxxxxxxxxxx4242")
  payment_card_number?: string;

  @doc("Detected card brand.")
  @example("visa")
  payment_card_type?: PayCardType;

  @doc("Postal code collected with the card.")
  @example("94105")
  payment_card_postal_code?: string;
}

const callingCallPay = "calling.call.pay";
@doc("Fires as a pay session progresses and once more when it completes — reporting the field being collected, any errors, and the final masked payment details.")
@summary(callingCallPay)
@extension("x-fern-display-name", callingCallPay)
model CallPayEvent is SignalwireEvent<typeof callingCallPay, CallPayParams>;

import "@typespec/http";
import "../../../types";
import "../../models/shared.tsp";

using TypeSpec.Http;
using Types.StatusCodes;

namespace SignalWireAPI.Space;

@doc("What was wrong with the `Idempotency-Key`.")
model TopUpIdempotencyKeyMessage {
  @doc("Why the request was rejected.")
  @example("Idempotency-Key header is required.")
  message: string;
}

@doc("""
  The `Idempotency-Key` header is missing (`Idempotency-Key header is required.`), the key
  was reused with a different body (`This Idempotency-Key was already used with different
  request parameters.`), or the request body is not valid JSON (`not_a_valid_json`).
  """)
@error
model TopUpBadRequestError {
  @statusCode statusCode: 400;
  @body body: TopUpIdempotencyKeyMessage | SpaceErrorBody;
}

@doc("A top-up with the same `Idempotency-Key` is still in progress. Wait for it to finish, then replay the request with the same key to read its result.")
@error
model TopUpConflictError {
  @statusCode statusCode: 409;

  @doc("Why the request was rejected.")
  @example("A top-up with this Idempotency-Key is already in progress.")
  message: string;
}

@doc("The card was declined. This is not the standard validation error body: it carries the payment processor's stable decline code.")
model CardDeclinedError {
  @doc("A description of the decline.")
  @example("Your card was declined.")
  message: string;

  @doc("The payment processor's stable decline code.")
  @example("card_declined")
  decline_code: string;
}

@doc("""
  A validation failure, or a declined card. Validation codes: `amount_not_a_whole_number`,
  `amount_not_whole_cents`, `amount_below_minimum`, and `payment_method_invalid`. A decline
  returns the decline body instead, with the processor's `decline_code`.
  """)
@error
model TopUpStatusCode422 {
  @statusCode statusCode: 422;
  @body body: SpaceErrorBody | CardDeclinedError;
}

@doc("An upstream billing service was unavailable and the deposit to the space balance could not be completed.")
@error
model TopUpDepositFailedError {
  @statusCode statusCode: 502;

  @doc("A description of the failure.")
  @example("Unable to deposit to the space's balance.")
  message: string;

  @doc("A stable code for the failure.")
  @example("deposit_failed")
  code: string;
}

@doc("""
  The request failed validation. Threshold codes: `threshold_not_whole_cents`,
  `threshold_below_minimum`, `threshold_above_maximum`. Auto top-up codes:
  `topup_amount_missing`, `topup_amount_not_whole_cents`, `topup_amount_below_minimum`,
  `topup_payment_method_missing`, `topup_payment_method_invalid`,
  `send_topup_cannot_be_disabled`. Webhook codes: `webhook_url_missing`,
  `webhook_method_invalid`.
  """)
@example(#{
  statusCode: 422,
  errors: #[
    #{
      type: "validation_error",
      code: "topup_amount_missing",
      message: "A top-up amount is required when auto top-up is enabled.",
      attribute: "topup_amount_in_microdollars",
      url: "https://signalwire.com/docs/apis/error-codes#topup_amount_missing",
    }
  ],
})
model UpdateLowBalanceSettingStatusCode422 is StatusCode422;

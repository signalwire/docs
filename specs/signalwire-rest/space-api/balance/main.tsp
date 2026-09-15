import "@typespec/http";
import "@typespec/openapi";
import "../../types";
import "../tags.tsp";
import "../models/shared.tsp";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/errors.tsp";
import "../../../_shared/alias/token-permissions.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using Types.StatusCodes;

namespace SignalWireAPI.Space;

@tag(SPACE_BALANCE_TAG)
@friendlyName("Balance")
interface Balances {
  @operationId("get_balance")
  @summary("Retrieve the balance")
  @doc("""
    Returns the current balance, the low balance threshold, and whether auto top-up is
    enabled. Each amount is given in microdollars (millionths of a US dollar) and again in
    dollars.

    The balance is read from the billing service, so the response is `502` when that
    service is unavailable.

    ${patPermissions}
    """)
  @route("/balance")
  @get
  read():
    | Balance
    | SpaceUnauthorizedError
    | SpaceUnverifiedError
    | SpaceUpstreamUnavailableError
    | StatusCode500;

  @operationId("create_top_up")
  @summary("Top up the balance")
  @doc("""
    Charges one of the space's payment methods and deposits the amount to the balance. The
    minimum is 5,000,000 microdollars (5.00 USD), and the amount must be a whole number of
    cents.

    Every top-up needs an `Idempotency-Key` header, a key you generate, so the request is
    safe to retry. Repeating a request with the same key and the same body replays the
    original top-up and returns `200` with the same balance adjustment instead of charging
    the card again; the first successful request returns `201`. The same key with a
    different body is rejected with `400`, and a top-up still in flight for that key
    returns `409`.

    A declined card returns `422` with the processor's `decline_code` rather than the
    standard validation body. Cards are added in the Dashboard;
    [List payment methods](/docs/apis/rest/space/billing/list-payment-methods) returns the
    ids to charge.

    ${patPermissions}
    """)
  @route("/balance/top_ups")
  @post
  createTopUp(
    @doc("A key you generate that makes the top-up safe to retry. Reusing it with the same body replays the original top-up; reusing it with a different body is rejected.")
    @example("8f14e45f-ea6f-4a3c-9d2b-1c0f5a7b3e21")
    @header("Idempotency-Key")
    idempotencyKey: string,

    @body body: CreateTopUpRequest,
  ):
    | {
        @doc("A replay of an earlier top-up made with the same `Idempotency-Key` and the same body. The card was not charged again.")
        @statusCode
        statusCode: 200;

        @body body: BalanceAdjustment;
      }
    | {
        @doc("The recorded top-up.")
        @statusCode
        statusCode: 201;

        @body body: BalanceAdjustment;
      }
    | TopUpBadRequestError
    | SpaceUnauthorizedError
    | SpaceUnverifiedError
    | TopUpConflictError
    | TopUpStatusCode422
    | TopUpDepositFailedError
    | StatusCode500;

  @operationId("get_low_balance_setting")
  @summary("Retrieve low balance settings")
  @doc("""
    Returns how the space is notified when its balance falls below the threshold, and how
    auto top-up is configured. A space that has never configured a threshold reports the
    platform default.

    The settings are read from the billing service, so the response is `502` when that
    service is unavailable.

    ${patPermissions}
    """)
  @route("/low_balance_setting")
  @get
  readLowBalanceSetting():
    | LowBalanceSetting
    | SpaceUnauthorizedError
    | SpaceUnverifiedError
    | SpaceUpstreamUnavailableError
    | StatusCode500;

  @operationId("update_low_balance_setting")
  @summary("Update low balance settings")
  @doc("""
    Replaces the low balance notification and auto top-up settings. The update writes the
    whole setting, so send every field you want to keep; omitted fields take their
    defaults.

    When `send_topup` is `true`, `topup_amount_in_microdollars` and
    `topup_payment_method_id` are required. The threshold must be a whole number of cents
    between 5,000,000 and 1,000,000,000,000 microdollars, and the top-up amount a whole
    number of cents of at least 10,000,000 microdollars (10.00 USD). Some spaces are
    required to keep auto top-up on; disabling it there is rejected with
    `send_topup_cannot_be_disabled`.

    ${patPermissions}
    """)
  @route("/low_balance_setting")
  @put
  updateLowBalanceSetting(@body body: UpdateLowBalanceSettingRequest):
    | LowBalanceSetting
    | SpaceInvalidJsonError
    | SpaceUnauthorizedError
    | SpaceUnverifiedError
    | UpdateLowBalanceSettingStatusCode422
    | SpaceUpstreamUnavailableError
    | StatusCode500;
}

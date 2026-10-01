import "@typespec/http";
import "@typespec/openapi";
import "../../types";
import "../tags.tsp";
import "../models/shared.tsp";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "./models/errors.tsp";
import "../../../_shared/alias/token-permissions.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using Types.StatusCodes;

namespace SignalWireAPI.Space;

// Every operation here requires that billing is managed in the space itself, so each
// returns SpaceBillingUnauthorizedError rather than SpaceUnauthorizedError. Balance,
// top-up, and low balance settings are not restricted this way and live in ./balance.
@tag(SPACE_BILLING_TAG)
@friendlyName("Billing")
interface Billing {
  @operationId("get_billing_profile")
  @summary("Retrieve the billing profile")
  @doc("""
    Returns the billing address and contacts for the space. A profile that has never been
    configured is returned with `null` fields rather than a `404`.

    The billing endpoints are available when billing is managed in the space itself, which
    is the case for every ordinary space: if the Billing section appears in your Dashboard,
    you can use them. A space purchased through a cloud marketplace, or a suspended or
    deactivated space, receives `401`. A space deactivated for nonpayment keeps them so that
    its outstanding balance can be settled.

    ${patPermissions}
    """)
  @route("/billing_profile")
  @get
  readProfile():
    | BillingProfile
    | SpaceBillingUnauthorizedError
    | SpaceUnverifiedError
    | StatusCode500;

  @operationId("update_billing_profile")
  @summary("Update the billing profile")
  @doc("""
    Replaces the billing profile. The update writes the whole profile, so send every field
    you want to keep. `contact_email` takes an array of one or more addresses.

    `tax_id_number` is required when the profile reports `tax_id_number_required: true`,
    which is the case on Enterprise spaces. On a postpay space, `monthly_invoices` is locked
    on and `false` is rejected with `monthly_invoices_locked`; the profile reports this as
    `monthly_invoices_locked: true` so a client does not have to infer it.

    ${patPermissions}
    """)
  @route("/billing_profile")
  @put
  updateProfile(@body body: UpdateBillingProfileRequest):
    | BillingProfile
    | SpaceInvalidJsonError
    | SpaceBillingUnauthorizedError
    | SpaceUnverifiedError
    | UpdateBillingProfileStatusCode422
    | StatusCode500;

  @operationId("list_billing_statements")
  @summary("List statement periods")
  @doc("""
    Lists the months a statement is available for, newest first. Each entry carries the
    path of that month's statement and the formats it can be downloaded in: a closed month
    is available as JSON, CSV, and PDF; the current month as JSON and CSV only.

    Statements are identified by calendar month rather than by an id. This list is not
    paged.

    ${patPermissions}
    """)
  @route("/billing_statements")
  @get
  listStatements():
    | BillingStatementPeriodListResponse
    | SpaceBillingUnauthorizedError
    | SpaceUnverifiedError
    | StatusCode500;

  @operationId("get_billing_statement")
  @summary("Retrieve a statement")
  @doc("""
    Returns one month's statement as JSON: the totals for the month, company-wide usage by
    kind, and usage per project. Filter the breakdown with `kind` and `project`.
    `/api/space/billing_statement.json` returns the same response. For the
    same statement as a file, use
    [Download a statement as CSV](/docs/apis/rest/space/billing/get-billing-statement-csv)
    or [Download a statement as PDF](/docs/apis/rest/space/billing/get-billing-statement-pdf).

    The statement is computed on request from the usage reporting pipeline, so the
    response is `502` when that pipeline is unavailable.

    ${patPermissions}
    """)
  @route("/billing_statement")
  @get
  readStatement(...BillingStatementQuery):
    | BillingStatement
    | SpaceBillingUnauthorizedError
    | SpaceUnverifiedError
    | BillingMonthStatusCode422
    | SpaceUpstreamUnavailableError
    | StatusCode500;

  @operationId("get_billing_statement_csv")
  @summary("Download a statement as CSV")
  @doc("""
    Returns one month's statement as a CSV file named `billing_statement_YYYY-MM.csv`. The
    `kind` and `project` filters apply as they do to
    [Retrieve a statement](/docs/apis/rest/space/billing/get-billing-statement).

    The statement is computed on request from the usage reporting pipeline, so the
    response is `502` when that pipeline is unavailable.

    ${patPermissions}
    """)
  @route("/billing_statement.csv")
  @get
  readStatementCsv(...BillingStatementQuery):
    | BillingStatementCsvResponse
    | SpaceBillingUnauthorizedError
    | SpaceUnverifiedError
    | BillingMonthStatusCode422
    | SpaceUpstreamUnavailableError
    | StatusCode500;

  @operationId("get_billing_statement_pdf")
  @summary("Download a statement as PDF")
  @doc("""
    Redirects to the stored PDF of one month's statement. The response is a `302` whose
    `Location` header is the download URL, so your client must follow redirects.

    Only a closed month has a PDF. The current month is rejected with
    `pdf_requires_a_closed_month`; check `formats` in
    [List statement periods](/docs/apis/rest/space/billing/list-billing-statements) before
    requesting one.

    ${patPermissions}
    """)
  @route("/billing_statement.pdf")
  @get
  readStatementPdf(...BillingStatementMonthQuery):
    | BillingStatementPdfRedirect
    | SpaceBillingUnauthorizedError
    | SpaceUnverifiedError
    | BillingStatementPdfStatusCode422
    | SpaceUpstreamUnavailableError
    | StatusCode500;

  @operationId("get_usage")
  @summary("Retrieve usage")
  @doc("""
    Returns company-wide usage for a month: the total, usage by kind, and usage per project.
    `month` defaults to the current month, so calling with no parameters returns usage so
    far this month.

    Usage is computed on request from the usage reporting pipeline, so the response is
    `502` when that pipeline is unavailable.

    ${patPermissions}
    """)
  @route("/usage")
  @get
  readUsage(...UsageQuery):
    | Usage
    | SpaceBillingUnauthorizedError
    | SpaceUnverifiedError
    | BillingMonthStatusCode422
    | SpaceUpstreamUnavailableError
    | StatusCode500;

  @operationId("list_payment_history")
  @summary("List payment history")
  @doc("""
    Lists the balance adjustments recorded for the space: top-ups, auto top-ups, and
    credits or debits applied by SignalWire. Narrow the range with `created_after` and
    `created_before`. Results are paged; follow the `links.next` URL for the next page,
    which carries the filters and the `page_token` for you.

    ${patPermissions}
    """)
  @route("/payment_history")
  @get
  listPaymentHistory(...PaymentHistoryQuery):
    | PaymentHistoryListResponse
    | SpaceBillingUnauthorizedError
    | SpaceUnverifiedError
    | PaymentHistoryStatusCode422
    | StatusCode500;

  @operationId("list_payment_methods")
  @summary("List payment methods")
  @doc("""
    Lists the cards on file for the space as a bare array, not a paged envelope. Use a
    card's `id` as `payment_method_id` in
    [Top up the balance](/docs/apis/rest/space/balance/create-top-up) or as
    `topup_payment_method_id` in
    [Update low balance settings](/docs/apis/rest/space/balance/update-low-balance-setting).

    Adding a card is not part of this API. Cards are added in the Dashboard.

    ${patPermissions}
    """)
  @route("/payment_methods")
  @get
  listPaymentMethods():
    | PaymentMethod[]
    | SpaceBillingUnauthorizedError
    | SpaceUnverifiedError
    | StatusCode500;

  @operationId("delete_payment_method")
  @summary("Delete a payment method")
  @doc("""
    Removes a card from the space. The card that auto top-up charges cannot be deleted
    (`payment_method_is_active_topup_source`); point auto top-up at another card or
    disable it first with
    [Update low balance settings](/docs/apis/rest/space/balance/update-low-balance-setting).

    ${patPermissions}
    """)
  @route("/payment_methods/{id}")
  @delete
  deletePaymentMethod(...PaymentMethodPathID):
    | {
        @statusCode statusCode: 204;
      }
    | SpaceBillingUnauthorizedError
    | SpaceUnverifiedError
    | SpaceNotFoundError
    | DeletePaymentMethodStatusCode422
    | StatusCode500;
}

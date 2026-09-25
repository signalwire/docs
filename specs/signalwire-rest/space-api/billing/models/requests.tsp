import "@typespec/http";
import "./core.tsp";
import "../../models/shared.tsp";

using TypeSpec.Http;

namespace SignalWireAPI.Space;

@doc("Request body for updating the billing profile. The update writes the whole profile, so send every field you want to keep.")
model UpdateBillingProfileRequest {
  @doc("The first line of the billing address.")
  @example("1234 Main St")
  address_line1: string;

  @doc("The second line of the billing address.")
  @example("Suite 200")
  address_line2?: string;

  @doc("The city of the billing address.")
  @example("Austin")
  address_city: string;

  @doc("The state, province, or region of the billing address.")
  @example("TX")
  address_state: string;

  @doc("The postal code of the billing address.")
  @example("78701")
  address_zip: string;

  @doc("The ISO 3166-1 alpha-2 country code of the billing address.")
  @example("US")
  address_country: string;

  @doc("The company name to show on statements.")
  @example("Acme Inc")
  company_name: string;

  @doc("The name of the billing contact.")
  @example("Jane Doe")
  contact_name: string;

  @doc("The email addresses to send billing correspondence to. Must be an array (`contact_email_must_be_array`) with at least one address (`contact_email_missing`), each a valid email address (`contact_email_address_invalid`).")
  @minItems(1)
  @example(#["jane@example.com", "billing@example.com"])
  contact_email: string[];

  @doc("The phone number of the billing contact.")
  @example("+15125550100")
  contact_phone: string;

  @doc("The tax identification number to show on statements. Required when the profile reports `tax_id_number_required: true`, which is the case on Enterprise spaces.")
  @example("12-3456789")
  tax_id_number?: string;

  @doc("Whether to issue a monthly invoice. On a postpay space this is locked on, and `false` is rejected with `monthly_invoices_locked`.")
  @example(false)
  monthly_invoices?: boolean = false;
}

@doc("The month a statement is requested for.")
model BillingStatementMonthQuery {
  @doc("The calendar month, as `YYYY-MM`. A month before the space existed is rejected with `month_precedes_space_creation`, and a future month with `month_is_in_the_future`.")
  @query
  @pattern("^\\d{4}-\\d{2}$")
  @example("2026-07")
  month: string;
}

@doc("Filters on the statement breakdown.")
model BillingStatementFilterQuery {
  @doc("Return only these usage kinds in `usage_by_kind` and in each project's breakdown. Repeat the parameter for each kind.")
  @query(#{ explode: true })
  @example(#["pstn_outbound"])
  kind?: string[];

  @doc("Restrict the per-project breakdown to these project ids. Repeat the parameter for each project.")
  @query(#{ explode: true })
  @example(#["4d5e6f70-8192-4a3b-8c4d-5e6f70819234"])
  project?: uuid[];
}

@doc("Query parameters for a statement in JSON or CSV.")
model BillingStatementQuery {
  ...BillingStatementMonthQuery;
  ...BillingStatementFilterQuery;
}

@doc("Query parameters for usage.")
model UsageQuery {
  @doc("The calendar month, as `YYYY-MM`. Defaults to the current month. A month before the space existed is rejected with `month_precedes_space_creation`, and a future month with `month_is_in_the_future`.")
  @query
  @pattern("^\\d{4}-\\d{2}$")
  @example("2026-08")
  month?: string;
}

@doc("Query parameters for payment history.")
model PaymentHistoryQuery {
  @doc("Return only adjustments recorded after this date (`YYYY-MM-DD`) or ISO 8601 timestamp.")
  @query
  @example("2026-07-01")
  created_after?: string;

  @doc("Return only adjustments recorded before this date (`YYYY-MM-DD`) or ISO 8601 timestamp.")
  @query
  @example("2026-08-01")
  created_before?: string;

  ...SpacePaginationQuery;
}

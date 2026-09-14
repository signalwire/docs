import "@typespec/http";
import "../../../types";

using TypeSpec.Http;

namespace SignalWireAPI.Space;

@doc("A format a monthly statement can be downloaded in.")
enum BillingStatementFormat {
  json,
  csv,
  pdf,
}

@doc("The unique identifier of a payment method.")
model PaymentMethodPathID {
  @doc("The unique identifier of the payment method.")
  @example("7a8b9c0d-1e2f-4304-8516-27384950a6b7")
  @path
  id: uuid;
}

@summary("Billing profile")
@doc("The billing address and contacts for the space. A profile that has never been configured is returned with `null` fields rather than a `404`.")
model BillingProfile {
  @doc("The object type. Always `billing_profile`.")
  @example("billing_profile")
  type: "billing_profile";

  @doc("The first line of the billing address.")
  @example("1234 Main St")
  address_line1: string | null;

  @doc("The second line of the billing address.")
  @example("Suite 200")
  address_line2: string | null;

  @doc("The city of the billing address.")
  @example("Austin")
  address_city: string | null;

  @doc("The state, province, or region of the billing address.")
  @example("TX")
  address_state: string | null;

  @doc("The postal code of the billing address.")
  @example("78701")
  address_zip: string | null;

  @doc("The ISO 3166-1 alpha-2 country code of the billing address.")
  @example("US")
  address_country: string | null;

  @doc("The company name that appears on statements.")
  @example("Acme Inc")
  company_name: string | null;

  @doc("The name of the billing contact.")
  @example("Jane Doe")
  contact_name: string | null;

  @doc("The email addresses billing correspondence is sent to.")
  @example(#["jane@example.com", "billing@example.com"])
  contact_email: string[] | null;

  @doc("The phone number of the billing contact.")
  @example("+15125550100")
  contact_phone: string | null;

  @doc("The tax identification number that appears on statements.")
  @example("12-3456789")
  tax_id_number: string | null;

  @doc("Whether a monthly invoice is issued for the space.")
  @example(false)
  monthly_invoices: boolean;

  @doc("Whether `tax_id_number` is required when updating the profile. `true` on Enterprise spaces.")
  @example(false)
  tax_id_number_required: boolean;

  @doc("Whether `monthly_invoices` is locked on. `true` on postpay spaces, where monthly invoices cannot be turned off.")
  @example(false)
  monthly_invoices_locked: boolean;
}

@summary("Billing statement period")
@doc("A month a statement is available for.")
model BillingStatementPeriod {
  @doc("The object type. Always `billing_statement_period`.")
  @example("billing_statement_period")
  type: "billing_statement_period";

  @doc("The calendar month the statement covers, as `YYYY-MM`. Statements are identified by month, not by an id.")
  @example("2026-07")
  month: string;

  @doc("The path of the statement for this month.")
  @example("/api/space/billing_statement?month=2026-07")
  uri: string;

  @doc("The formats the statement is available in: `json`, `csv`, and `pdf` for a closed month; `json` and `csv` for the current month.")
  @example(#[
    BillingStatementFormat.json,
    BillingStatementFormat.csv,
    BillingStatementFormat.pdf
  ])
  formats: BillingStatementFormat[];
}

@summary("Amount by kind")
@doc("An amount for one kind of usage or adjustment, in microdollars (millionths of a US dollar) and again in dollars.")
model AmountByKind {
  @doc("A stable code for the kind of usage or adjustment.")
  @example("pstn_outbound")
  kind: string;

  @doc("A description of the kind.")
  @example("Outbound Voice Minutes")
  description: string;

  @doc("The amount in microdollars.")
  @example(4820000)
  amount_in_microdollars: int64;

  @doc("The same amount in US dollars.")
  @example(4.82)
  amount_in_dollars: float64;
}

@summary("Project usage")
@doc("Usage attributed to one project, with its own breakdown by kind.")
model ProjectUsage {
  @doc("The unique identifier of the project.")
  @example("4d5e6f70-8192-4a3b-8c4d-5e6f70819234")
  id: uuid;

  @doc("The name of the project, or `null` when the project no longer exists.")
  @example("Root Project")
  name: string | null;

  @doc("The project's total in microdollars.")
  @example(4820000)
  amount_in_microdollars: int64;

  @doc("The same total in US dollars.")
  @example(4.82)
  amount_in_dollars: float64;

  @doc("The project's usage broken down by kind.")
  usage_by_kind: AmountByKind[];
}

@doc("The totals for the month.")
model BillingStatementSummary {
  @doc("Usage charges in microdollars.")
  @example(4820000)
  usage_in_microdollars: int64;

  @doc("Usage charges in US dollars.")
  @example(4.82)
  usage_in_dollars: float64;

  @doc("Carrier fees in microdollars.")
  @example(120000)
  carrier_fees_in_microdollars: int64;

  @doc("Carrier fees in US dollars.")
  @example(0.12)
  carrier_fees_in_dollars: float64;

  @doc("Taxes in microdollars.")
  @example(0)
  taxes_in_microdollars: int64;

  @doc("Taxes in US dollars.")
  @example(0.0)
  taxes_in_dollars: float64;

  @doc("The balance adjustments recorded in the month, one entry per adjustment kind.")
  adjustments: AmountByKind[];
}

@summary("Billing statement")
@doc("One month's statement: the totals, company-wide usage by kind, and usage per project. Statements are computed on request from the usage reporting pipeline.")
model BillingStatement {
  @doc("The object type. Always `billing_statement`.")
  @example("billing_statement")
  type: "billing_statement";

  @doc("The calendar month the statement covers, as `YYYY-MM`.")
  @example("2026-07")
  month: string;

  @doc("The totals for the month.")
  summary: BillingStatementSummary;

  @doc("Company-wide usage broken down by kind.")
  usage_by_kind: AmountByKind[];

  @doc("Usage per project, each with its own breakdown by kind.")
  projects: ProjectUsage[];
}

@summary("Usage")
@doc("Company-wide usage for a month, in total, by kind, and per project. Usage is computed on request from the usage reporting pipeline.")
model Usage {
  @doc("The object type. Always `usage`.")
  @example("usage")
  type: "usage";

  @doc("The calendar month the usage covers, as `YYYY-MM`.")
  @example("2026-08")
  month: string;

  @doc("The total usage in microdollars.")
  @example(300)
  total_in_microdollars: int64;

  @doc("The total usage in US dollars.")
  @example(0.0003)
  total_in_dollars: float64;

  @doc("Company-wide usage broken down by kind.")
  usage_by_kind: AmountByKind[];

  @doc("Usage per project, each with its own breakdown by kind.")
  projects: ProjectUsage[];
}

@summary("Payment method")
@doc("A card on file for the space. Cards are added in the Dashboard; the API lists and deletes them.")
model PaymentMethod {
  @doc("The object type. Always `payment_method`.")
  @example("payment_method")
  type: "payment_method";

  @doc("The unique identifier of the payment method. Use it as `payment_method_id` when topping up or configuring auto top-up.")
  @example("7a8b9c0d-1e2f-4304-8516-27384950a6b7")
  id: uuid;

  @doc("The card brand.")
  @example("visa")
  brand: string;

  @doc("The last four digits of the card number.")
  @example("4242")
  last4: string;

  @doc("The month the card expires, from 1 to 12.")
  @example(12)
  expires_month: int32;

  @doc("The four-digit year the card expires.")
  @example(2030)
  expires_year: int32;

  @doc("The ISO 3166-1 alpha-2 country code of the card.")
  @example("US")
  country: string;

  @doc("Whether this card is the one auto top-up charges. The active auto top-up source cannot be deleted.")
  @example(false)
  auto_topup_source: boolean;
}

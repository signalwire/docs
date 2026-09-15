import "@typespec/http";
import "./core.tsp";
import "../../models/shared.tsp";
import "../../balance/models/core.tsp";

using TypeSpec.Http;

namespace SignalWireAPI.Space;

@doc("The months a statement is available for, newest first. This list is not paged.")
model BillingStatementPeriodListResponse {
  @doc("The available months, newest first.")
  data: BillingStatementPeriod[];
}

@doc("The statement as CSV.")
model BillingStatementCsvResponse {
  @statusCode statusCode: 200;
  @header contentType: "text/csv";

  @doc("Names the download `billing_statement_YYYY-MM.csv`.")
  @example("attachment; filename=\"billing_statement_2026-07.csv\"")
  @header("Content-Disposition")
  contentDisposition: string;

  @body body: string;
}

@doc("A redirect to the stored PDF. Follow the `Location` header to download it; the response body is empty.")
model BillingStatementPdfRedirect {
  @statusCode statusCode: 302;

  @doc("The URL of the stored PDF.")
  @header("Location")
  location: url;
}

@doc("A page of balance adjustments.")
model PaymentHistoryListResponse {
  @doc("Pagination links for the list. The `created_after` and `created_before` filters are preserved in each link.")
  links: SpacePaginationLinks;

  @doc("The balance adjustments on this page.")
  data: BalanceAdjustment[];
}

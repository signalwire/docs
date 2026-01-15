import "./core.tsp";
import "../../_shared/pagination.tsp";

using TypeSpec.Http;

@doc("Response containing a list of accounts.")
model AccountListResponse {
  @doc("Pagination links.")
  links?: Pagination;

  @doc("List of applications/accounts.")
  applications?: Account[];
}

@doc("Response containing a single account.")
model AccountResponse {
  ...Account;
}

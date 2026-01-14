import "./core.tsp";
import "../../_shared/pagination.tsp";

using TypeSpec.Http;

@doc("Response containing a list of accounts.")
model AccountListResponse {
  @doc("Pagination links.")
  links?: Pagination;

  @doc("List of accounts.")
  accounts?: Account[];
}

@doc("Response containing a single account.")
model AccountResponse {
  ...Account;
}

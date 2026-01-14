import "./core.tsp";

using TypeSpec.Http;

@doc("Pagination links for list responses.")
model PaginationLinks {
  @doc("Link to the current page.")
  self?: string;

  @doc("Link to the first page.")
  first?: string;

  @doc("Link to the next page.")
  next?: string;

  @doc("Link to the previous page.")
  prev?: string;
}

@doc("Response containing a list of addresses.")
model AddressListResponse {
  @doc("Pagination links.")
  links?: PaginationLinks;

  @doc("List of addresses.")
  data?: Address[];
}

@doc("Response containing a single address.")
model AddressResponse {
  ...Address;
}

import "./core.tsp";

using TypeSpec.Http;

model AliasAddressListResponse {
  @doc("Pagination links for the response.")
  links: AliasAddressPaginationResponse;

  @doc("The number of alias addresses in this page of results.")
  @example(1)
  items_count: int32;

  @doc("An array of alias address objects.")
  data: AliasAddress[];
}

model AliasAddressPaginationResponse {
  @doc("Link to the current page of results.")
  @example("https://example.signalwire.com/api/fabric/alias_addresses?page_number=0&page_size=50")
  self: url;

  @doc("Link to the first page of results.")
  @example("https://example.signalwire.com/api/fabric/alias_addresses?page_number=0&page_size=50")
  first: url;

  @doc("Link to the next page of results.")
  @example("https://example.signalwire.com/api/fabric/alias_addresses?page_number=1&page_size=50&page_token=PAbff61159-faab-48b3-959a-3021a8f5beca")
  next?: url;

  @doc("Link to the previous page of results.")
  @example("https://example.signalwire.com/api/fabric/alias_addresses?page_number=0&page_size=50&page_token=PAbff61159-faab-48b3-959a-3021a8f5beca")
  prev?: url;
}

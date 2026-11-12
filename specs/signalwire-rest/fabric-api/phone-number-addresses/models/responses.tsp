import "./core.tsp";

using TypeSpec.Http;

model PhoneNumberAddressListResponse {
  @doc("Pagination links for the response.")
  links: PhoneNumberAddressPaginationResponse;

  @doc("The number of phone number addresses in this page of results.")
  @example(1)
  items_count: int32;

  @doc("An array of phone number address objects.")
  data: PhoneNumberAddress[];
}

model PhoneNumberAddressPaginationResponse {
  @doc("Link to the current page of results.")
  @example("https://example.signalwire.com/api/fabric/phone_number_addresses?page_number=0&page_size=50")
  self: url;

  @doc("Link to the first page of results.")
  @example("https://example.signalwire.com/api/fabric/phone_number_addresses?page_number=0&page_size=50")
  first: url;

  @doc("Link to the next page of results.")
  @example("https://example.signalwire.com/api/fabric/phone_number_addresses?page_number=1&page_size=50&page_token=PAbff61159-faab-48b3-959a-3021a8f5beca")
  next?: url;

  @doc("Link to the previous page of results.")
  @example("https://example.signalwire.com/api/fabric/phone_number_addresses?page_number=0&page_size=50&page_token=PAbff61159-faab-48b3-959a-3021a8f5beca")
  prev?: url;
}

model ExternalSWMLHandlerListResponse {
  data: ExternalSWMLHandler[];
  links: ExternalSWMLHandlerPaginationResponse;
}

model ExternalSWMLHandlerPaginationResponse {
  @doc("Link of the current page")
  @example("https://{space_name}.signalwire.com/api/fabric/resources/external_swml_handlers?page_number=0&page_size=50")
  self: url;

  @doc("Link to the first page")
  @example("https://{space_name}.signalwire.com/api/fabric/resources/external_swml_handlers?page_number=0&page_size=50")
  first: url;

  @doc("Link to the next page")
  @example("https://{space_name}.signalwire.com/api/fabric/resources/external_swml_handlers?page_number=1&page_size=50&page_token=PAbff61159-faab-48b3-959a-3021a8f5beca")
  next: url;
}

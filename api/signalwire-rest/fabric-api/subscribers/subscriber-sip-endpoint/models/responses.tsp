model SubscriberSipEndpointListResponse {
  data: SIPEndpoint[];
  links: PaginationResponse;
}

model PaginationResponse {
  @doc("Link of the current page")
  @example("https://{space_name}.signalwire.com/api/fabric/resources/subscribers/d369a402-7b43-4512-8735-9d5e1f387814/sip_endpoints?page_number=0&page_size=50")
  self: url;

  @doc("Link to the first page")
  @example("https://{space_name}.signalwire.com/api/fabric/resources/subscribers/d369a402-7b43-4512-8735-9d5e1f387814/sip_endpoints?page_number=0&page_size=50")
  first: url;

  @doc("Link to the next page")
  @example("https://{space_name}.signalwire.com/api/fabric/resources/subscribers/d369a402-7b43-4512-8735-9d5e1f387814/sip_endpoints?page_number=1&page_size=50&page_token=PAbff61159-faab-48b3-959a-3021a8f5beca")
  next: url;
}

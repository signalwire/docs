import "./core.tsp";

model LogResponse {
  ...FaxLog;
}

model LogListResponse {
  @doc("Object containing pagination links")
  links: LogPaginationResponse;

  @doc("Array of log data")
  data: FaxLog[];
}

model LogPaginationResponse {
  @example("https://example.signalwire.com/api/fax/logs?page_number=0&page_size=50")
  self: string;

  @example("https://example.signalwire.com/api/fax/logs?page_size=50")
  first: string;

  @example("https://example.signalwire.com/api/fax/logs?page_number=1&page_size=50&page_token=PAbff61159-faab-48b3-959a-3021a8f5beca")
  next?: string;

  @example("https://example.signalwire.com/api/fax/logs?page_number=0&page_size=50&page_token=PAbff61159-faab-48b3-959a-3021a8f5beca")
  prev?: string;
}

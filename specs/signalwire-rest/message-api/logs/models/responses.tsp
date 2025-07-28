import "./core.tsp";

@doc("Pagination links for message log list responses")
model LogPaginationResponse {
  @doc("URL to current page")
  @example("https://example.signalwire.com/api/messaging/logs?page_number=0&page_size=50")
  self: string;

  @doc("URL to first page")
  @example("https://example.signalwire.com/api/messaging/logs?page_size=50")
  first: string;

  @doc("URL to next page (if available)")
  @example("https://example.signalwire.com/api/messaging/logs?page_number=1&page_size=50&page_token=PA2fa20774-64a1-41d3-a88a-1c61f563d0e7")
  next?: string;

  @doc("URL to previous page (if available)")
  @example("https://example.signalwire.com/api/messaging/logs?page_number=0&page_size=50&page_token=PA2fa20774-64a1-41d3-a88a-1c61f563d0e7")
  prev?: string;
}

@doc("Response model for message log list endpoint")
model LogListResponse {
  @doc("Pagination links")
  links: LogPaginationResponse;

  @doc("Array of message log entries")
  data: MessageLog[];
}

@doc("Response model for message log retrieve endpoint")
model LogRetrieveResponse is MessageLog;

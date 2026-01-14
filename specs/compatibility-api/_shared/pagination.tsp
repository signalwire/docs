@doc("Pagination information for list responses.")
model Pagination {
  @doc("The URI of the current page.")
  uri?: string;

  @doc("The URI of the first page.")
  first_page_uri?: string;

  @doc("The URI of the next page.")
  next_page_uri?: string;

  @doc("The URI of the previous page.")
  previous_page_uri?: string;

  @doc("The current page number.")
  page?: int32;

  @doc("The number of items per page.")
  page_size?: int32;
}

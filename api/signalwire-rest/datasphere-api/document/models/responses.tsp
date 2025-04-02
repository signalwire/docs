model DocumentListResponse {
  data: Document[];
  links: PaginationResponse;
}

model PaginationResponse {
  @doc("Link of the current page")
  @example("https://{space_name}.signalwire.com/api/data_sphere/documents?page_number=0&page_size=50")
  self: url;

  @doc("Link to the first page")
  @example("https://{space_name}.signalwire.com/api/data_sphere/documents?page_number=0&page_size=50")
  first: url;

  @doc("Link to the next page")
  @example("https://{space_name}.signalwire.com/api/data_sphere/documents?page_number=1&page_size=50&page_token=PAbff61159-faab-48b3-959a-3021a8f5beca")
  next: url;
}

model ChunkResponse {
  @doc("Unique ID of the chunk.")
  @example("acaa5c49-be5e-4477-bce0-48f4b23b7720")
  id: string;

  @doc("Unique ID of the chunk's datasphere document.")
  @example("acaa5c49-be5e-4477-bce0-48f4b23b7720")
  datasphere_document_id: string;

  @doc("Unique ID of the project.")
  @example("d369a402-7b43-4512-8735-9d5e1f387814")
  project_id: string;

  @doc("Status of the chunk.")
  @example("completed")
  status: string;

  @doc("The tags of the document associated with the chunk.")
  @example(#["sports", "football", "game"])
  tags: string[];

  @doc("Content of the chunk")
  @example("This is the content from the original document that was chunked.")
  content: string;

  @doc("Chunk Creation Date.")
  @example(utcDateTime.fromISO("2024-05-06T12:20-12Z"))
  created_at: utcDateTime;

  @doc("Chunk Update Date.")
  @example(utcDateTime.fromISO("2024-05-06T12:20-12Z"))
  updated_at: utcDateTime;
}

model ChunkListResponse {
  data: ChunkResponse[];
  links: ChunkPaginationResponse;
}

model ChunkPaginationResponse {
  @doc("Link of the current page")
  @example("https://{space_name}.signalwire.com/api/data_sphere/documents/document_id={document_id}/chunks?page_number=0&page_size=50")
  self: url;

  @doc("Link to the first page")
  @example("https://{space_name}.signalwire.com/api/data_sphere/documents/document_id={document_id}/chunks?page_number=0&page_size=50")
  first: url;

  @doc("Link to the next page")
  @example("https://{space_name}.signalwire.com/api/data_sphere/documents/document_id={document_id}/chunks?page_number=1&page_size=50&page_token=PAbff61159-faab-48b3-959a-3021a8f5beca")
  next: url;
}

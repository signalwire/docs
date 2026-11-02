namespace SignalWireAPI.Datasphere;

@doc("""
  How Datasphere splits the document into chunks. `sentence` groups sentences, `sliding` takes overlapping windows of words, `paragraph` splits on blank lines, and `page` makes one chunk per PDF page. Plain text and Markdown files have no pages, so `page` splits them on blank lines like `paragraph`.
  """)
enum ChunkingStrategy {
  Sentence: "sentence",
  Paragraph: "paragraph",
  Page: "page",
  Sliding: "sliding",
}

@doc("""
  Processing state of the document. A new document is `submitted`, moves to `in_progress` while its text is extracted and chunked, and becomes `completed` once every chunk is embedded and searchable. It becomes `failed` if the text can't be extracted or embedded.
  """)
enum DocumentStatus {
  Submitted: "submitted",
  InProgress: "in_progress",
  Completed: "completed",
  Failed: "failed",
}

@doc("The current Status of the Chunk.")
enum ChunkStatus {
  Submitted: "submitted",
  InProgress: "in_progress",
  Completed: "completed",
  Failed: "failed",
}

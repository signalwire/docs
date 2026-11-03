namespace SignalWireAPI.Datasphere;

@doc("""
  How Datasphere splits the document into chunks. `sentence` groups sentences, `sliding` takes overlapping windows of words, `paragraph` splits on blank lines, and `page` makes one chunk per PDF page. Plain text and Markdown files have no pages, so `page` splits them on blank lines like `paragraph`. Markdown is chunked as written, so chunks keep their markup.
  """)
enum ChunkingStrategy {
  Sentence: "sentence",
  Paragraph: "paragraph",
  Page: "page",
  Sliding: "sliding",
}

@doc("""
  Processing state of the document. A new document is `submitted` and moves to `in_progress` while its text is extracted, chunked, and indexed. It becomes `completed` once every chunk is searchable, or `failed` if a chunk can't be indexed, for example because it is too long. A file with no extractable text, such as a scanned PDF with no text layer, stays `in_progress`.
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

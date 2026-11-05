import "@typespec/http";
import "@typespec/openapi3";

using TypeSpec.Http;
using TypeSpec.OpenAPI;

namespace SignalWireAPI.Datasphere;


model DocumentSearchRequest {
  @doc("Document tags.")
  @example(#["sports", "football", "game"])
  tags?: string[];

  @doc("Unique ID of a Document.")
  @example("acaa5c49-be5e-4477-bce0-48f4b23b7720")
  document_id?: uuid;

  @doc("Search term.")
  @example("Most paid athlete")
  query_string: string;

  @doc("Specifies how closely related the query is to the document. Low distance means high relevance and similarity. High distance means low relevance and similarity.")
  @example(2)
  @minValue(0.0)
  @maxValue(78.3836717690617)
  distance?: float;

  @doc("Specifies number of returned Chunks.")
  @example(5)
  @minValue(1)
  count?: integer = 5;

  @doc("Language of the Document.")
  @example("fr")
  language?: string = "en";

  @doc("Part of Speech considered for expansion or analysis.")
  @example(#["NOUN", "VERB"])
  pos_to_expand?: string[] = #["NOUN", "VERB", "ADJ", "ADV"];

  @doc("Maximum number of synonyms to consider.")
  @example(7)
  @minValue(1)
  max_synonyms?: integer = 10;
}

@doc("Query parameters for listing documents.")
model DocumentListQuery {
  @doc("The page number to retrieve (0-indexed).")
  @example(0)
  @query
  @minValue(0)
  page_number?: int32 = 0;

  @doc("Specify the number of results to return on a single page. The default page size is `50` and the maximum is `1000`.")
  @example(50)
  @query
  @minValue(1)
  @maxValue(1000)
  page_size?: int32 = 50;

  @doc("Token for cursor-based pagination. Required when `page_number` > 0.")
  @example("PAb3877c40da604998")
  @query
  page_token?: string;
}

@doc("Query parameters for listing chunks.")
model ChunkListQuery {
  @doc("The page number to retrieve (0-indexed).")
  @example(0)
  @query
  @minValue(0)
  page_number?: int32 = 0;

  @doc("Specify the number of results to return on a single page. The default page size is `50` and the maximum is `1000`.")
  @example(50)
  @query
  @minValue(1)
  @maxValue(1000)
  page_size?: int32 = 50;

  @doc("Token for cursor-based pagination. Required when `page_number` > 0.")
  @example("PAb3877c40da604998")
  @query
  page_token?: string;
}

model DocumentCreateRequestBase {
  @doc("""
    Public `http` or `https` URL of the file to ingest. Datasphere downloads the file and accepts PDF, plain text, and Markdown files up to 10 MB. A PDF is recognized from its content, so a Word or Excel file is rejected with a `422` error even when it is served as `text/plain`. A text file is identified by its `Content-Type` header (`text/plain`, `text/markdown`, `text/x-markdown`, or `text/x-web-markdown`), or by its file extension when that header is missing or `application/octet-stream`. An extension that names a more specific text type also overrides `text/plain`, so a `.md` file served as `text/plain` is accepted as Markdown, while a `.csv`, `.json`, or `.xml` file served that way is rejected with a `422` error. The file name, taken from the `Content-Disposition` header or the last segment of the URL path, must have a supported extension or none at all, so a PDF served from `/download.php` is rejected with a `422` error.
    """)
  @example("https://example.com/document.pdf")
  url: url;

  @doc("Document tags.")
  @example(#["sports", "football", "game"])
  tags?: string[];
}

@summary("Sentence strategy")
model DocumentCreateSentenceRequest extends DocumentCreateRequestBase {
  @doc("Maximum number of sentences per chunk.")
  @example(40)
  max_sentences_per_chunk?: integer = 50;

  @doc("Splits the text into sentences and groups up to `max_sentences_per_chunk` of them per chunk. This is the default when `chunking_strategy` is omitted.")
  @example(ChunkingStrategy.Sentence)
  chunking_strategy?: ChunkingStrategy.Sentence;

  // There's a bug in the REST API plugin for our docs that is not showing the default value when set to 'false`. So we manually document it here.
  @doc("""
    Whether a line break also ends a sentence. When `true`, no sentence spans a line break. When `false`, only sentence punctuation ends a sentence.
    \n\n
    **Default value:** `false`
    """)
  @example(false)
  split_newlines?: boolean = false;
}

@summary("Sliding strategy")
model DocumentCreateSlidingRequest extends DocumentCreateRequestBase {
  @doc("Number of words per chunk.")
  @example(50)
  chunk_size?: integer = 50;

  @doc("Takes a window of `chunk_size` words and slides it forward so that consecutive chunks share `overlap_size` words.")
  @example(ChunkingStrategy.Sliding)
  chunking_strategy?: ChunkingStrategy.Sliding;

  @doc("Amount of overlap between chunks, in number of words.")
  @example(10)
  overlap_size?: integer = 10;
}

@summary("Page strategy")
model DocumentCreatePageRequest extends DocumentCreateRequestBase {
  @doc("Makes one chunk per page of a PDF. Plain text and Markdown files have no pages, so they are split on blank lines instead, as with `paragraph`.")
  @example(ChunkingStrategy.Page)
  chunking_strategy?: ChunkingStrategy.Page;
}

@summary("Paragraph strategy")
model DocumentCreateParagraphRequest extends DocumentCreateRequestBase {
  @doc("Splits on blank lines so that each paragraph becomes a chunk.")
  @example(ChunkingStrategy.Paragraph)
  chunking_strategy?: ChunkingStrategy.Paragraph;
}

@oneOf
union DocumentCreateRequest {
  DocumentCreateSentenceRequest,
  DocumentCreateSlidingRequest,
  DocumentCreatePageRequest,
  DocumentCreateParagraphRequest,
}

model DocumentUpdateRequest {
  @doc("Document tags.")
  @example(#["sports", "football", "game"])
  tags: string[];
}

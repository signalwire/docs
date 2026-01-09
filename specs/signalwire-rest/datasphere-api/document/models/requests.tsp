import "@typespec/openapi3";

using TypeSpec.OpenAPI;

model DocumentSearchRequest {
  @doc("Document tags.")
  @example(#["sports", "football", "game"])
  tags?: string[];

  @doc("Unique ID of a Document.")
  @example("acaa5c49-be5e-4477-bce0-48f4b23b7720")
  document_id?: docid;

  @doc("Search term.")
  @example("Most paid athlete")
  query_string: string;

  @doc("Specifies how closely related the query is to the document. Low distance means high relevance and similarity. High distance means low relevance and similarity.")
  @example(2)
  @minValue(0.0)
  @maxValue(78.3836717690617)
  distance?: integer;

  @doc("Specifies number of returned Chunks.")
  @example(5)
  count?: integer;

  @doc("Language of the Document.")
  @example("fr")
  language?: string = "en";

  @doc("Part of Speech considered for expansion or analysis.")
  @example(#["NOUN", "VERB"])
  pos_to_expand?: string[] = #["NOUN", "VERB", "ADJ", "ADV"];

  @doc("Maximum number of synonyms to consider.")
  @example(7)
  max_synonyms?: integer = 10;
}

model DocumentCreateRequestBase {
  @doc("URL of the document.")
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

  @doc("Strategy for chunking the document")
  @example(ChunkingStrategy.Sentence)
  chunking_strategy?: ChunkingStrategy.Sentence;

  // There's a bug in the REST API plugin for our docs that is not showing the default value when set to 'false`. So we manually document it here.
  @doc("""
    Whether to split chunks on new lines.
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

  @doc("Strategy for chunking the document")
  @example(ChunkingStrategy.Sliding)
  chunking_strategy?: ChunkingStrategy.Sliding;

  @doc("Amount of overlap between chunks, in number of words.")
  @example(10)
  overlap_size?: integer = 10;
}

@summary("Page strategy")
model DocumentCreatePageRequest extends DocumentCreateRequestBase {
  @doc("Strategy for chunking the document")
  @example(ChunkingStrategy.Page)
  chunking_strategy?: ChunkingStrategy.Page;
}

@summary("Paragraph strategy")
model DocumentCreateParagraphRequest extends DocumentCreateRequestBase {
  @doc("Strategy for chunking the document")
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

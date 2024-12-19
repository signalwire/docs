import "@typespec/http";
import "./enums.tsp";

using TypeSpec.Http;

@format("uuid")
@doc("Unique ID of a Document.")
scalar docid extends string;

model PathID {
  @doc("Unique ID of a Document.")

  @path
  id: docid
}

model Document {
  @doc("Unique ID of the Document.")
  @example("acaa5c49-be5e-4477-bce0-48f4b23b7720")
  id: docid;

  @doc("Name of the Document.")
  @example("player_list.pdf")
  filename: string;

  @doc("Status of the Document.")
  @example(DocumentStatus.InProgress)
  status: DocumentStatus;

  @doc("Document tags.")
  @example(#["sports", "football", "game"])
  tags: string[];

  @doc("Strategy used to chunk the document.")
  @example(ChunkingStrategy.Sentence)
  chunking_strategy: ChunkingStrategy;

  @doc("Max Sentences per Chunk (only used for chunking type 'sentence')")
  @example("80")
  max_sentences_per_chunk: string;

  @doc("Split on Newlines (only used for chunking type 'sentence')")
  @example(true)
  split_newlines: boolean;

  @doc("Overlap Size (only used for chunking type 'sliding')")
  @example("10")
  overlap_size: string;

  @doc("Chunk Size (only used for chunking type 'sliding')")
  @example("50")
  chunk_size: string;

  @doc("Number of Chunks in the Document.")
  @example(2345)
  number_of_chunks: integer;

  @doc("Document Creation Date.")
  @example(utcDateTime.fromISO("2024-05-06T12:20-12Z"))
  created_at: utcDateTime;

  @doc("Document Update Date.")
  @example(utcDateTime.fromISO("2024-05-06T12:20-12Z"))
  updated_at: utcDateTime;
}

model Chunk {
  @doc("A search result.")
  @example("Cristiano Ronaldo is the highest-paid football player in the world in 2024")
  text: string;

  @doc("Unique ID of the Document.")
  @example("acaa5c49-be5e-4477-bce0-48f4b23b7720")
  document_id: docid;
}

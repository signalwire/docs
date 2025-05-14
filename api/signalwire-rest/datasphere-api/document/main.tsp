import "@typespec/http";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "./models/errors.tsp";
import "../../types";

using TypeSpec.Http;
using Types.StatusCodes;

namespace DatasphereAPI.Documents {
  @route("/documents")
  @tag("Documents")
  interface Documents {
    @doc("A list of Datasphere Documents")
    @summary("List Documents")
    list():
      DocumentListResponse |
      StatusCode401 |
      StatusCode404;

    @doc("Creates a Datasphere Document")
    @summary("Create a Document")
    @post create(@body body: DocumentCreateRequest):
      { @statusCode statusCode: 201; @body document: Document; } |
      StatusCode401 |
      StatusCode404 |
      CreateStatusCode422;

    @doc("Updates a Datasphere Document by ID")
    @summary("Update a Document")
    @patch update(...PathID, ...MergePatchUpdate<DocumentUpdateRequest>): {
      @statusCode statusCode: 200; @body document: Document;
    } |
      StatusCode401 |
      StatusCode404 |
      SearchStatusCode422;

    @doc("Deletes a Datasphere Document by ID")
    @summary("Delete a Document")
    @delete delete(...PathID):
      { @statusCode statusCode: 204; } |
      StatusCode401 |
      StatusCode404;

    @doc("Search Datasphere Documents")
    @route("/search")
    @summary("Search Documents")
    @post search(...DocumentSearchRequest):
      Chunk[] |
      StatusCode401 |
      StatusCode404 |
      SearchStatusCode422;
    }
}

namespace DatasphereAPI.Chunks {
  @route("/documents/{documentId}/chunks")
  @tag("Chunks")
  @friendlyName("Chunks")

  interface Chunks {
    @doc("A list of chunks for a Datasphere Document.")
    @summary("List Chunks")
    list(...DocumentPathID):
      ChunkListResponse |
      StatusCode401 |
      StatusCode404;

    @doc("Retrieves a specific chunk for a Datasphere Document by ID.")
    @summary("Retrieve Chunk")
    @route("/{chunkId}")
    get(...ChunkPathID):
      ChunkResponse |
      StatusCode401 |
      StatusCode404;

    @doc("Deletes a specific chunk for a Datasphere Document by ID.")
    @summary("Delete Chunk")
    @route("/{chunkId}")
    @delete delete(...ChunkPathID):
      { @statusCode statusCode: 204; } |
      StatusCode401 |
      StatusCode404;
    }
}

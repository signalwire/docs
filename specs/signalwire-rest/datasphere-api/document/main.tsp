import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "./models/errors.tsp";
import "../../types";
import "../../../_shared/alias/token-permissions.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using Types.StatusCodes;

namespace SignalWireAPI.Datasphere.Documents {
  @route("/documents")
  @tag(DOCUMENTS_TAG)
  interface Documents {
    @operationId("list_documents")
    @doc("""
      Lists the source documents added to the project's Datasphere knowledge store. Use it to inventory material available to AI applications and monitor whether it is ready for retrieval. To find passages relevant to a question rather than browse documents, use [Search documents](/docs/apis/rest/documents/search-documents).
      
      ${tokenPermissions<"_DataSphere_">}
      """)
    @summary("List documents")
    list(...DocumentListQuery):
      | DocumentListResponse
      | StatusCode400
      | StatusCode401
      | ListStatusCode422
      | StatusCode500;

    @operationId("get_document")
    @doc("""
      Retrieves one source document from the project's Datasphere knowledge store by ID. Use it to check a known document and its readiness for retrieval; use [List documents](/docs/apis/rest/documents/list-documents) to discover IDs or [Search documents](/docs/apis/rest/documents/search-documents) to find relevant passages.
      
      ${tokenPermissions<"_DataSphere_">}
      """)
    @summary("Get document")
    @route("/{id}")
    get(...PathID):
      | {
          @statusCode statusCode: 200;
          @body document: Document;
        }
      | StatusCode400
      | StatusCode401
      | StatusCode404
      | StatusCode500;

    @operationId("create_document")
    @doc("""
      Ingests a document from the supplied URL, applies the selected chunking strategy, and creates its Datasphere record. Use it when adding source material for later semantic retrieval; use [Search documents](/docs/apis/rest/documents/search-documents) after ingestion, or [List documents](/docs/apis/rest/documents/list-documents) to monitor processing status.
      
      ${tokenPermissions<"_DataSphere_">}
      """)
    @summary("Create document")
    @post
    create(@body body: DocumentCreateRequest):
      | {
          @statusCode statusCode: 201;
          @body document: Document;
        }
      | StatusCode400
      | StatusCode401
      | CreateStatusCode422
      | StatusCode500;

    @operationId("update_document")
    @doc("""
      Changes the tags used to organize a Datasphere document and constrain knowledge retrieval. This operation does not replace the source URL or reconfigure chunking. Search document content through [Search documents](/docs/apis/rest/documents/search-documents).
      
      ${tokenPermissions<"_DataSphere_">}
      """)
    @summary("Update document")
    @patch
    update(...PathID, ...DocumentUpdateRequest):
      | {
          @statusCode statusCode: 200;
          @body document: Document;
        }
      | StatusCode400
      | StatusCode401
      | StatusCode404
      | UpdateStatusCode422
      | StatusCode500;

    @operationId("delete_document")
    @doc("""
      Deletes a Datasphere document and its stored chunks by document ID. Use it when the source should no longer be available for semantic retrieval; use [Delete chunk](/docs/apis/rest/chunks/delete-document-chunk) when only one generated chunk should be removed.
      
      ${tokenPermissions<"_DataSphere_">}
      """)
    @summary("Delete document")
    @delete
    delete(...PathID):
      | {
          @statusCode statusCode: 204;
        }
      | StatusCode400
      | StatusCode401
      | StatusCode404
      | StatusCode500;

    @operationId("search_documents")
    @doc("""
      Finds passages in the project's Datasphere knowledge store that are semantically relevant to a query. Use the results as grounded context for an AI application; use [List documents](/docs/apis/rest/documents/list-documents) to browse the source documents instead.
      
      ${tokenPermissions<"_DataSphere_">}
      """)
    @route("/search")
    @summary("Search documents")
    @post
    search(...DocumentSearchRequest):
      | SearchResponse
      | StatusCode400
      | StatusCode401
      | SearchStatusCode422
      | StatusCode500;
  }
}

namespace SignalWireAPI.Datasphere.Chunks {
  @route("/documents/{documentId}/chunks")
  @tag(CHUNKS_TAG)
  @friendlyName("Chunks")
  interface Chunks {
    @operationId("list_document_chunks")
    @doc("""
      Lists the searchable passages generated from one Datasphere document. Use it to inspect how a known source was divided for retrieval; use [Search documents](/docs/apis/rest/documents/search-documents) to find passages by semantic relevance.
      
      ${tokenPermissions<"_DataSphere_">}
      """)
    @summary("List chunks")
    list(...DocumentPathID, ...ChunkListQuery):
      | ChunkListResponse
      | StatusCode400
      | StatusCode401
      | StatusCode404
      | ListStatusCode422
      | StatusCode500;

    @operationId("get_document_chunk")
    @doc("""
      Retrieves one generated chunk by document and chunk IDs. Use it to inspect a known stored passage; use [List chunks](/docs/apis/rest/chunks/list-document-chunks) to discover chunk IDs or [Search documents](/docs/apis/rest/documents/search-documents) when starting from a natural-language query.
      
      ${tokenPermissions<"_DataSphere_">}
      """)
    @summary("Get chunk")
    @route("/{chunkId}")
    get(...ChunkPathID):
      | ChunkResponse
      | StatusCode400
      | StatusCode401
      | StatusCode404
      | StatusCode500;

    @operationId("delete_document_chunk")
    @doc("""
      Deletes one generated chunk from a Datasphere document by document and chunk IDs. Use it to exclude a specific passage from future retrieval without deleting the whole document; use [Delete document](/docs/apis/rest/documents/delete-document) to remove the document and all of its chunks.
      
      ${tokenPermissions<"_DataSphere_">}
      """)
    @summary("Delete chunk")
    @route("/{chunkId}")
    @delete
    delete(...ChunkPathID):
      | {
          @statusCode statusCode: 204;
        }
      | StatusCode400
      | StatusCode401
      | StatusCode404
      | StatusCode500;
  }
}

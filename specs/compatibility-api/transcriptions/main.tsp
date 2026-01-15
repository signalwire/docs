import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/responses.tsp";
import "../_shared/errors.tsp";
import "../tags.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;

@route("/Accounts/{AccountSid}/Transcriptions")
namespace CompatibilityAPI.Transcriptions {
  @tag(TRANSCRIPTIONS_TAG)
  @friendlyName("Recording Transcriptions")
  interface Transcriptions {
    @operationId("list_transcriptions")
    @summary("List all Transcriptions")
    @doc("""
      List all transcriptions.

      #### Permissions
      The API token must include the following scopes: _Voice_.
      """)
    list(...TranscriptionsAccountSidPath): TranscriptionListResponse | CompatibilityStatusCode401;

    @operationId("retrieve_transcription")
    @summary("Retrieve a Transcription.")
    @doc("""
      Retrieve a single recording transcription.

      #### Permissions
      The API token must include the following scopes: _Voice_.
      """)
    @route("/{Sid}")
    read(...TranscriptionsAccountSidPath, ...TranscriptionSidPath): TranscriptionResponse | CompatibilityStatusCode401 | CompatibilityStatusCode404;

    @operationId("delete_transcription")
    @summary("Delete a Recording Transcription.")
    @doc("""
      Delete a recording transcription from your account. If the delete is successful, a 204 response, with no body, will be returned.

      #### Permissions
      The API token must include the following scopes: _Voice_.
      """)
    @delete
    @route("/{Sid}")
    delete(...TranscriptionsAccountSidPath, ...TranscriptionSidPath): CompatibilityStatusCode204 | CompatibilityStatusCode401 | CompatibilityStatusCode404;
  }
}

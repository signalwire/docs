import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/responses.tsp";
import "./models/webhooks.tsp";
import "../_shared/errors.tsp";
import "../tags.tsp";
import "../../_shared/alias/token-permissions.tsp";

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
      Lists saved text transcriptions created from the account's voice recordings. Each transcription has a SID used for retrieval or deletion. For live call transcription commands rather than saved recording transcripts, use the [Calling API](/docs/apis/rest/calls/call-commands). Results are ordered by creation date, newest first.
      
      ${tokenPermissions<"_Voice_">}
      """)
    list(
      ...TranscriptionsAccountSidPath,

      @query
      @doc("Filter by transcriptions created on this exact date (RFC 2822 format).")
      @example("Wed, 26 Sep 2018 00:00:00 +0000")
      DateCreated?: string,

      @query("DateCreated<")
      @doc("Filter by transcriptions created before this date (RFC 2822 format).")
      @example("Thu, 27 Sep 2018 00:00:00 +0000")
      DateCreatedBefore?: string,

      @query("DateCreated>")
      @doc("Filter by transcriptions created after this date (RFC 2822 format).")
      @example("Tue, 25 Sep 2018 00:00:00 +0000")
      DateCreatedAfter?: string,

      @query
      @doc("The page number to retrieve (zero-indexed).")
      @minValue(0)
      @example(0)
      Page?: int32 = 0,

      @query
      @doc("The number of results per page. Default is 50, maximum is 1000.")
      @minValue(1)
      @maxValue(1000)
      @example(50)
      PageSize?: int32 = 50,

      @query
      @doc("Token for cursor-based pagination. Required when navigating to pages beyond the first.")
      @example("PAb3877c40-da60-4998-90ad-b792e98472tr")
      PageToken?: string,
    ):
      | TranscriptionListResponse
      | CompatibilityStatusCode400
      | CompatibilityStatusCode401
      | CompatibilityStatusCode422;

    @operationId("retrieve_transcription")
    @summary("Retrieve a Transcription")
    @doc("""
      Retrieves one saved recording transcription by SID so you can inspect the resulting text and processing outcome. Use [List all Transcriptions](/docs/compatibility-api/rest/recording-transcriptions/list-transcriptions) to discover SIDs; this is not a live transcription stream.
      
      ${tokenPermissions<"_Voice_">}
      """)
    @route("/{Sid}")
    read(...TranscriptionsAccountSidPath, ...TranscriptionSidPath):
      | TranscriptionResponse
      | CompatibilityStatusCode400
      | CompatibilityStatusCode401
      | CompatibilityStatusCode404;

    @operationId("delete_transcription")
    @summary("Delete a Recording Transcription")
    @doc("""
      Deletes one saved recording transcription from the account and returns no body on success. This removes the transcript without deleting its source recording. Live Calling API transcription is controlled through call commands instead.
      
      ${tokenPermissions<"_Voice_">}
      """)
    @delete
    @route("/{Sid}")
    delete(...TranscriptionsAccountSidPath, ...TranscriptionSidPath):
      | CompatibilityStatusCode204
      | CompatibilityStatusCode400
      | CompatibilityStatusCode401
      | CompatibilityStatusCode404
      | CompatibilityStatusCode422;
  }
}

import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "../_shared/errors.tsp";
import "../tags.tsp";
import "../../_shared/alias/token-permissions.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;

@route("/Accounts/{AccountSid}/Faxes")
namespace CompatibilityAPI.Faxes {
  @tag(FAXES_TAG)
  @friendlyName("Faxes")
  interface Faxes {
    @operationId("list_all_faxes")
    @summary("List all Faxes")
    @doc("""
      Lists the account's fax resources. Each fax has a SID used for delivery inspection, cancellation, deletion, or media access. Use [Fax logs](/docs/apis/rest/fax-logs/list-fax-logs) for read-only historical reporting.
      
      ${tokenPermissions<"_Fax_">}
      """)
    list(
      ...FaxesAccountSidPath,

      @query
      @doc("The page index to retrieve. Zero-indexed.")
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
      @doc("Token for cursor-based pagination. Required when Page > 0.")
      @example("PAb3877c40da604998")
      PageToken?: string,

      @query
      @doc("The date, in ISO 8601 format, after which the fax was sent.")
      @example("2024-01-01T00:00:00Z")
      DateCreatedAfter?: string,

      @query
      @doc("The date, in ISO 8601 format, on or before which the fax was sent.")
      @example("2024-12-31T23:59:59Z")
      DateCreatedOnOrBefore?: string,

      @query
      @doc("The phone number, in E.164 format, the fax was sent from.")
      @example("+15551234567")
      From?: string,

      @query
      @doc("The phone number, in E.164 format, the fax was sent to.")
      @example("+15559876543")
      To?: string,
    ):
      | FaxListResponse
      | CompatibilityStatusCode400
      | CompatibilityStatusCode401
      | CompatibilityStatusCode422;

    @operationId("send_fax")
    @summary("Send a Fax")
    @doc("""
      Queues a fax from a SignalWire number to a destination number using a document at the supplied media URL. Use [Retrieve a Fax](/docs/compatibility-api/rest/faxes/retrieve-fax) to inspect its current status or [Update a Fax](/docs/compatibility-api/rest/faxes/update-fax) to cancel it while queued. The native Fax Logs API is read-only and cannot send faxes.
      
      ${tokenPermissions<"_Fax_">}
      """)
    @post
    create(
      ...FaxesAccountSidPath,
      @header contentType: "application/x-www-form-urlencoded",
      @body body: SendFaxRequest,
    ):
      | FaxResponse
      | CompatibilityStatusCode400
      | CompatibilityStatusCode401
      | CompatibilityStatusCode422;

    @operationId("retrieve_fax")
    @summary("Retrieve a Fax")
    @doc("""
      Retrieves one managed fax by SID so you can inspect its delivery progress, result, and document media. Use [List all Faxes](/docs/compatibility-api/rest/faxes/list-all-faxes) to discover SIDs; use [Get fax log](/docs/apis/rest/fax-logs/get-fax-log) when you only need a historical log entry.
      
      ${tokenPermissions<"_Fax_">}
      """)
    @route("/{Sid}")
    read(...FaxesAccountSidPath, ...FaxSidPath):
      | FaxResponse
      | CompatibilityStatusCode400
      | CompatibilityStatusCode401
      | CompatibilityStatusCode404;

    @operationId("update_fax")
    @summary("Update a Fax")
    @doc("""
      Cancels a fax while it is still in `queued` status. Faxes that have begun processing, sending, or receiving cannot be canceled with this operation. Fax Logs are read-only and cannot change delivery state.
      
      ${tokenPermissions<"_Fax_">}
      """)
    @post
    @route("/{Sid}")
    update(
      ...FaxesAccountSidPath,
      ...FaxSidPath,
      @header contentType: "application/x-www-form-urlencoded",
      @body body: UpdateFaxRequest,
    ):
      | FaxResponse
      | CompatibilityStatusCode400
      | CompatibilityStatusCode401
      | CompatibilityStatusCode404
      | CompatibilityStatusCode422;

    @operationId("delete_fax")
    @summary("Delete a Fax")
    @doc("""
      Deletes a managed fax by SID. A fax cannot be deleted while it is processing, sending, or receiving; cancel a still-queued fax first when appropriate. This removes the fax resource, while [Fax logs](/docs/apis/rest/fax-logs/list-fax-logs) provide the read-only historical view.
      
      ${tokenPermissions<"_Fax_">}
      """)
    @delete
    @route("/{Sid}")
    delete(...FaxesAccountSidPath, ...FaxSidPath):
      | CompatibilityStatusCode204
      | CompatibilityStatusCode400
      | CompatibilityStatusCode401
      | CompatibilityStatusCode404
      | CompatibilityStatusCode409;
  }

  @tag(FAX_MEDIA_TAG)
  @friendlyName("Fax Media")
  @route("/{FaxSid}/Media")
  interface FaxMedia {
    @operationId("list_all_fax_media")
    @summary("List Fax Media")
    @doc("""
      Returns the document media associated with one fax. Use it when a fax SID is known and you need the media SID or metadata; [Message Media](/docs/compatibility-api/rest/message-media/list-media) contains MMS attachments and is a separate collection.
      
      ${tokenPermissions<"_Fax_">}
      """)
    list(
      ...FaxesAccountSidPath,
      ...FaxSidPathForMedia,

      @query
      @doc("The page index to retrieve. Zero-indexed.")
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
      @doc("Token for cursor-based pagination. Required when Page > 0.")
      @example("PAb3877c40da604998")
      PageToken?: string,
    ):
      | FaxMediaListResponse
      | CompatibilityStatusCode400
      | CompatibilityStatusCode401
      | CompatibilityStatusCode404
      | CompatibilityStatusCode422;

    @operationId("retrieve_medias")
    @summary("Retrieve Fax Media")
    @doc("""
      Retrieves one document-media resource by fax SID and media SID. Use [List Fax Media](/docs/compatibility-api/rest/fax-media/list-all-fax-media) to discover media SIDs; this endpoint does not return MMS attachments or voice recordings.
      
      ${tokenPermissions<"_Fax_">}
      """)
    @route("/{Sid}")
    read(...FaxesAccountSidPath, ...FaxSidPathForMedia, ...FaxSidPath):
      | FaxMediaResponse
      | CompatibilityStatusCode400
      | CompatibilityStatusCode401
      | CompatibilityStatusCode404;

    @operationId("delete_fax_media")
    @summary("Delete Fax Media")
    @doc("""
      Deletes one document-media resource from a fax. Media cannot be deleted while the parent fax is queued, processing, sending, or receiving. This removes the media without deleting the fax record itself; MMS attachments use Message Media operations.
      
      ${tokenPermissions<"_Fax_">}
      """)
    @delete
    @route("/{Sid}")
    delete(...FaxesAccountSidPath, ...FaxSidPathForMedia, ...FaxSidPath):
      | CompatibilityStatusCode204
      | CompatibilityStatusCode400
      | CompatibilityStatusCode401
      | CompatibilityStatusCode404
      | CompatibilityStatusCode409;
  }
}

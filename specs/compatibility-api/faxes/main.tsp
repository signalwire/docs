import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "../_shared/errors.tsp";
import "../tags.tsp";

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
      List all faxes.

      #### Permissions
      The API token must include the following scopes: _Fax_.
      """)
    list(
      ...FaxesAccountSidPath,
      @query @doc("The date, in ISO 8601 format, after which the fax was sent.") DateCreatedAfter?: string,
      @query @doc("The date, in ISO 8601 format, on or before which the fax was sent.") DateCreatedOnOrBefore?: string,
      @query @doc("The phone number, in E.164 format, the fax was sent from.") From?: string,
      @query @doc("The phone number, in E.164 format, the fax was sent to.") To?: string,
    ): FaxListResponse | StatusCode401;

    @operationId("send_fax")
    @summary("Send a Fax")
    @doc("""
      Send a fax.

      #### Permissions
      The API token must include the following scopes: _Fax_.
      """)
    @post
    create(
      ...FaxesAccountSidPath,
      @header contentType: "application/x-www-form-urlencoded",
      @body body: SendFaxRequest,
    ): FaxResponse | StatusCode401 | StatusCode400;

    @operationId("retrieve_fax")
    @summary("Retrieve a fax.")
    @doc("""
      Retrieve a fax.

      #### Permissions
      The API token must include the following scopes: _Fax_.
      """)
    @route("/{Sid}")
    read(...FaxesAccountSidPath, ...FaxSidPath): FaxResponse | StatusCode401 | StatusCode404;

    @operationId("update_fax")
    @summary("Update a fax")
    @doc("""
      Allows you to modify the properties of Fax.

      #### Permissions
      The API token must include the following scopes: _Fax_.
      """)
    @post
    @route("/{Sid}")
    update(
      ...FaxesAccountSidPath,
      ...FaxSidPath,
      @header contentType: "application/x-www-form-urlencoded",
      @body body: UpdateFaxRequest,
    ): FaxResponse | StatusCode401 | StatusCode404;

    @operationId("delete_fax")
    @summary("Delete a Fax")
    @doc("""
      Delete a fax.

      #### Permissions
      The API token must include the following scopes: _Fax_.
      """)
    @delete
    @route("/{Sid}")
    delete(...FaxesAccountSidPath, ...FaxSidPath): StatusCode204 | StatusCode401 | StatusCode404;
  }

  @tag(FAX_MEDIA_TAG)
  @friendlyName("Fax Media")
  @route("/{FaxSid}/Media")
  interface FaxMedia {
    @operationId("list_all_fax_media")
    @summary("List Fax Media")
    @doc("""
      List all media for a fax.

      #### Permissions
      The API token must include the following scopes: _Fax_.
      """)
    list(...FaxesAccountSidPath, ...FaxSidPathForMedia): FaxMediaListResponse | StatusCode401;

    @operationId("retrieve_medias")
    @summary("Retrieve Fax Media")
    @doc("""
      Retrieve media for a fax.

      #### Permissions
      The API token must include the following scopes: _Fax_.
      """)
    @route("/{Sid}")
    read(...FaxesAccountSidPath, ...FaxSidPathForMedia, ...FaxSidPath): FaxMediaResponse | StatusCode401 | StatusCode404;

    @operationId("delete_fax_media")
    @summary("Delete Fax Media")
    @doc("""
      Delete media for a fax.

      #### Permissions
      The API token must include the following scopes: _Fax_.
      """)
    @delete
    @route("/{Sid}")
    delete(...FaxesAccountSidPath, ...FaxSidPathForMedia, ...FaxSidPath): StatusCode204 | StatusCode401 | StatusCode404;
  }
}

import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "../_shared/errors.tsp";
import "../tags.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;

@route("/Accounts/{AccountSid}/LamlBins")
namespace CompatibilityAPI.LamlBins {
  @tag(LAML_BINS_TAG)
  @friendlyName("cXML Bins")
  interface LamlBins {
    @operationId("list_cxml_applications")
    @summary("List All cXML Bins")
    @doc("""
      Returns a list of your cXML Bins. The bins are returned sorted by creation date, with the most recent appearing first.

      #### Permissions
      The API token must include one of the following scopes: _Voice_ or _Messaging_ or _Fax_.
      """)
    list(
      ...LamlBinsAccountSidPath,
      @query @doc("A friendly name given to the cXML bin.") @example("Death Star IVR") Name?: string,
    ): LamlBinListResponse | StatusCode401;

    @operationId("create_cxml_application")
    @summary("Create an cXML Bin")
    @doc("""
      Create an cXML bin.

      #### Permissions
      The API token must include one of the following scopes: _Voice_ or _Messaging_ or _Fax_.
      """)
    @post
    create(
      ...LamlBinsAccountSidPath,
      @header contentType: "application/x-www-form-urlencoded",
      @body body: CreateLamlBinRequest,
    ): LamlBinResponse | StatusCode401 | StatusCode400;

    @operationId("retrieve_cxml_application")
    @summary("Retrieve a cXML Bin")
    @doc("""
      Retrieve a cXML bin.

      #### Permissions
      The API token must include one of the following scopes: _Voice_ or _Messaging_ or _Fax_.
      """)
    @route("/{Sid}")
    read(...LamlBinsAccountSidPath, ...LamlBinSidPath): LamlBinResponse | StatusCode401 | StatusCode404;

    @operationId("update_cxml_application")
    @summary("Update a cXML Bin")
    @doc("""
      Update a cXML bin.

      #### Permissions
      The API token must include one of the following scopes: _Voice_ or _Messaging_ or _Fax_.
      """)
    @post
    @route("/{Sid}")
    update(
      ...LamlBinsAccountSidPath,
      ...LamlBinSidPath,
      @header contentType: "application/x-www-form-urlencoded",
      @body body: UpdateLamlBinRequest,
    ): LamlBinResponse | StatusCode401 | StatusCode404;

    @operationId("delete_cxml_application")
    @summary("Delete a cXML Bin")
    @doc("""
      Delete a cXML bin.

      #### Permissions
      The API token must include one of the following scopes: _Voice_ or _Messaging_ or _Fax_.
      """)
    @delete
    @route("/{Sid}")
    delete(...LamlBinsAccountSidPath, ...LamlBinSidPath): StatusCode204 | StatusCode401 | StatusCode404;
  }
}

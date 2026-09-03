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

@route("/Accounts/{AccountSid}/LamlBins")
namespace CompatibilityAPI.CxmlScripts {
  @tag(CXML_SCRIPTS_TAG)
  @friendlyName("cXML Scripts")
  interface CxmlScripts {
    @operationId("list_cxml_scripts")
    @summary("List All cXML Scripts")
    @doc("""
      Lists the account's stored cXML scripts from the `LamlBins` collection. These scripts are also available as addressable [cXML Scripts](/docs/apis/rest/cxml-scripts/list-cxml-scripts) in the SignalWire REST API. Use these routes for integrations built around LamlBin SIDs, or [cXML Webhooks](/docs/apis/rest/cxml-webhook/list-cxml-webhooks) when your server generates instructions per request. Results are sorted by creation date, most recent first.
      
      ${tokenPermissions<"_Voice_ or _Messaging_ or _Fax_">}
      """)
    list(
      ...CxmlScriptsAccountSidPath,

      @query
      @doc("A friendly name given to the cXML script.")
      @example("Death Star IVR")
      Name?: string,

      @query
      @doc("The page number to retrieve. Default is 0.")
      @example(0)
      Page?: int32 = 0,

      @query
      @doc("The number of items per page. Default is 50, maximum is 1000.")
      @minValue(1)
      @maxValue(1000)
      @example(50)
      PageSize?: int32 = 50,

      @query
      @doc("The token for cursor-based pagination. Must start with 'PA' or 'PB'.")
      @example("PAb3877c40da604998")
      PageToken?: string,
    ):
      | CxmlScriptListResponse
      | CompatibilityStatusCode400
      | CompatibilityStatusCode401
      | CompatibilityStatusCode422;

    @operationId("create_cxml_script")
    @summary("Create a cXML Script")
    @doc("""
      Creates a stored cXML document through the `LamlBins` route. The new script is also available as an addressable cXML Script resource. Use this form-encoded route when existing code expects a LamlBin SID, [Create cXML Script](/docs/apis/rest/cxml-scripts/create-cxml-script) for a JSON request, or [Create cXML webhook](/docs/apis/rest/cxml-webhook/create-cxml-webhook) when instructions come from your server.
      
      ${tokenPermissions<"_Voice_ or _Messaging_ or _Fax_">}
      """)
    @post
    create(
      ...CxmlScriptsAccountSidPath,
      @header contentType: "application/x-www-form-urlencoded",
      @body body: CreateCxmlScriptRequest,
    ):
      | CxmlScriptCreatedResponse
      | CompatibilityStatusCode400
      | CompatibilityStatusCode401
      | CompatibilityStatusCode422;

    @operationId("retrieve_cxml_script")
    @summary("Retrieve a cXML Script")
    @doc("""
      Retrieves one stored cXML script by LamlBin SID. The same script can be read with [Get cXML Script](/docs/apis/rest/cxml-scripts/get-cxml-script), which addresses it by resource ID rather than SID.
      
      ${tokenPermissions<"_Voice_ or _Messaging_ or _Fax_">}
      """)
    @route("/{Sid}")
    read(...CxmlScriptsAccountSidPath, ...CxmlScriptSidPath):
      | CxmlScriptResponse
      | CompatibilityStatusCode400
      | CompatibilityStatusCode401
      | CompatibilityStatusCode404;

    @operationId("update_cxml_script")
    @summary("Update a cXML Script")
    @doc("""
      Changes the name or stored cXML document of a LamlBin by SID. The change is also visible through [Update cXML Script](/docs/apis/rest/cxml-scripts/update-cxml-script), because both operations manage the same script; server-backed [cXML Webhooks](/docs/apis/rest/cxml-webhook/update-cxml-webhook) are separate resources.
      
      ${tokenPermissions<"_Voice_ or _Messaging_ or _Fax_">}
      """)
    @post
    @route("/{Sid}")
    update(
      ...CxmlScriptsAccountSidPath,
      ...CxmlScriptSidPath,
      @header contentType: "application/x-www-form-urlencoded",
      @body body: UpdateCxmlScriptRequest,
    ):
      | CxmlScriptResponse
      | CompatibilityStatusCode400
      | CompatibilityStatusCode401
      | CompatibilityStatusCode404
      | CompatibilityStatusCode422;

    @operationId("delete_cxml_script")
    @summary("Delete a cXML Script")
    @doc("""
      Deletes a stored cXML script from the `LamlBins` collection by SID. This also removes its [cXML Script](/docs/apis/rest/cxml-scripts/delete-cxml-script) representation and resource addresses, so calls and messages can no longer reach it. Server-backed cXML Webhooks are separate resources and are not affected.
      
      ${tokenPermissions<"_Voice_ or _Messaging_ or _Fax_">}
      """)
    @delete
    @route("/{Sid}")
    delete(...CxmlScriptsAccountSidPath, ...CxmlScriptSidPath):
      | CompatibilityStatusCode204
      | CompatibilityStatusCode400
      | CompatibilityStatusCode401
      | CompatibilityStatusCode404
      | CompatibilityStatusCode422;
  }
}

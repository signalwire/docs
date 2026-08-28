import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "./models/errors.tsp";
import "./addresses";
import "../../types";
import "../tags.tsp";
import "../../../_shared/alias/token-permissions.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using Types.StatusCodes;

@route("/resources/cxml_scripts")
namespace SignalWireAPI.Fabric.CXMLScripts {
  @tag(CXML_SCRIPTS_TAG)
  @friendlyName("CXML Scripts")
  @summary("CXML Scripts")
  interface CXMLScripts {
    @operationId("list_cxml_scripts")
    @summary("List cXML Scripts")
    @doc("""
      Lists the project's addressable cXML Scripts, which store calling or messaging instructions in SignalWire. These are the same scripts the Compatibility API exposes as [LamlBins](/docs/compatibility-api/rest/cxml-scripts/list-cxml-scripts), addressed there by SID. Use [cXML Webhooks](/docs/apis/rest/cxml-webhook/list-cxml-webhooks) when your server must return cXML for each request, or [SWML Scripts](/docs/apis/rest/swml-scripts/list-swml-scripts) for SWML applications.
      
      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    list():
      | CXMLScriptListResponse
      | StatusCode401
      | StatusCode404
      | StatusCode500;

    @operationId("get_cxml_script")
    @summary("Get cXML Script")
    @doc("""
      Retrieves one stored cXML Script by resource ID. Use it when you know the Fabric resource ID; use [List cXML Scripts](/docs/apis/rest/cxml-scripts/list-cxml-scripts) to discover IDs. Integrations built around LamlBin SIDs can use Compatibility [Retrieve a cXML Script](/docs/compatibility-api/rest/cxml-scripts/retrieve-cxml-script).
      
      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    read(...CXMLScriptPathID):
      | {
          @statusCode statusCode: 200;
          @body cxml_script: CXMLScriptResponse;
        }
      | StatusCode401
      | StatusCode404
      | StatusCode500;

    @operationId("create_cxml_script")
    @summary("Create cXML Script")
    @doc("""
      Creates a resource that stores cXML instructions in SignalWire for a calling or messaging handler. Use it when the cXML can be managed as a Fabric resource; use [Create cXML webhook](/docs/apis/rest/cxml-webhook/create-cxml-webhook) when your server returns cXML per request, or Compatibility [Create a cXML Script](/docs/compatibility-api/rest/cxml-scripts/create-cxml-script) for a form-encoded LamlBin request.
      
      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    @post
    create(@body request: CXMLScriptCreateRequest):
      | {
          @statusCode statusCode: 200;
          @body cxml_script: CXMLScriptResponse;
        }
      | StatusCode401
      | StatusCode404
      | CXMLScriptCreateStatusCode422
      | StatusCode500;

    @operationId("update_cxml_script")
    @summary("Update cXML Script")
    @doc("""
      Changes a stored cXML Script while preserving its Fabric resource and addresses. The change is also visible through Compatibility [Update a cXML Script](/docs/compatibility-api/rest/cxml-scripts/update-cxml-script), which manages the same script by LamlBin SID. Use [Update cXML webhook](/docs/apis/rest/cxml-webhook/update-cxml-webhook) for a server-backed handler.
      
      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    @put
    update(...CXMLScriptPathID, @body request: CXMLScriptUpdateRequest):
      | {
          @statusCode statusCode: 200;
          @body cxml_script: CXMLScriptResponse;
        }
      | StatusCode401
      | StatusCode404
      | CXMLScriptUpdateStatusCode422
      | StatusCode500;

    @operationId("delete_cxml_script")
    @summary("Delete cXML Script")
    @doc("""
      Deletes a stored cXML Script resource by ID, including its addresses and corresponding Compatibility API LamlBin. Use it when the cXML should no longer be available as a Fabric handler; delete a [cXML Webhook](/docs/apis/rest/cxml-webhook/delete-cxml-webhook) separately when the handler fetches cXML from your server.
      
      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    @delete
    delete(...CXMLScriptPathID):
      | {
          @statusCode statusCode: 204;
        }
      | StatusCode401
      | StatusCode404
      | StatusCode500;
  }
}

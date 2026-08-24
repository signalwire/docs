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

@route("/resources/swml_scripts")
namespace SignalWireAPI.Fabric.SwmlScripts {
  @tag(SWML_SCRIPTS_TAG)
  @friendlyName("SWML Scripts")
  interface SwmlScripts {
    @operationId("list_swml_scripts")
    @summary("List SWML Scripts")
    @doc("""
      Returns the project's SWML Script resources, which store calling or messaging SWML in SignalWire. Use it to discover scripts before retrieving or changing one. Use [SWML Webhooks](/docs/apis/rest/swml-webhook/list-swml-webhooks) when your server must return SWML for each request, or [cXML Scripts](/docs/apis/rest/cxml-scripts/list-cxml-scripts) for applications written in cXML.
      
      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    list():
      | SwmlScriptListResponse[]
      | StatusCode401
      | StatusCode404
      | StatusCode500;

    @operationId("get_swml_script")
    @summary("Get SWML Script")
    @doc("""
      Retrieves one stored SWML Script by resource ID so you can inspect the instructions used by its calling or messaging handler. Use [List SWML Scripts](/docs/apis/rest/swml-scripts/list-swml-scripts) to discover IDs, or a [SWML Webhook](/docs/apis/rest/swml-webhook/create-swml-webhook) when instructions must come from your server at request time.
      
      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    read(...SwmlScriptPathID):
      | {
          @statusCode statusCode: 200;
          @body swml_script: SwmlScriptResponse;
        }
      | StatusCode401
      | StatusCode404
      | StatusCode500;

    @operationId("create_swml_script")
    @summary("Create SWML Script")
    @doc("""
      Creates a resource that stores a calling or messaging SWML document in SignalWire. Use it for versioned instructions that can run without fetching content from your server; choose [Create SWML webhook](/docs/apis/rest/swml-webhook/create-swml-webhook) when your server must generate different SWML for each request, or [Create cXML Script](/docs/apis/rest/cxml-scripts/create-cxml-script) for cXML applications.
      
      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    @post
    create(@body request: SwmlScriptCreateRequest):
      | {
          @statusCode statusCode: 200;
          @body swml_script: SwmlScriptResponse;
        }
      | StatusCode401
      | StatusCode404
      | SwmlScriptCreateStatusCode422
      | StatusCode500;

    @operationId("update_swml_script")
    @summary("Update SWML Script")
    @doc("""
      Changes a stored SWML Script while preserving the same Fabric resource and addresses. Use [Update SWML webhook](/docs/apis/rest/swml-webhook/update-swml-webhook) when the resource points to server-generated SWML instead.
      
      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    @put
    update(...SwmlScriptPathID, @body request: SwmlScriptUpdateRequest):
      | {
          @statusCode statusCode: 200;
          @body swml_script: SwmlScriptResponse;
        }
      | StatusCode401
      | StatusCode404
      | SwmlScriptUpdateStatusCode422
      | StatusCode500;

    @operationId("delete_swml_script")
    @summary("Delete SWML Script")
    @doc("""
      Deletes a stored SWML Script resource by ID. Use it when the hosted SWML should no longer be available as a call or message handler; deleting a [SWML Webhook](/docs/apis/rest/swml-webhook/delete-swml-webhook) or another handler resource requires that resource's endpoint.
      
      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    @delete
    delete(...SwmlScriptPathID):
      | {
          @statusCode statusCode: 204;
        }
      | StatusCode401
      | StatusCode404
      | StatusCode500;
  }
}

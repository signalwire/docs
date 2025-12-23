import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "./models/errors.tsp";
import "./addresses";
import "../../types";
import "../tags.tsp";

using TypeSpec.Http;
using Types.StatusCodes;

@route("/resources/cxml_scripts")
namespace FabricAPI.CXMLScripts {
  @tag(CXML_SCRIPTS_TAG)
  @friendlyName("CXML Scripts")
  @summary("CXML Scripts")
  interface CXMLScripts {
    @summary("List cXML Scripts")
    @doc("""
      A list of cXML Scripts

      #### Permissions

      The API token used to authenticate must have one of the following scopes enabled to make a successful request: _Voice_, _Messaging_, _Fax_, or _Video_.

      [Learn more about API scopes](/platform/dashboard/getting-started/your-signalwire-api-space#api-token-scopes).
      """)
    list():
      | CXMLScriptListResponse
      | StatusCode401
      | StatusCode404
      | StatusCode500;

    @summary("Get cXML Script")
    @doc("""
      Returns a cXML Script by ID

      #### Permissions

      The API token used to authenticate must have one of the following scopes enabled to make a successful request: _Voice_, _Messaging_, _Fax_, or _Video_.

      [Learn more about API scopes](/platform/dashboard/getting-started/your-signalwire-api-space#api-token-scopes).
      """)
    read(...CXMLScriptPathID):
      | {
          @statusCode statusCode: 200;
          @body cxml_script: CXMLScriptResponse;
        }
      | StatusCode401
      | StatusCode404
      | StatusCode500;

    @summary("Create cXML Script")
    @doc("""
      Creates a cXML Script

      #### Permissions

      The API token used to authenticate must have one of the following scopes enabled to make a successful request: _Voice_, _Messaging_, _Fax_, or _Video_.

      [Learn more about API scopes](/platform/dashboard/getting-started/your-signalwire-api-space#api-token-scopes).
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

    @summary("Update cXML Script")
    @doc("""
      Updates a cXML Script by ID

      #### Permissions

      The API token used to authenticate must have one of the following scopes enabled to make a successful request: _Voice_, _Messaging_, _Fax_, or _Video_.

      [Learn more about API scopes](/platform/dashboard/getting-started/your-signalwire-api-space#api-token-scopes).
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

    @summary("Delete cXML Script")
    @doc("""
      Deletes a cXML Script by ID

      #### Permissions

      The API token used to authenticate must have one of the following scopes enabled to make a successful request: _Voice_, _Messaging_, _Fax_, or _Video_.

      [Learn more about API scopes](/platform/dashboard/getting-started/your-signalwire-api-space#api-token-scopes).
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

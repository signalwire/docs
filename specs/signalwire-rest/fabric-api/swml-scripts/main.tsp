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

@route("/resources/swml_scripts")
namespace FabricAPI.SwmlScripts {
  @tag(SWML_SCRIPTS_TAG)
  @friendlyName("SWML Scripts")
  interface SwmlScripts {
    @summary("List SWML Scripts")
    @doc("""
      A list of SWML Scripts

      #### Permissions

      The API token used to authenticate must have one of the following scopes enabled to make a successful request: _Voice_, _Messaging_, _Fax_, or _Video_.

      [Learn more about API scopes](/platform/dashboard/getting-started/your-signalwire-api-space#api-token-scopes).
      """)
    list():
      | SwmlScriptListResponse[]
      | StatusCode401
      | StatusCode404
      | StatusCode500;

    @summary("Get SWML Script")
    @doc("""
      Returns a SWML Script by ID

      #### Permissions

      The API token used to authenticate must have one of the following scopes enabled to make a successful request: _Voice_, _Messaging_, _Fax_, or _Video_.

      [Learn more about API scopes](/platform/dashboard/getting-started/your-signalwire-api-space#api-token-scopes).
      """)
    read(...SwmlScriptPathID):
      | {
          @statusCode statusCode: 200;
          @body swml_script: SwmlScriptResponse;
        }
      | StatusCode401
      | StatusCode404
      | StatusCode500;

    @summary("Create SWML Script")
    @doc("""
      Creates a SWML Script

      #### Permissions

      The API token used to authenticate must have one of the following scopes enabled to make a successful request: _Voice_, _Messaging_, _Fax_, or _Video_.

      [Learn more about API scopes](/platform/dashboard/getting-started/your-signalwire-api-space#api-token-scopes).
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

    @summary("Update SWML Script")
    @doc("""
      Updates a SWML Script by ID

      #### Permissions

      The API token used to authenticate must have one of the following scopes enabled to make a successful request: _Voice_, _Messaging_, _Fax_, or _Video_.

      [Learn more about API scopes](/platform/dashboard/getting-started/your-signalwire-api-space#api-token-scopes).
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

    @summary("Delete SWML Script")
    @doc("""
      Deletes a SWML Script by ID

      #### Permissions

      The API token used to authenticate must have one of the following scopes enabled to make a successful request: _Voice_, _Messaging_, _Fax_, or _Video_.

      [Learn more about API scopes](/platform/dashboard/getting-started/your-signalwire-api-space#api-token-scopes).
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

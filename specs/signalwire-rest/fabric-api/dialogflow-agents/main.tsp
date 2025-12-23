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

@route("/resources/dialogflow_agents")
namespace FabricAPI.DialogflowAgents {
  @tag(AI_DIALOGFLOW_TAG)
  interface DialogflowAgents {
    @summary("List Dialogflow Agents")
    @doc("""
      A list of Dialogflow Agents

      #### Permissions

      The API token used to authenticate must have one of the following scopes enabled to make a successful request: _Voice_, _Messaging_, _Fax_, or _Video_.

      [Learn more about API scopes](/platform/dashboard/getting-started/your-signalwire-api-space#api-token-scopes).
      """)
    list():
      | DialogflowAgentListResponse
      | StatusCode401
      | StatusCode404
      | StatusCode500;

    @summary("Get Dialogflow Agent")
    @doc("""
      Returns a Dialogflow Agent by ID

      #### Permissions

      The API token used to authenticate must have one of the following scopes enabled to make a successful request: _Voice_, _Messaging_, _Fax_, or _Video_.

      [Learn more about API scopes](/platform/dashboard/getting-started/your-signalwire-api-space#api-token-scopes).
      """)
    read(...DialogflowAgentPathID):
      | {
          @statusCode statusCode: 200;
          @body dialogflow_agent: DialogflowAgentResponse;
        }
      | StatusCode401
      | StatusCode404
      | StatusCode500;

    @summary("Update Dialogflow Agent")
    @doc("""
      Updates a Dialogflow Agent by ID

      #### Permissions

      The API token used to authenticate must have one of the following scopes enabled to make a successful request: _Voice_, _Messaging_, _Fax_, or _Video_.

      [Learn more about API scopes](/platform/dashboard/getting-started/your-signalwire-api-space#api-token-scopes).
      """)
    @put
    update(
      ...DialogflowAgentPathID,
      @body request: DialogflowAgentUpdateRequest,
    ):
      | {
          @statusCode statusCode: 200;
          @body dialogflow_agent: DialogflowAgentResponse;
        }
      | StatusCode401
      | StatusCode404
      | DialogflowAgentUpdateStatusCode422
      | StatusCode500;

    @summary("Delete Dialogflow Agent")
    @doc("""
      Deletes a Dialogflow Agent by ID

      #### Permissions

      The API token used to authenticate must have one of the following scopes enabled to make a successful request: _Voice_, _Messaging_, _Fax_, or _Video_.

      [Learn more about API scopes](/platform/dashboard/getting-started/your-signalwire-api-space#api-token-scopes).
      """)
    @delete
    delete(...DialogflowAgentPathID):
      | {
          @statusCode statusCode: 204;
        }
      | StatusCode401
      | StatusCode404
      | StatusCode500;
  }
}

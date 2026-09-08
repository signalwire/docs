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

@route("/resources/dialogflow_agents")
namespace SignalWireAPI.Fabric.DialogflowAgents {
  @tag(AI_DIALOGFLOW_TAG)
  interface DialogflowAgents {
    @operationId("list_dialogflow_agents")
    @summary("List Dialogflow agents")
    @doc("""
      Lists the Dialogflow integrations represented as AI Agent resources in your SignalWire project. These resources let SignalWire route calls to conversational agents hosted in Dialogflow. Use [custom AI Agents](/docs/apis/rest/ai-agents/ai-agents-custom/list-ai-agents) when the conversational behavior is configured directly in SignalWire.
      
      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    list():
      | DialogflowAgentListResponse
      | StatusCode401
      | StatusCode404
      | StatusCode500;

    @operationId("get_dialogflow_agent")
    @summary("Get Dialogflow agent")
    @doc("""
      Retrieves one Dialogflow-backed AI Agent resource from your SignalWire project. Use [List Dialogflow agents](/docs/apis/rest/ai-agents/ai-agents-dialogflow/list-dialogflow-agents) to find these resources, or [Get AI agent](/docs/apis/rest/ai-agents/ai-agents-custom/get-ai-agent) for an agent configured directly in SignalWire.
      
      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    read(...DialogflowAgentPathID):
      | {
          @statusCode statusCode: 200;
          @body dialogflow_agent: DialogflowAgentResponse;
        }
      | StatusCode401
      | StatusCode404
      | StatusCode500;

    @operationId("update_dialogflow_agent")
    @summary("Update Dialogflow agent")
    @doc("""
      Updates how SignalWire connects to and presents a Dialogflow-backed AI Agent. This changes the linked resource in your SignalWire project, not the agent hosted in Dialogflow. Use [Update AI agent](/docs/apis/rest/ai-agents/ai-agents-custom/update-ai-agent) for an agent configured directly in SignalWire.
      
      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
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

    @operationId("delete_dialogflow_agent")
    @summary("Delete Dialogflow agent")
    @doc("""
      Deletes the linked Dialogflow Agent resource from your SignalWire project so calls can no longer reach that integration through SignalWire. This does not delete the agent hosted in Dialogflow. A [custom AI Agent](/docs/apis/rest/ai-agents/ai-agents-custom/delete-ai-agent) has its own delete operation.
      
      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
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

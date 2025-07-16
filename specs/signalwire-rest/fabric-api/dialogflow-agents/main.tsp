import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "./models/errors.tsp";
import "./addresses";
import "../../types";

using TypeSpec.Http;
using Types.StatusCodes;

@route("/resources/dialogflow_agents")
namespace FabricAPI.DialogflowAgents {
  @tag("AI Agents: Dialogflow")
  interface DialogflowAgents {
    @summary("List Dialogflow Agents")
    @doc("A list of Dialogflow Agents")
    list():
      DialogflowAgentListResponse |
      StatusCode401 |
      StatusCode404 |
      StatusCode500;

    @summary("Get Dialogflow Agent")
    @doc("Returns a Dialogflow Agent by ID")
    read(...DialogflowAgentPathID):
      { @statusCode statusCode: 200; @body dialogflow_agent: DialogflowAgentResponse; } |
      StatusCode401 |
      StatusCode404 |
      StatusCode500;


    @summary("Update Dialogflow Agent")
    @doc("Updates a Dialogflow Agent by ID")
    @put update(...DialogflowAgentPathID, @body request: DialogflowAgentUpdateRequest):
      { @statusCode statusCode: 200; @body dialogflow_agent: DialogflowAgentResponse; } |
      StatusCode401 |
      StatusCode404 |
      DialogflowAgentUpdateStatusCode422 |
      StatusCode500;

    @summary("Delete Dialogflow Agent")
    @doc("Deletes a Dialogflow Agent by ID")
    @delete delete(...DialogflowAgentPathID):
      { @statusCode statusCode: 204; } |
      StatusCode401 |
      StatusCode404 |
      StatusCode500;
    }
}
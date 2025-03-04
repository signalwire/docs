import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "./models/errors.tsp";
import "../../types";

using TypeSpec.Http;
using Types.StatusCodes;

@route("/resources/ai_agents")
namespace FabricAPI.AIAgents {
  @tag("AI Agents: Custom")
  @friendlyName("AI Agent")
  interface AIAgents {
    @summary("List AI Agents")
    @doc("A list of AI Agents")
    list():
      AIAgentListResponse |
      StatusCode401 |
      StatusCode404;

    @summary("Get AI Agent")
    @doc("Returns an AI Agent by ID")
    read(...AIAgentPathID):
      { @statusCode statusCode: 200; @body ai_agent: AIAgentResponse; } |
      StatusCode401 |
      StatusCode404;

    @summary("Create AI Agent")
    @doc("Creates an AI Agent")
    @post create(...AIAgentCreateRequest):
      { @statusCode statusCode: 201; @body ai_agent: AIAgentResponse; } |
      StatusCode401 |
      StatusCode404 |
      AIAgentCreateStatusCode422;

    @summary("Update AI Agent")
    @doc("Updates an AI Agent by ID")
    @patch update(...AIAgentPathID, ...AIAgentUpdateRequest):
      { @statusCode statusCode: 200; @body ai_agent: AIAgentResponse; } |
      StatusCode401 |
      StatusCode404 |
      AIAgentUpdateStatusCode422;

    @summary("Delete AI Agent")
    @doc("Deletes an AI Agent by ID")
    @delete delete(...AIAgentPathID):
      { @statusCode statusCode: 204; } |
      StatusCode401 |
      StatusCode404;
    }
}


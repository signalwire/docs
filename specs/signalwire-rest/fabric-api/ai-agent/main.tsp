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
using TypeSpec.OpenAPI;
using Types.StatusCodes;

@route("/resources/ai_agents")
namespace FabricAPI.AIAgents {
  @tag(AI_CUSTOM_TAG)
  @friendlyName("AI Agent: Custom")
  interface AIAgents {
    @operationId("list_ai_agents")
    @summary("List AI Agents")
    @doc("A list of AI Agents")
        list(): AIAgentListResponse | StatusCode401 | StatusCode404 | StatusCode500;

        @operationId("get_ai_agent")
        @summary("Get AI Agent")
        @doc("Returns an AI Agent by ID")
        read(...AIAgentPathID):
      | {
          @statusCode statusCode: 200;
          @body ai_agent: AIAgentResponse;
        }
      | StatusCode401
      | StatusCode404
          | StatusCode500;

        @operationId("create_ai_agent")
        @summary("Create AI Agent")
        @doc("Creates an AI Agent")
        @post
        create(...AIAgentCreateRequest):
      | {
          @statusCode statusCode: 201;
          @body ai_agent: AIAgentResponse;
        }
      | StatusCode401
      | StatusCode404
      | AIAgentCreateStatusCode422
          | StatusCode500;

        @operationId("update_ai_agent")
        @summary("Update AI Agent")
        @doc("Updates an AI Agent by ID")
        @patch(#{ implicitOptionality: true })
        update(...AIAgentPathID, ...AIAgentUpdateRequest):
      | {
          @statusCode statusCode: 200;
          @body ai_agent: AIAgentResponse;
        }
      | StatusCode401
      | StatusCode404
      | AIAgentUpdateStatusCode422
          | StatusCode500;

        @operationId("delete_ai_agent")
        @summary("Delete AI Agent")
        @doc("Deletes an AI Agent by ID")
        @delete
        delete(...AIAgentPathID):
      | {
          @statusCode statusCode: 204;
        }
      | StatusCode401
      | StatusCode404
      | StatusCode500;
  }
}

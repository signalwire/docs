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

@route("/resources/ai_agents")
namespace FabricAPI.AIAgents {
  @tag(AI_CUSTOM_TAG)
  @friendlyName("AI Agent: Custom")
  interface AIAgents {
    @summary("List AI Agents")
    @doc("""
      A list of AI Agents

      #### Permissions

      The API token used to authenticate must have one of the following scopes enabled to make a successful request: _Voice_, _Messaging_, _Fax_, or _Video_.

      [Learn more about API scopes](/platform/dashboard/getting-started/your-signalwire-api-space#api-token-scopes).
      """)
    list(): AIAgentListResponse | StatusCode401 | StatusCode404 | StatusCode500;

    @summary("Get AI Agent")
    @doc("""
      Returns an AI Agent by ID

      #### Permissions

      The API token used to authenticate must have one of the following scopes enabled to make a successful request: _Voice_, _Messaging_, _Fax_, or _Video_.

      [Learn more about API scopes](/platform/dashboard/getting-started/your-signalwire-api-space#api-token-scopes).
      """)
    read(...AIAgentPathID):
      | {
          @statusCode statusCode: 200;
          @body ai_agent: AIAgentResponse;
        }
      | StatusCode401
      | StatusCode404
      | StatusCode500;

    @summary("Create AI Agent")
    @doc("""
      Creates an AI Agent

      #### Permissions

      The API token used to authenticate must have one of the following scopes enabled to make a successful request: _Voice_, _Messaging_, _Fax_, or _Video_.

      [Learn more about API scopes](/platform/dashboard/getting-started/your-signalwire-api-space#api-token-scopes).
      """)
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

    @summary("Update AI Agent")
    @doc("""
      Updates an AI Agent by ID

      #### Permissions

      The API token used to authenticate must have one of the following scopes enabled to make a successful request: _Voice_, _Messaging_, _Fax_, or _Video_.

      [Learn more about API scopes](/platform/dashboard/getting-started/your-signalwire-api-space#api-token-scopes).
      """)
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

    @summary("Delete AI Agent")
    @doc("""
      Deletes an AI Agent by ID

      #### Permissions

      The API token used to authenticate must have one of the following scopes enabled to make a successful request: _Voice_, _Messaging_, _Fax_, or _Video_.

      [Learn more about API scopes](/platform/dashboard/getting-started/your-signalwire-api-space#api-token-scopes).
      """)
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

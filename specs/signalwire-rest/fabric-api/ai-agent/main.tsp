import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "./models/errors.tsp";
import "./addresses";
import "../../types";
import "../tags.tsp";
import "../_shared/examples.tsp";
import "../../../_shared/alias/token-permissions.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using Types.StatusCodes;

@route("/resources/ai_agents")
namespace SignalWireAPI.Fabric.AIAgents {
  @tag(AI_CUSTOM_TAG)
  @friendlyName("AI Agent: Custom")
  interface AIAgents {
    @operationId("list_ai_agents")
    @summary("List AI agents")
    @doc("""
      A list of AI Agents
      
      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    @opExample(
      #{
        returnType: #{
          data: #[AI_AGENT_RESPONSE_EXAMPLE],
          links: #{
            self: "https://example.signalwire.com/api/fabric/resources/ai_agents?page_number=0&page_size=50",
            first: "https://example.signalwire.com/api/fabric/resources/ai_agents?page_number=0&page_size=50",
          },
        },
      },
      #{ title: "AI agent list", description: "A page containing one AI agent." }
    )
    list(): AIAgentListResponse | StatusCode401 | StatusCode404 | StatusCode500;

    @operationId("get_ai_agent")
    @summary("Get AI agent")
    @doc("""
      Returns an AI Agent by ID
      
      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    @opExample(
      #{ returnType: #{ statusCode: 200, ai_agent: AI_AGENT_RESPONSE_EXAMPLE } },
      #{ title: "AI agent", description: "A customer support AI agent." }
    )
    read(...AIAgentPathID):
      | {
          @statusCode statusCode: 200;
          @body ai_agent: AIAgentResponse;
        }
      | StatusCode401
      | StatusCode404
      | StatusCode500;

    @operationId("create_ai_agent")
    @summary("Create AI agent")
    @doc("""
      Creates an AI Agent
      
      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    @opExample(
      #{
        parameters: AI_AGENT_EXAMPLE,
        returnType: #{ statusCode: 201, ai_agent: AI_AGENT_RESPONSE_EXAMPLE },
      },
      #{
        title: "Customer support agent",
        description: "Create an AI agent with a concise text prompt.",
      }
    )
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
    @summary("Update AI agent")
    @doc("""
      Updates an AI Agent by ID
      
      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    @opExample(
      #{
        parameters: #{
          id: "993ed018-9e79-4e50-b97b-984bd5534095",
          prompt: #{ text: "You are a concise customer support assistant." },
          agent_id: "a87db7ed-8ebe-42e4-829f-8ba5a4152f54",
          name: "Support Assistant",
        },
        returnType: #{ statusCode: 200, ai_agent: AI_AGENT_RESPONSE_EXAMPLE },
      },
      #{
        title: "Update the agent prompt",
        description: "Replace an AI agent's prompt while leaving its other settings unchanged.",
      }
    )
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
    @summary("Delete AI agent")
    @doc("""
      Deletes an AI Agent by ID
      
      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
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

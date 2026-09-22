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
      Lists the custom AI Agents in your SignalWire project. Each agent is a reusable Fabric resource that defines a conversational call experience and can be reached through resource addresses or assigned as a call handler. Use [Dialogflow Agents](/docs/apis/rest/ai-agents/ai-agents-dialogflow/list-dialogflow-agents) for linked Dialogflow integrations, or [Call Flows](/docs/apis/rest/call-flows/list-call-flows) for visual, deterministic call logic.
      
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
      Retrieves one custom AI Agent from your SignalWire project. Use it to review an agent that is configured directly in SignalWire; use [List AI agents](/docs/apis/rest/ai-agents/ai-agents-custom/list-ai-agents) to find agents, or [Get Dialogflow agent](/docs/apis/rest/ai-agents/ai-agents-dialogflow/get-dialogflow-agent) for a linked Dialogflow resource.
      
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
      Creates a custom AI Agent in your SignalWire project. The new agent becomes a reusable Fabric resource for conversational calls and can be reached through resource addresses or assigned as a call handler. Use a [Dialogflow Agent](/docs/apis/rest/ai-agents/ai-agents-dialogflow/list-dialogflow-agents) for an existing Dialogflow integration, or [Create call flow](/docs/apis/rest/call-flows/create-call-flow) for visual, deterministic call logic.
      
      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    @opExample(
      #{
        parameters: AI_AGENT_REQUEST_EXAMPLE,
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
      Updates how an existing custom AI Agent behaves in conversations. Use it for an agent configured directly in your SignalWire project; update a linked Dialogflow resource with [Update Dialogflow agent](/docs/apis/rest/ai-agents/ai-agents-dialogflow/update-dialogflow-agent).
      
      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    @opExample(
      #{
        parameters: #{
          id: "993ed018-9e79-4e50-b97b-984bd5534095",
          prompt: #{ text: "You are a concise customer support assistant." },
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
      Deletes a custom AI Agent from your SignalWire project so it can no longer be used as a conversational call handler. A linked [Dialogflow Agent](/docs/apis/rest/ai-agents/ai-agents-dialogflow/delete-dialogflow-agent) or a Call Flow must be deleted through its own operation.
      
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

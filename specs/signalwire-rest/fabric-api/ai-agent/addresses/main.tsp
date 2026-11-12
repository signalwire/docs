import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/responses.tsp";
import "../../../types";
import "../../tags.tsp";
import "../../../../_shared/alias/token-permissions.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using Types.StatusCodes;

@route("/resources/ai_agents/{ai_agent_id}/addresses")
namespace SignalWireAPI.Fabric.AIAgent.Addresses {
  @tag(AI_CUSTOM_TAG)
  interface AIAgentAddresses {
    @operationId("list_ai_agent_addresses")
    @summary("List AI agent Addresses")
    @doc("""
      Lists the resource addresses through which calls can reach one custom AI Agent in your SignalWire project. Use [List AI agents](/docs/apis/rest/ai-agents/ai-agents-custom/list-ai-agents) to find the agent resources themselves; linked Dialogflow Agents expose their addresses separately.
      
      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    list(...AIAgentIDPath):
      | AIAgentAddressListResponse
      | StatusCode401
      | StatusCode404
      | StatusCode500;
  }
}

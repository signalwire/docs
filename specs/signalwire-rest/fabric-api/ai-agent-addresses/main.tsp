import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/responses.tsp";
import "../../types";

using TypeSpec.Http;
using Types.StatusCodes;

@route("/resources/ai_agents/{ai_agent_id}/addresses")
namespace FabricAPI.AIAgentAddresses {
  @tag("AI Agents: Custom")
  interface AIAgentAddresses {
    @summary("List AI Agent Addresses")
    @doc("A list of AI Agent Addresses. This endpoint uses the bearer token authentication method with the SAT (Subscriber Access Token) which can be generated using the [Create Subscriber Token endpoint](/rest/signalwire-rest/endpoints/fabric/subscriber-tokens-create).")
    list(...AIAgentIDPath):
      AIAgentAddressListResponse |
      StatusCode401 |
      StatusCode404;
  }
}


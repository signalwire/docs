import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/responses.tsp";
import "../../../types";

using TypeSpec.Http;
using Types.StatusCodes;

@route("/resources/ai_agents/{ai_agent_id}/addresses")
namespace FabricAPI.AIAgent.Addresses {
  @tag("AI Agents: Custom")
  interface AIAgentAddresses {
    @summary("List AI Agent Addresses")
    @doc("This endpoint returns a list of addresses associated with a specific AI Agent.")
    list(...AIAgentIDPath):
      AIAgentAddressListResponse |
      StatusCode401 |
      StatusCode404 |
      StatusCode500;
  }
}


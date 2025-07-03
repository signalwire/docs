import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/responses.tsp";
import "../../types";

using TypeSpec.Http;
using Types.StatusCodes;

@route("/resources/ai_agents/{ai_agent_id}/addresses")
namespace FabricAPI.AIAgentAddresses {
  @tag("AI Agent")
  @friendlyName("AI Agent")
  interface AIAgentAddresses {
    @summary("List AI Agent Addresses")
    @doc("A list of AI Agent Addresses")
    list(...AIAgentIDPath):
      AIAgentAddressListResponse |
      StatusCode401 |
      StatusCode404;
  }
}


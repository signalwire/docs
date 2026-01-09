import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/responses.tsp";
import "../../../types";
import "../../tags.tsp";

using TypeSpec.Http;
using Types.StatusCodes;

@route("/resources/ai_agents/{ai_agent_id}/addresses")
namespace FabricAPI.AIAgent.Addresses {
  @tag(AI_CUSTOM_TAG)
  interface AIAgentAddresses {
    @summary("List AI Agent Addresses")
    @doc("""
      This endpoint returns a list of addresses associated with a specific AI Agent.

      #### Permissions

      The API token used to authenticate must have one of the following scopes enabled to make a successful request: _Voice_, _Messaging_, _Fax_, or _Video_.

      [Learn more about API scopes](/platform/dashboard/getting-started/your-signalwire-api-space#api-token-scopes).
      """)
    list(...AIAgentIDPath):
      | AIAgentAddressListResponse
      | StatusCode401
      | StatusCode404
      | StatusCode500;
  }
}

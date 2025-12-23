import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/responses.tsp";
import "../../../types";
import "../../tags.tsp";

using TypeSpec.Http;
using Types.StatusCodes;

@route("/resources/dialogflow_agents/{id}/addresses")
namespace FabricAPI.DialogflowAgent.Addresses {
  @tag(AI_DIALOGFLOW_TAG)
  interface DialogflowAgentAddresses {
    @summary("List Dialogflow Agent Addresses")
    @doc("""
      This endpoint returns a list of addresses associated with a specific Dialogflow Agent.

      #### Permissions

      The API token used to authenticate must have one of the following scopes enabled to make a successful request: _Voice_, _Messaging_, _Fax_, or _Video_.

      [Learn more about API scopes](/platform/dashboard/getting-started/your-signalwire-api-space#api-token-scopes).
      """)
    list(...DialogflowAgentAddressPathID):
      | DialogflowAgentAddressListResponse
      | StatusCode401
      | StatusCode404
      | StatusCode500;
  }
}

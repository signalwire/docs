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

@route("/resources/dialogflow_agents/{id}/addresses")
namespace SignalWireAPI.Fabric.DialogflowAgent.Addresses {
  @tag(AI_DIALOGFLOW_TAG)
  interface DialogflowAgentAddresses {
    @operationId("list_dialogflow_agent_addresses")
    @summary("List Dialogflow agent Addresses")
    @doc("""
      Lists the resource addresses through which calls can reach one Dialogflow-backed AI Agent in your SignalWire project. Use [List Dialogflow agents](/docs/apis/rest/ai-agents/ai-agents-dialogflow/list-dialogflow-agents) to find the linked resources themselves; custom SignalWire AI Agents expose their addresses separately.
      
      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    list(...DialogflowAgentAddressPathID):
      | DialogflowAgentAddressListResponse
      | StatusCode401
      | StatusCode404
      | StatusCode500;
  }
}

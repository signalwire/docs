import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/responses.tsp";
import "../../../types";

using TypeSpec.Http;
using Types.StatusCodes;

@route("/resources/dialogflow_agents/{id}/addresses")
namespace FabricAPI.DialogflowAgentAddresses {
  @tag("AI Agents: Dialogflow")
  interface DialogflowAgentAddresses {
    @summary("List Dialogflow Agent Addresses")
    @doc("A list of Dialogflow Agent Addresses. This endpoint uses the bearer token authentication method with the SAT (Subscriber Access Token) which can be generated using the [Create Subscriber Token endpoint](/rest/signalwire-rest/endpoints/fabric/subscriber-tokens-create).")
    list(...DialogflowAgentAddressPathID):
      DialogflowAgentAddressListResponse |
      StatusCode401 |
      StatusCode404;
  }
}
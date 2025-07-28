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
    @doc("This endpoint returns a list of addresses associated with a specific Dialogflow Agent.")
    list(...DialogflowAgentAddressPathID):
      | DialogflowAgentAddressListResponse
      | StatusCode401
      | StatusCode404
      | StatusCode500;
  }
}

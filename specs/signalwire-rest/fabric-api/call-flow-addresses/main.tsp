import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/responses.tsp";
import "../../types";

using TypeSpec.Http;
using Types.StatusCodes;

@route("/resources/call_flow/{id}/addresses")
namespace FabricAPI.CallFlowAddresses {
  @tag("Call Flows")
  interface CallFlowAddresses {
    @summary("List Call Flow Addresses")
    @doc("Returns a list of Call Flow addresses. This endpoint uses the bearer token authentication method with the SAT (Subscriber Access Token) which can be generated using the [Create Subscriber Token endpoint](/rest/signalwire-rest/endpoints/fabric/subscriber-tokens-create).")
    list(...CallFlowAddressPathID):
      CallFlowAddressListResponse |
      StatusCode401 |
      StatusCode404;
  }
}
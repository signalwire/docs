import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/responses.tsp";
import "../../../types";

using TypeSpec.Http;
using Types.StatusCodes;

@route("/resources/call_flow/{id}/addresses")
namespace FabricAPI.CallFlowAddresses {
  @tag("Call Flows")
  interface CallFlowAddresses {
    @summary("List Call Flow Addresses")
    @doc("Returns a list of Call Flow addresses.")
    list(...CallFlowAddressPathID):
      CallFlowAddressListResponse |
      StatusCode401 |
      StatusCode404;
  }
}

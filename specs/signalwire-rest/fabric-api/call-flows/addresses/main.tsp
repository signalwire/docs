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

@route("/resources/call_flow/{id}/addresses")
namespace SignalWireAPI.Fabric.CallFlow.Addresses {
  @tag(CALL_FLOWS_TAG)
  interface CallFlowAddresses {
    @operationId("list_call_flow_addresses")
    @summary("List call flow Addresses")
    @doc("""
      Returns the project-scoped resource addresses assigned to one Call Flow. Use these callable handles to see how calls can reach the deployed visual flow; use [List call flows](/docs/apis/rest/call-flows/list-call-flows) for the resources themselves, or the SWML Script address operation for directly authored stored SWML.
      
      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    list(...CallFlowAddressPathID):
      | CallFlowAddressListResponse
      | StatusCode401
      | StatusCode404
      | StatusCode500;
  }
}

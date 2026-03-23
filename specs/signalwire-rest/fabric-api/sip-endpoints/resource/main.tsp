import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "./models/errors.tsp";
import "../../../types";
import "../../tags.tsp";
import "../../../../_shared/alias/token-permissions.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using Types.StatusCodes;

@route("/resources/{id}/sip_endpoints")
namespace SignalWireAPI.Fabric.SipEndpoints.Resource {
  @tag(FABRIC_SIP_ENDPOINTS_TAG)
  interface ResourceSipEndpoints {
    @operationId("assign_resource_to_sip_credential")
    @summary("Assign Resource to SIP credential")
    @doc("""
      This endpoint assigns a specific resource to a SIP endpoint, allowing inbound calls to be handled by the resource.
      <Note>
      Currently only supports `calling` as a handler and automatically defaults to it.
      </Note>
      
      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    @post
    assign(
      ...ResourceSipEndpointPathID,
      @body request: ResourceSipEndpointAssignRequest,
    ):
      | {
          @statusCode statusCode: 200;
          @body sip_endpoint: ResourceSipEndpointResponse;
        }
      | StatusCode401
      | StatusCode404
      | ResourceSubSipEndpointCreateStatusCode422
      | StatusCode500;
  }
}

import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "./models/errors.tsp";
import "../../../types";
import "../../tags.tsp";

using TypeSpec.Http;
using Types.StatusCodes;

@route("/resources/{id}/sip_endpoints")
namespace FabricAPI.SipEndpoints.Resource {
  @tag(SIP_ENDPOINTS_TAG)
  interface ResourceSipEndpoints {
    @summary("Assign a Resource to a SIP endpoint")
    @doc("""
      This endpoint assigns a specific resource to a SIP endpoint, allowing inbound calls to be handled by the resource.
      :::important
      Currently only supports `calling` as a handler and automatically defaults to it.
      :::
      

      #### Permissions

      The API token used to authenticate must have one of the following scopes enabled to make a successful request: _Voice_, _Messaging_, _Fax_, or _Video_.

      [Learn more about API scopes](/platform/dashboard/getting-started/your-signalwire-api-space#api-token-scopes).
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

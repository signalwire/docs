import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "./models/errors.tsp";
import "../../../types";

using TypeSpec.Http;
using Types.StatusCodes;

@route("/resources/{id}/sip_endpoints")
namespace FabricAPI.Resource.SipEndpoints {
  @tag("Resources")
  interface ResourceSipEndpoints {
    @summary("Assign a Resource as Call handler on a SIP endpoint")
    @doc("Assigns a Resource as Call handler on a SIP endpoint. This is used to route calls to the Resource from a SIP endpoint.")
    @post create(...ResourceSipEndpointPathID, @body request: ResourceSipEndpointCreateRequest):
      { @statusCode statusCode: 200; @body sip_endpoint: ResourceSipEndpointResponse; } |
      StatusCode401 |
      StatusCode404 |
      ResourceSubSipEndpointCreateStatusCode422 |
      StatusCode500;
  }
}
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
namespace FabricAPI.ResourceSipEndpoints {
  @tag("Resources")
  interface ResourceSipEndpoints {
    @summary("Create Resource SIP Endpoint")
    @doc("Creates a SIP Endpoint for a specific resource")
    @post create(...ResourceSipEndpointPathID, @body request: ResourceSipEndpointCreateRequest):
      { @statusCode statusCode: 200; @body sip_endpoint: ResourceSipEndpointResponse; } |
      StatusCode401 |
      StatusCode404 |
      ResourceSubSipEndpointCreateStatusCode422;
  }
}
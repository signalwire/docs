import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "./models/errors.tsp";
import "../../types";
import "../tags.tsp";

using TypeSpec.Http;
using Types.StatusCodes;

@route("/resources/{id}/phone_routes")
namespace FabricAPI.PhoneRoutes {
  @tag(PHONE_ROUTES_TAG)
  @friendlyName("Phone Routes")
  interface PhoneRoutes {
    @summary("Assign a Resource to a Phone Route")
    @doc("""
    This endpoint assigns a specific resource to a phone route, allowing inbound calls & messages to be handled by the resource.
    """)
    @post assign(...PhoneRoutePathID, @body request: PhoneRouteAssignRequest):
      { @statusCode statusCode: 200; @body phone_route: PhoneRouteResponse; } |
      StatusCode401 |
      StatusCode404 |
      PhoneRouteCreateStatusCode422 |
      StatusCode500;
  }
}
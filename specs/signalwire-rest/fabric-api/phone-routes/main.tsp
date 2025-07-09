import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "./models/errors.tsp";
import "../../types";

using TypeSpec.Http;
using Types.StatusCodes;

@route("/resources/{id}/phone_routes")
namespace FabricAPI.PhoneRoutes {
  @tag("Resources")
  @friendlyName("Phone Routes")
  interface PhoneRoutes {
    @summary("Create Phone Route")
    @doc("Creates a Phone Route for a specific resource")
    @post create(...PhoneRoutePathID, @body request: PhoneRouteCreateRequest):
      { @statusCode statusCode: 201; @body phone_route: PhoneRouteResponse; } |
      StatusCode401 |
      StatusCode404 |
      PhoneRouteCreateStatusCode422;
  }
}
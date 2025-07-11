import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "./models/errors.tsp";
import "./addresses";
import "./sip-endpoints";
import "./domain-applications";
import "./phone-routes";
import "../../types";

using TypeSpec.Http;
using Types.StatusCodes;

@route("/resources")
namespace FabricAPI.Resources {
  @tag("Resources")
  @friendlyName("Resources")
  interface Resources {
    @summary("List Resources")
    @doc("A list of Fabric Resources")
    list():
      ResourceResponse[] |
      StatusCode401 |
      StatusCode404 |
      StatusCode500;

    @summary("Get Resource")
    @doc("Returns a Resource by ID")
    read(...ResourcePathID):
      { @statusCode statusCode: 200; @body resource: ResourceResponse; } |
      StatusCode401 |
      StatusCode404 |
      StatusCode500;

    @summary("Delete Resource")
    @doc("Deletes a Resource by ID")
    @delete delete(...ResourcePathID):
      { @statusCode statusCode: 204; } |
      StatusCode401 |
      StatusCode404 |
      StatusCode500;
    }
}
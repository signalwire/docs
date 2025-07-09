import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "./models/errors.tsp";
import "../../../types";

using TypeSpec.Http;
using Types.StatusCodes;

@route("/resources/{id}/domain_applications")
namespace FabricAPI.DomainApplications {
  @tag("Resources")
  interface DomainApplications {
    @summary("Create Domain Application")
    @doc("Creates a Domain Application for a specific resource")
    @post create(...DomainApplicationPathID, @body request: DomainApplicationCreateRequest):
      { @statusCode statusCode: 200; @body domain_application: DomainApplicationResponse; } |
      StatusCode401 |
      StatusCode404 |
      DomainApplicationCreateStatusCode422;
  }
}
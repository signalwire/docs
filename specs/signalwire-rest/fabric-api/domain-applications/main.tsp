import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "./models/errors.tsp";
import "../../types";

using TypeSpec.Http;
using Types.StatusCodes;

@route("/resources/{id}/domain_applications")
namespace FabricAPI.DomainApplications {
  @tag("Domain Applications")
  interface DomainApplications {
    @summary("Assign a resource as a call handler for a Domain Application.")
    @doc("""
    This endpoint assigns a specific resource to a Domain Application, allowing inbound calls to be handled by the resource.
    :::important
    Currently only supports `calling` as a handler and automatically defaults to it.
    :::
    """)
    @post assign(...DomainApplicationPathID, @body request: DomainApplicationAssignRequest):
      { @statusCode statusCode: 200; @body domain_application: DomainApplicationResponse; } |
      StatusCode401 |
      StatusCode404 |
      DomainApplicationCreateStatusCode422 |
      StatusCode500;
  }
}
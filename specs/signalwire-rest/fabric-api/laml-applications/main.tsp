import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "./models/errors.tsp";
import "./addresses";
import "../../types";

using TypeSpec.Http;
using Types.StatusCodes;

@route("/resources/laml_applications")
namespace FabricAPI.LamlApplications {
  @tag("LAML Applications")
  @friendlyName("LAML Applications")
  interface LamlApplications {
    @summary("List LAML Applications")
    @doc("A list of LAML Applications")
    list():
      LamlApplicationResponse[] |
      StatusCode401 |
      StatusCode404;

    @summary("Get LAML Application")
    @doc("Returns a LAML Application by ID")
    read(...LamlApplicationPathID):
      { @statusCode statusCode: 200; @body laml_application: LamlApplicationResponse; } |
      StatusCode401 |
      StatusCode404;


    @summary("Update LAML Application")
    @doc("Updates a LAML Application by ID")
    @put update(...LamlApplicationPathID, @body request: LamlApplicationUpdateRequest):
      { @statusCode statusCode: 200; @body laml_application: LamlApplicationResponse; } |
      StatusCode401 |
      StatusCode404 |
      LamlApplicationUpdateStatusCode422;

    @summary("Delete LAML Application")
    @doc("Deletes a LAML Application by ID")
    @delete delete(...LamlApplicationPathID):
      { @statusCode statusCode: 204; } |
      StatusCode401 |
      StatusCode404;
    }
}
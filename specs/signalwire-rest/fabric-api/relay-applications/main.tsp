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

@route("/resources/relay_applications")
namespace FabricAPI.RelayApplications {
  @tag("Relay Applications")
  @friendlyName("Relay Applications")
  interface RelayApplications {
    @summary("List Relay Applications")
    @doc("A list of Relay Applications")
    list():
      RelayApplicationResponse[] |
      StatusCode401 |
      StatusCode404;

    @summary("Get Relay Application")
    @doc("Returns a Relay Application by ID")
    read(...RelayApplicationPathID):
      { @statusCode statusCode: 200; @body relay_application: RelayApplicationResponse; } |
      StatusCode401 |
      StatusCode404;

    @summary("Create Relay Application")
    @doc("Creates a Relay Application")
    @post create(@body request: RelayApplicationCreateRequest):
      { @statusCode statusCode: 200; @body relay_application: RelayApplicationResponse; } |
      StatusCode401 |
      StatusCode404 |
      RelayApplicationCreateStatusCode422;

    @summary("Update Relay Application")
    @doc("Updates a Relay Application by ID")
    @put update(...RelayApplicationPathID, @body request: RelayApplicationUpdateRequest):
      { @statusCode statusCode: 200; @body relay_application: RelayApplicationResponse; } |
      StatusCode401 |
      StatusCode404 |
      RelayApplicationUpdateStatusCode422;

    @summary("Delete Relay Application")
    @doc("Deletes a Relay Application by ID")
    @delete delete(...RelayApplicationPathID):
      { @statusCode statusCode: 204; } |
      StatusCode401 |
      StatusCode404;
    }
}
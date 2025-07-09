import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "./models/errors.tsp";
import "../../types";

using TypeSpec.Http;
using Types.StatusCodes;

@route("/resources/swml_scripts")
namespace FabricAPI.SwmlScripts {
  @tag("SWML Scripts")
  @friendlyName("SWML Scripts")
  interface SwmlScripts {
    @summary("List SWML Scripts")
    @doc("A list of SWML Scripts")
    list():
      SwmlScriptResponse[] |
      StatusCode401 |
      StatusCode404;

    @summary("Get SWML Script")
    @doc("Returns a SWML Script by ID")
    read(...SwmlScriptPathID):
      { @statusCode statusCode: 200; @body swml_script: SwmlScriptResponse; } |
      StatusCode401 |
      StatusCode404;

    @summary("Create SWML Script")
    @doc("Creates a SWML Script")
    @post create(@body request: SwmlScriptCreateRequest):
      { @statusCode statusCode: 201; @body swml_script: SwmlScriptResponse; } |
      StatusCode401 |
      StatusCode404 |
      SwmlScriptCreateStatusCode422;

    @summary("Update SWML Script")
    @doc("Updates a SWML Script by ID")
    @put update(...SwmlScriptPathID, @body request: SwmlScriptUpdateRequest):
      { @statusCode statusCode: 200; @body swml_script: SwmlScriptResponse; } |
      StatusCode401 |
      StatusCode404 |
      SwmlScriptUpdateStatusCode422;

    @summary("Delete SWML Script")
    @doc("Deletes a SWML Script by ID")
    @delete delete(...SwmlScriptPathID):
      { @statusCode statusCode: 204; } |
      StatusCode401 |
      StatusCode404;
    }
}
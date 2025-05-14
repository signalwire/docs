import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "./models/errors.tsp";
import "../../types";

using TypeSpec.Http;
using Types.StatusCodes;

@route("/resources/external_swml_handlers")
namespace FabricAPI.ExternalSWMLHandlers {
  @tag("External SWML Handler")
  @friendlyName("External SWML Handlers")
  interface ExternalSWMLHandlers {
    @summary("List External SWML Handlers")
    @doc("A list of External SWML Handlers")
    list():
      ExternalSWMLHandlerListResponse |
      StatusCode401 |
      StatusCode404;

    @summary("Get External SWML Handler")
    @doc("Returns an External SWML Handler by ID")
    read(...ExternalSWMLHandlerID): {
        @statusCode statusCode: 200;
        @body external_laml_handler: ExternalSWMLHandlerResponse;
      } |
      StatusCode401 |
      StatusCode404;

    @summary("Create External SWML Handler")
    @doc("Creates an External SWML Handler")
    @post create(...ExternalSWMLHandlerCreateRequest):
      { @statusCode statusCode: 201; @body external_swml_handler: ExternalSWMLHandlerResponse; } |
      StatusCode401 |
      StatusCode404 |
      ExternalSwmlHandlerCreateStatusCode422;

    @summary("Update External SWML Handler")
    @doc("Updates an External SWML Handler by ID")
    @patch update(...ExternalSWMLHandlerID, ...MergePatchUpdate<ExternalSWMLHandlerUpdateRequest>): {
      @statusCode statusCode: 200; @body external_swml_handler: ExternalSWMLHandlerResponse;
    } |
      StatusCode401 |
      StatusCode404 |
      ExternalSwmlHandlerUpdateStatusCode422;

    @summary("Delete External SWML Handler")
    @doc("Deletes an External SWML Handler by ID")
    @delete delete(...ExternalSWMLHandlerID):
      { @statusCode statusCode: 204; } |
      StatusCode401 |
      StatusCode404;
    }
}


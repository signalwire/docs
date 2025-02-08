import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "./models/errors.tsp";
import "../../types";

using TypeSpec.Http;
using Types.StatusCodes;

@route("/resources/external_laml_handlers")
namespace FabricAPI.ExternalLAMLHandlers {
  @tag("External LAML Handler")
  @friendlyName("External LAML Handlers")
  interface ExternalLAMLHandlers {
    @summary("List External LAML Handlers")
    @doc("A list of External LAML Handlers")
    list():
      ExternalLAMLHandlerListResponse |
      StatusCode401 |
      StatusCode404;

    @summary("Get External LAML Handler")
    @doc("Returns an External LAML Handler by ID")
    read(...ExternalLAMLHandlerID): {
        @statusCode statusCode: 200;
        @body external_laml_handler: ExternalLAMLHandlerResponse;
      } |
      StatusCode401 |
      StatusCode404;

    @summary("Create External LAML Handler")
    @doc("Creates an External LAML Handler")
    @post create(...ExternalLAMLHandlerCreateRequest):
      { @statusCode statusCode: 201; @body external_laml_handler: ExternalLAMLHandlerResponse; } |
      StatusCode401 |
      StatusCode404 |
      ExternalLamlHandlerCreateStatusCode422;

    @summary("Update External LAML Handler")
    @doc("Updates an External LAML Handler by ID")
    @patch update(...ExternalLAMLHandlerID, ...ExternalLAMLHandlerUpdateRequest): {
      @statusCode statusCode: 200; @body external_laml_handler: ExternalLAMLHandlerResponse;
    } |
      StatusCode401 |
      StatusCode404 |
      ExternalLamlHandlerUpdateStatusCode422;

    @summary("Delete External LAML Handler")
    @doc("Deletes an External LAML Handler by ID")
    @delete delete(...ExternalLAMLHandlerID):
      { @statusCode statusCode: 204; } |
      StatusCode401 |
      StatusCode404;
    }
}


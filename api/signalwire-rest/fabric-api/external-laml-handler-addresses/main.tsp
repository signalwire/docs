import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/responses.tsp";
import "../../types";

using TypeSpec.Http;
using Types.StatusCodes;

@route("/resources/external_laml_handlers/{external_laml_handler_id}/addresses")
namespace FabricAPI.ExternalLAMLHandlerAddresses {
  @tag("External LAML Handler")
  @friendlyName("External LAML Handlers")
  interface ExternalLAMLHandlerAddresses {
    @summary("List External LAML Handler Addresses")
    @doc("A list of External LAML Handler Addresses")
    list(...ExternalLAMLHandlerIDPath):
      ExternalLAMLHandlerAddressListResponse |
      StatusCode401 |
      StatusCode404;
  }
}


import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/responses.tsp";
import "../../types";

using TypeSpec.Http;
using Types.StatusCodes;

@route("/resources/external_swml_handlers/{external_swml_handler_id}/addresses")
namespace FabricAPI.ExternalSWMLHandlerAddresses {
  @tag("External SWML Handler")
  @friendlyName("External SWML Handlers")
  interface ExternalSWMLHandlerAddresses {
    @summary("List External SWML Handler Addresses")
    @doc("A list of External SWML Handler Addresses")
    list(...ExternalSWMLHandlerIDPath):
      ExternalSWMLHandlerAddressListResponse |
      StatusCode401 |
      StatusCode404;
  }
}


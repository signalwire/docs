import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/responses.tsp";
import "../../../types";

using TypeSpec.Http;
using Types.StatusCodes;

@route("/resources/{id}/addresses")
namespace FabricAPI.Resource.Addresses {
  @tag("Resources")
  interface ResourceAddresses {
    @summary("List Resource Addresses")
    @doc("This endpoint is used to retrieve addresses associated with a specific Resource.")
    list(...ResourceAddressPathID):
      ResourceAddressListResponse |
      StatusCode401 |
      StatusCode404 |
      StatusCode500;
  }
}
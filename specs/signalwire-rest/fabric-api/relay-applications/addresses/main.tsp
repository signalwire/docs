import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/responses.tsp";
import "../../../types";

using TypeSpec.Http;
using Types.StatusCodes;

@route("/resources/relay_applications/{id}/addresses")
namespace FabricAPI.RelayApplication.Addresses {
  @tag("Relay Applications")
  interface RelayApplicationAddresses {
    @summary("List Relay Application Addresses")
    @doc("This endpoint returns a paginated list of addresses associated with a Relay Application.")
    list(...RelayApplicationAddressPathID):
      RelayApplicationAddressListResponse |
      StatusCode401 |
      StatusCode404 |
      StatusCode500;
  }
}
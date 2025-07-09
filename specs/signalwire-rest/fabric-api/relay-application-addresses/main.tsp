import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/responses.tsp";
import "../../types";

using TypeSpec.Http;
using Types.StatusCodes;

@route("/resources/relay_applications/{id}/addresses")
namespace FabricAPI.RelayApplicationAddresses {
  @tag("Relay Applications")
  interface RelayApplicationAddresses {
    @summary("List Relay Application Addresses")
    @doc("A list of Relay Application Addresses. This endpoint uses the bearer token authentication method with the SAT (Subscriber Access Token) which can be generated using the [Create Subscriber Token endpoint](/rest/signalwire-rest/endpoints/fabric/subscriber-tokens-create).")
    list(...RelayApplicationAddressPathID):
      RelayApplicationAddressListResponse |
      StatusCode401 |
      StatusCode404;
  }
}
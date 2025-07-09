import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/responses.tsp";
import "../../../types";

using TypeSpec.Http;
using Types.StatusCodes;

@route("/resources/laml_applications/{id}/addresses")
namespace FabricAPI.LaMLApplicationAddresses {
  @tag("LAML Applications")
  interface LaMLApplicationAddresses {
    @summary("List LaML Application Addresses")
    @doc("A list of LaML Application Addresses. This endpoint uses the bearer token authentication method with the SAT (Subscriber Access Token) which can be generated using the [Create Subscriber Token endpoint](/rest/signalwire-rest/endpoints/fabric/subscriber-tokens-create).")
    list(...LaMLApplicationAddressPathID):
      LaMLApplicationAddressListResponse |
      StatusCode401 |
      StatusCode404;
  }
}
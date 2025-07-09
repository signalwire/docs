import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/responses.tsp";
import "../../../types";

using TypeSpec.Http;
using Types.StatusCodes;

@route("/resources/{id}/addresses")
namespace FabricAPI.ResourceAddresses {
  @tag("Resources")
  interface ResourceAddresses {
    @summary("List Resource Addresses")
    @doc("Returns a list of Resource addresses. This endpoint uses the bearer token authentication method with the SAT (Subscriber Access Token) which can be generated using the [Create Subscriber Token endpoint](/rest/signalwire-rest/endpoints/fabric/subscriber-tokens-create).")
    list(...ResourceAddressPathID):
      ResourceAddressListResponse |
      StatusCode401 |
      StatusCode404;
  }
}
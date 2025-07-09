import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/responses.tsp";
import "../../../types";

using TypeSpec.Http;
using Types.StatusCodes;

@route("/resources/sip_endpoints/{id}/addresses")
namespace FabricAPI.SipEndpointAddresses {
  @tag("SIP Endpoints")
  interface SipEndpointAddresses {
    @summary("List SIP Endpoint Addresses")
    @doc("A list of SIP Endpoint Addresses. This endpoint uses the bearer token authentication method with the SAT (Subscriber Access Token) which can be generated using the [Create Subscriber Token endpoint](/rest/signalwire-rest/endpoints/fabric/subscriber-tokens-create).")
    list(...SipEndpointAddressPathID):
      SipEndpointAddressListResponse |
      StatusCode401 |
      StatusCode404;
  }
}
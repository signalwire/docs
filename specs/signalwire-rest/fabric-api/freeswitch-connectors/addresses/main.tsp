import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/responses.tsp";
import "../../../types";

using TypeSpec.Http;
using Types.StatusCodes;

@route("/resources/freeswitch_connectors/{id}/addresses")
namespace FabricAPI.FreeswitchConnectorAddresses {
  @tag("FreeSWITCH Connectors")
  interface FreeswitchConnectorAddresses {
    @summary("List FreeSWITCH Connector Addresses")
    @doc("A list of FreeSWITCH Connector Addresses. This endpoint uses the bearer token authentication method with the SAT (Subscriber Access Token) which can be generated using the [Create Subscriber Token endpoint](/rest/signalwire-rest/endpoints/fabric/subscriber-tokens-create).")
    list(...FreeswitchConnectorAddressPathID):
      FreeswitchConnectorAddressListResponse |
      StatusCode401 |
      StatusCode404;
  }
}
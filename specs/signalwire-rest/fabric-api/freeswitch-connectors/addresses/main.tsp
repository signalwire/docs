import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/responses.tsp";
import "../../../types";
import "../../tags.tsp";

using TypeSpec.Http;
using Types.StatusCodes;

@route("/resources/freeswitch_connectors/{id}/addresses")
namespace FabricAPI.FreeswitchConnectorAddresses {
  @tag(FREESWITCH_CONNECTOR_TAG)
  interface FreeswitchConnectorAddresses {
    @summary("List FreeSWITCH Connector Addresses")
    @doc("This endpoint returns a list of addresses associated with a specific FreeSWITCH Connector.")
    list(...FreeswitchConnectorAddressPathID):
      | FreeswitchConnectorAddressListResponse
      | StatusCode401
      | StatusCode404
      | StatusCode500;
  }
}

import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/responses.tsp";
import "../../../types";
import "../../tags.tsp";
import "../../../../_shared/alias/token-permissions.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using Types.StatusCodes;

@route("/resources/freeswitch_connectors/{id}/addresses")
namespace SignalWireAPI.Fabric.FreeswitchConnectorAddresses {
  @tag(FREESWITCH_CONNECTOR_TAG)
  interface FreeswitchConnectorAddresses {
    @operationId("list_freeswitch_connector_addresses")
    @summary("List FreeSWITCH connector Addresses")
    @doc("""
      Returns the project-scoped resource addresses assigned to one FreeSWITCH Connector. Use these callable handles to see how communications can reach the connected FreeSWITCH; use [List FreeSWITCH connectors](/docs/apis/rest/freeswitch-connector/list-freeswitch-connectors) for the resources themselves, or the address operation for the handler type you actually use.
      
      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    list(...FreeswitchConnectorAddressPathID):
      | FreeswitchConnectorAddressListResponse
      | StatusCode401
      | StatusCode404
      | StatusCode500;
  }
}

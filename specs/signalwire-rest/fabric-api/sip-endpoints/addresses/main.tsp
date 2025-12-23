import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/responses.tsp";
import "../../../types";
import "../../tags.tsp";

using TypeSpec.Http;
using Types.StatusCodes;

@route("/resources/sip_endpoints/{id}/addresses")
namespace FabricAPI.SipEndpoint.Addresses {
  @tag(SIP_ENDPOINTS_TAG)
  interface SipEndpointAddresses {
    @summary("List SIP Endpoint Addresses")
    @doc("""
      A list of SIP Endpoint Addresses.

      #### Permissions

      The API token used to authenticate must have one of the following scopes enabled to make a successful request: _Voice_, _Messaging_, _Fax_, or _Video_.

      [Learn more about API scopes](/platform/dashboard/getting-started/your-signalwire-api-space#api-token-scopes).
      """)
    list(...SipEndpointAddressPathID):
      | SipEndpointAddressListResponse
      | StatusCode401
      | StatusCode404
      | StatusCode500;
  }
}

import "@typespec/http";
import "@typespec/openapi";
import "../../../types";
import "./models/responses.tsp";
import "./models/requests.tsp";
import "../../tags.tsp";

using TypeSpec.Http;
using Types.StatusCodes;

@route("/resources/sip_gateways/{resource_id}/addresses")
namespace FabricAPI.SipGateways.Addresses {
  @tag(SIP_GATEWAY_TAG)
  @friendlyName("SIP Gateway")
  interface RelayApplicationAddresses {
    @summary("List Fabric Addresses assigned to a SIP Gateway")
    @doc("""
      Returns a paginated list of Fabric Addresses associated with the specified SIP Gateway.

      #### Permissions

      The API token used to authenticate must have one of the following scopes enabled to make a successful request: _Voice_, _Messaging_, _Fax_, or _Video_.

      [Learn more about API scopes](/platform/dashboard/getting-started/your-signalwire-api-space#api-token-scopes).
      """)
    readAddressesByResourceId(...SipGatewayAddressRequest):
      | SipGatewayAddressListResponse
      | StatusCode401
      | StatusCode404
      | StatusCode500;
  }
}

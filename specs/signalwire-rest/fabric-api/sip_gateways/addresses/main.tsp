import "@typespec/http";
import "@typespec/openapi";
import "../../../types";
import "./models/responses.tsp";
import "./models/requests.tsp";
import "../../tags.tsp";
import "../../../../_shared/alias/token-permissions.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using Types.StatusCodes;

@route("/{id}/addresses")
namespace SignalWireAPI.Fabric.SipGateways.Addresses {
  @tag(SIP_GATEWAY_TAG)
  @friendlyName("SIP Gateway")
  interface RelayApplicationAddresses {
    @operationId("list_sip_gateway_addresses")
    @summary("List SIP gateway Addresses")
    @doc("""
      Returns the project-scoped resource addresses assigned to one SIP Gateway. Use these callable handles to see how calls can reach the gateway and continue to its external SIP destination; use [Get SIP gateway](/docs/apis/rest/sip-gateway/get-sip-gateway) for destination and media settings, or the SIP Credential address operation for a registering device.
      
      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    readAddressesByResourceId(...SipGatewayAddressRequest):
      | SipGatewayAddressListResponse
      | StatusCode401
      | StatusCode404
      | StatusCode500;
  }
}

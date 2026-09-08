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

@route("/resources/sip_endpoints/{id}/addresses")
namespace SignalWireAPI.Fabric.SipEndpoint.Addresses {
  @tag(FABRIC_SIP_ENDPOINTS_TAG)
  interface SipEndpointAddresses {
    @operationId("list_sip_credential_addresses")
    @summary("List SIP credential Addresses")
    @doc("""
      Returns the project-scoped resource addresses assigned to one SIP Credential. Use these callable handles to see how the registered SIP device can be reached; use [Get SIP credential](/docs/apis/rest/sip-credentials/get-sip-credential) for registration and outbound call-handler settings, or the Subscriber SIP Credential endpoints for a Subscriber-owned device.
      
      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    list(...SipEndpointAddressPathID):
      | SipEndpointAddressListResponse
      | StatusCode401
      | StatusCode404
      | StatusCode500;
  }
}

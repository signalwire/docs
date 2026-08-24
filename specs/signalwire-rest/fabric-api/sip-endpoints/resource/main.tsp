import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "./models/errors.tsp";
import "../../../types";
import "../../tags.tsp";
import "../../../../_shared/alias/token-permissions.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using Types.StatusCodes;

@route("/resources/{id}/sip_endpoints")
namespace SignalWireAPI.Fabric.SipEndpoint.Resource {
  @tag(FABRIC_SIP_ENDPOINTS_TAG)
  interface ResourceSipEndpoints {
    @operationId("assign_resource_to_sip_credential")
    @summary("Assign Resource to SIP credential")
    @doc("""
      Assigns an existing resource as the calling handler for a SIP Credential. Use it when calls placed by the registered SIP device should run that resource's instructions. This operation does not create a credential; use [Create SIP credential](/docs/apis/rest/sip-credentials/create-sip-credential) first when the device does not yet have one.
      <Note>
      Currently only supports `calling` as a handler and automatically defaults to it.
      </Note>
      
      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    @post
    assign(
      ...ResourceSipEndpointPathID,
      @body request: ResourceSipEndpointAssignRequest,
    ):
      | {
          @statusCode statusCode: 200;
          @body sip_endpoint: ResourceSipEndpointResponse;
        }
      | StatusCode401
      | StatusCode404
      | ResourceSubSipEndpointCreateStatusCode422
      | StatusCode500;
  }
}

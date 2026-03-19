import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "./models/errors.tsp";
import "./addresses";
import "./resource";
import "../../types";
import "../tags.tsp";
import "../../../_shared/alias/token-permissions.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using Types.StatusCodes;

@route("/resources/sip_endpoints")
namespace SignalWireAPI.Fabric.SipEndpoints {
  @tag(FABRIC_SIP_ENDPOINTS_TAG)
  @friendlyName("SIP Credentials")
  @doc("SIP Credentials API category.")
  interface SipEndpoints {
    @operationId("list_sip_credentials")
    @summary("List SIP Credentials")
    @doc("""
      A list of SIP Credentials

      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    list():
      | SipEndpointListResponse[]
      | StatusCode401
      | StatusCode404
      | StatusCode500;

    @operationId("get_sip_credential")
    @summary("Get SIP Credential")
    @doc("""
      Returns a SIP Credential by ID

      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    read(...SipEndpointPathID):
      | {
          @statusCode statusCode: 200;
          @body sip_endpoint: SipEndpointResponse;
        }
      | StatusCode401
      | StatusCode404
      | StatusCode500;

    @operationId("create_sip_credential")
    @summary("Create SIP Credential")
    @doc("""
      Creates a SIP Credential

      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    @post
    create(@body request: SipEndpointCreateRequest):
      | {
          @statusCode statusCode: 200;
          @body sip_endpoint: SipEndpointResponse;
        }
      | StatusCode401
      | StatusCode404
      | ResourceSipEndpointCreateStatusCode422
      | StatusCode500;

    @operationId("update_sip_credential")
    @summary("Update SIP Credential")
    @doc("""
      Updates a SIP Credential by ID

      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    @put
    update(...SipEndpointPathID, @body request: SipEndpointUpdateRequest):
      | {
          @statusCode statusCode: 200;
          @body sip_endpoint: SipEndpointResponse;
        }
      | StatusCode401
      | StatusCode404
      | ResourceSipEndpointUpdateStatusCode422
      | StatusCode500;

    @operationId("delete_sip_credential")
    @summary("Delete SIP Credential")
    @doc("""
      Deletes a SIP Credential by ID

      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    @delete
    delete(...SipEndpointPathID):
      | {
          @statusCode statusCode: 204;
        }
      | StatusCode401
      | StatusCode404
      | StatusCode500;
  }
}

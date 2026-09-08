import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "./models/errors.tsp";
import "../../types";
import "./addresses";
import "../tags.tsp";
import "../../../_shared/alias/token-permissions.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using Types.StatusCodes;

@route("/resources/sip_gateways")
namespace SignalWireAPI.Fabric.SipGateways {
  @tag(SIP_GATEWAY_TAG)
  @friendlyName("SIP Gateway")
  interface SipGateways {
    @operationId("list_sip_gateways")
    @summary("List SIP gateways")
    @doc("""
      Lists the SIP Gateways in your SignalWire project. A gateway forwards outbound calls from SignalWire to an external SIP provider, PBX, or other destination. Use [SIP Credentials](/docs/apis/rest/sip-credentials/list-sip-credentials) when a device registers with SignalWire, or [SIP Addresses](/docs/apis/rest/sip-addresses/list-sip-addresses) for standalone SIP URIs with inbound handlers.
      
      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    list():
      | SipGatewayListResponse
      | StatusCode401
      | StatusCode404
      | StatusCode500;

    @operationId("get_sip_gateway")
    @summary("Get SIP gateway")
    @doc("""
      Retrieves one SIP Gateway from your SignalWire project. Use [List SIP gateways](/docs/apis/rest/sip-gateway/list-sip-gateways) to find gateways. A device that registers with SignalWire belongs under [SIP Credentials](/docs/apis/rest/sip-credentials/list-sip-credentials) instead.
      
      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    read(...SipGatewayID):
      | {
          @statusCode statusCode: 200;
          @body sip_gateway: SipGatewayResponse;
        }
      | StatusCode401
      | StatusCode404
      | StatusCode500;

    @operationId("create_sip_gateway")
    @summary("Create SIP gateway")
    @doc("""
      Creates a SIP Gateway resource that forwards calls to an external SIP destination. Use it for outbound routing to a provider, PBX, or other SIP system that SignalWire dials. Use [Create SIP credential](/docs/apis/rest/sip-credentials/create-sip-credential) when the external device registers with SignalWire instead.
      
      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    @post
    create(...SipGatewayRequest):
      | {
          @statusCode statusCode: 201;
          @body sip_gateway: SipGatewayResponse;
        }
      | StatusCode401
      | StatusCode404
      | SipGatewayCreateStatusCode422
      | StatusCode500;

    @operationId("update_sip_gateway")
    @summary("Update SIP gateway")
    @doc("""
      Changes the destination or supported media settings of a SIP Gateway identified by resource ID. Use it when outbound SIP routing changes; update a registering device through [Update SIP credential](/docs/apis/rest/sip-credentials/update-sip-credential) instead.
      
      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    @patch(#{ implicitOptionality: true })
    update(...SipGatewayID, ...SipGatewayRequest):
      | {
          @statusCode statusCode: 200;
          @body sip_gateway: SipGatewayResponse;
        }
      | StatusCode401
      | StatusCode404
      | SipGatewayCreateStatusCode422
      | StatusCode500;

    @operationId("delete_sip_gateway")
    @summary("Delete SIP gateway")
    @doc("""
      Deletes a SIP Gateway resource by ID so calls can no longer be forwarded to its external SIP destination. This does not delete a [SIP Credential](/docs/apis/rest/sip-credentials/delete-sip-credential) or a standalone SIP Address.
      
      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    @delete
    delete(...SipGatewayID):
      | {
          @statusCode statusCode: 204;
        }
      | StatusCode401
      | StatusCode404
      | StatusCode500;
  }
}

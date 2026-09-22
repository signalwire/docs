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
    @summary("List SIP credentials")
    @doc("""
      Returns the project's SIP Credential resources. Use it to inventory credentials used by SIP devices that register with SignalWire. Use [Subscriber SIP Credentials](/docs/apis/rest/subscribers/sip-credentials/list-subscriber-sip-credentials) when credentials must belong to one Subscriber, or [SIP Gateways](/docs/apis/rest/sip-gateway/list-sip-gateways) for external SIP destinations that SignalWire dials.

      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    list():
      | SipEndpointListResponse[]
      | StatusCode401
      | StatusCode404
      | StatusCode500;

    @operationId("get_sip_credential")
    @summary("Get SIP credential")
    @doc("""
      Retrieves one project-scoped SIP Credential by resource ID so you can inspect how its device registers and places calls through SignalWire. Use [List SIP credentials](/docs/apis/rest/sip-credentials/list-sip-credentials) to discover IDs, or the Subscriber endpoint for a credential owned by one Subscriber.

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
    @summary("Create SIP credential")
    @doc("""
      Creates a project-scoped SIP Credential for a SIP device to register with SignalWire. Use it for a shared or independently managed device; use [Create Subscriber SIP credential](/docs/apis/rest/subscribers/sip-credentials/create-subscriber-sip-credential) when the credential belongs to a specific Subscriber. To attach an already-existing resource as the credential's outbound call handler, use [Assign Resource to SIP credential](/docs/apis/rest/sip-credentials/assign-resource-to-sip-credential) instead.

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
    @summary("Update SIP credential")
    @doc("""
      Changes how a project-scoped SIP device registers with SignalWire or handles outbound calls. Update a Subscriber-owned credential through [Update Subscriber SIP credential](/docs/apis/rest/subscribers/sip-credentials/update-subscriber-sip-credential).

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
    @summary("Delete SIP credential")
    @doc("""
      Deletes a project-scoped SIP Credential by ID so its device can no longer register with those credentials. Use it for a project-owned credential; delete a Subscriber-owned credential through [Delete Subscriber SIP credential](/docs/apis/rest/subscribers/sip-credentials/delete-subscriber-sip-credential), and delete an outbound SIP Gateway through its own endpoint.

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

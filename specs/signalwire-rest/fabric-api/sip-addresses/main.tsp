import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "./models/errors.tsp";
import "../../types";
import "../tags.tsp";
import "../../../_shared/alias/token-permissions.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using Types.StatusCodes;

@route("/sip_addresses")
namespace SignalWireAPI.Fabric.SipAddresses {
  @tag(SIP_ADDRESSES_TAG)
  @friendlyName("SIP Addresses")
  @doc("""
    SIP Addresses API category. A SIP address gives you a SIP URI that other SIP devices, PBXs, or
    softphones can register to or dial — with its own username, codec, cipher, and encryption
    settings, IP authentication, and a resource that answers the calls it receives. Use this API to
    list, create, update, and delete SIP addresses without the dashboard.

    This API only sees SIP addresses that belong to your project. An ID from another project, or an
    ID that belongs to a different kind of address (for example, a video room), returns a 404.

    <Note>
    This is the public REST management API for standalone SIP addresses. It's separate from
    [Assign domain application handler](/docs/apis/rest/domain-applications/assign-resource-domain-application),
    which attaches an already-created Domain Application to a resource.
    </Note>
    """)
  interface SipAddresses {
    @operationId("list_sip_addresses")
    @summary("List SIP addresses")
    @doc("""
      Lists the standalone SIP Addresses in your SignalWire project. A SIP Address gives an external device or system a dedicated SIP URI for registration or inbound calling. Resource addresses are generic callable handles, [SIP Credentials](/docs/apis/rest/sip-credentials/list-sip-credentials) represent registering devices managed as Fabric resources, and [E911 addresses](/docs/apis/rest/e-911-addresses/list-addresses) represent physical emergency-service locations.

      ${tokenPermissions<"_Calling_, _Fax_, _Messaging_, or _Video_">}
      """)
    list(...SipAddressListQuery):
      | SipAddressListResponse
      | StatusCode401
      | StatusCode404
      | SipAddressListStatusCode422
      | StatusCode500;

    @operationId("get_sip_address")
    @summary("Get SIP address")
    @doc("""
      Retrieves one standalone SIP Address from your SignalWire project. Use [List SIP addresses](/docs/apis/rest/sip-addresses/list-sip-addresses) to find addresses. Generic resource addresses and physical E911 addresses use different operations.

      ${tokenPermissions<"_Calling_, _Fax_, _Messaging_, or _Video_">}
      """)
    read(...SipAddressPathID):
      | {
          @statusCode statusCode: 200;
          @body sip_address: SipAddress;
        }
      | StatusCode401
      | StatusCode404
      | StatusCode500;

    @operationId("create_sip_address")
    @summary("Create SIP address")
    @doc("""
      Creates a standalone SIP Address with a SIP URI, registration password, media and IP-authentication settings, and a resource that handles inbound calls. Use it when an external SIP device or system must register to or dial a dedicated URI. Use [Create SIP credential](/docs/apis/rest/sip-credentials/create-sip-credential) for a device credential managed as a Fabric resource, or [Create E911 address](/docs/apis/rest/e-911-addresses/create-address) for a physical emergency-service location.

      ${tokenPermissions<"_Calling_, _Fax_, _Messaging_, or _Video_">}
      """)
    @post
    create(@body request: SipAddressCreateRequest):
      | {
          @statusCode statusCode: 201;
          @body sip_address: SipAddress;
        }
      | StatusCode401
      | SipAddressCreateStatusCode422
      | StatusCode500;

    @operationId("update_sip_address")
    @summary("Update SIP address")
    @doc("""
      Partially updates a standalone SIP Address by ID; omitted fields retain their current values. Use it to change the URI name, Domain, registration password, media, encryption, or IP-authentication settings. `calling_handler_resource_id` cannot be changed through this operation. SIP Credentials and generic resource addresses have separate management endpoints.

      ${tokenPermissions<"_Calling_, _Fax_, _Messaging_, or _Video_">}
      """)
    @patch
    update(...SipAddressPathID, @body request: SipAddressUpdateRequest):
      | {
          @statusCode statusCode: 200;
          @body sip_address: SipAddress;
        }
      | StatusCode400
      | StatusCode401
      | StatusCode404
      | SipAddressUpdateStatusCode422
      | StatusCode500;

    @operationId("delete_sip_address")
    @summary("Delete SIP address")
    @doc("""
      Deletes a standalone SIP Address and its SIP configuration by ID. Use it when calls and registrations to that URI must stop immediately. This does not delete a [SIP Credential](/docs/apis/rest/sip-credentials/delete-sip-credential), a generic resource address, or an E911 address.

      ${tokenPermissions<"_Calling_, _Fax_, _Messaging_, or _Video_">}
      """)
    @delete
    delete(...SipAddressPathID):
      | {
          @statusCode statusCode: 204;
        }
      | StatusCode401
      | StatusCode404
      | StatusCode500;
  }
}

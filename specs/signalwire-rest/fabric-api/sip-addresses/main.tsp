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
    SIP Addresses API category. A SIP address is the customer-facing name for a Call Fabric domain application,
    giving full API parity with the SIP address create/edit/delete flows in the dashboard.

    <Note>
    This is the public REST management API for standalone SIP addresses. It is distinct from
    [Assign domain application handler](/docs/apis/rest/domain-applications/assign-domain-application-handler),
    which attaches an existing domain application to an existing resource.
    </Note>
    """)
  interface SipAddresses {
    @operationId("list_sip_addresses")
    @summary("List SIP addresses")
    @doc("""
      Returns a paginated list of SIP addresses in the authenticated project.

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
      Returns a SIP address by ID.

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
      Creates a SIP address and its underlying SIP configuration.

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
      Updates a SIP address by ID. Partial update: any field omitted from the body keeps its current value.
      `calling_handler_resource_id` cannot be changed via this endpoint.

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
      Deletes a SIP address by ID and tears down its domain application.

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

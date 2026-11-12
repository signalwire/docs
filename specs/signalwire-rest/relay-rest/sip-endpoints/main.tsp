import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "../../types";
import "../tags.tsp";
import "../../../_shared/alias/token-permissions.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using Types.StatusCodes;

@route("/endpoints/sip")
namespace SignalWireAPI.RelayRest.SipEndpoints {
  @tag(SPACE_SIP_ENDPOINTS_TAG)
  @friendlyName("SIP Endpoints")
  interface SipEndpoints {
    @operationId("list_sip_endpoints")
    @summary("List SIP endpoints")
    @doc("""
      Returns the legacy SIP endpoints in the project. Use it only to inventory an existing integration while migrating to the current SIP Credential resource.

      <Warning>This endpoint is deprecated. Use [SIP Credentials](/docs/apis/rest/sip-credentials/create-sip-credential) instead.</Warning>

      ${tokenPermissions<"_Voice_">}
      """)
    list(...ListSipEndpointsQuery):
      | SipEndpointListResponse
      | StatusCode401
      | ValidationError
      | StatusCode500;

    @operationId("create_sip_endpoint")
    @summary("Create SIP endpoint")
    @doc("""
      Creates a legacy SIP endpoint for a registering device. Use the current SIP Credential resource for new integrations.

      <Warning>This endpoint is deprecated. Use [SIP Credentials](/docs/apis/rest/sip-credentials/create-sip-credential) instead.</Warning>

      ${tokenPermissions<"_Voice_">}
      """)
    @post
    create(@body body: CreateSipEndpointRequest):
      | SipEndpointResponse
      | StatusCode401
      | ValidationError
      | StatusCode500;

    @operationId("retrieve_sip_endpoint")
    @summary("Get SIP endpoint")
    @doc("""
      Retrieves one legacy SIP endpoint by ID. Use it only for an existing integration while migrating the device to a current SIP Credential.

      <Warning>This endpoint is deprecated. Use [SIP Credentials](/docs/apis/rest/sip-credentials/create-sip-credential) instead.</Warning>

      ${tokenPermissions<"_Voice_">}
      """)
    read(...SipEndpointPathID):
      | SipEndpointResponse
      | StatusCode401
      | StatusCode404
      | ValidationError
      | StatusCode500;

    @operationId("update_sip_endpoint")
    @summary("Update SIP endpoint")
    @doc("""
      Changes how a legacy SIP endpoint registers or places calls. Use it only to maintain an existing integration while migrating to the current SIP Credential resource.

      <Warning>This endpoint is deprecated. Use [SIP Credentials](/docs/apis/rest/sip-credentials/create-sip-credential) instead.</Warning>

      ${tokenPermissions<"_Voice_">}
      """)
    @put
    update(...SipEndpointPathID, @body body: UpdateSipEndpointRequest):
      | SipEndpointResponse
      | StatusCode401
      | StatusCode404
      | ValidationError
      | StatusCode500;

    @operationId("delete_sip_endpoint")
    @summary("Delete SIP endpoint")
    @doc("""
      Permanently deletes a legacy SIP endpoint by ID. Use [Delete SIP credential](/docs/apis/rest/sip-credentials/delete-sip-credential) for a device already migrated to the current resource.

      <Warning>This endpoint is deprecated. Use [SIP Credentials](/docs/apis/rest/sip-credentials/create-sip-credential) instead.</Warning>

      ${tokenPermissions<"_Voice_">}
      """)
    @delete
    delete(...SipEndpointPathID):
      | {
          @statusCode statusCode: 204;
        }
      | StatusCode400
      | StatusCode401
      | StatusCode404
      | StatusCode500;
  }
}

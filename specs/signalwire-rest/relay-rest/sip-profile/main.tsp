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

@route("/sip_profile")
namespace SignalWireAPI.RelayRest.SipProfile {
  @tag(SIP_PROFILE_TAG)
  @friendlyName("SIP Profile")
  interface SipProfile {
    @operationId("retrieve_sip_profile")
    @summary("Get SIP profile")
    @doc("""
      Retrieves the SIP Profile shared across your SignalWire project. The profile supplies project-wide defaults to SIP Credentials that use it; individual registering devices and external destinations are represented by [SIP Credentials](/docs/apis/rest/sip-credentials/get-sip-credential) and [SIP Gateways](/docs/apis/rest/sip-gateway/get-sip-gateway).
      
      ${tokenPermissions<"_Voice_">}
      """)
    @get
    read(): SipProfileResponse | StatusCode401 | StatusCode500;

    @operationId("update_sip_profile")
    @summary("Update SIP profile")
    @doc("""
      Changes the project-wide defaults that SIP Credentials use for registration, media, security, and outbound calling. This updates the project's single SIP Profile; it does not create or update an individual [SIP Credential](/docs/apis/rest/sip-credentials/update-sip-credential) or [SIP Gateway](/docs/apis/rest/sip-gateway/update-sip-gateway).
      
      ${tokenPermissions<"_Voice_">}
      """)
    @put
    update(@body body: UpdateSipProfileRequest):
      | {
          @statusCode statusCode: 201;
          @body sip_profile: SipProfileResponse;
        }
      | StatusCode401
      | ValidationError
      | StatusCode500;
  }
}

import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "../../types";
import "../tags.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using Types.StatusCodes;

@route("/sip_profile")
namespace SpaceAPI.SipProfile {
  @tag(SIP_PROFILE_TAG)
  @friendlyName("SIP Profile")
  interface SipProfile {
    @operationId("get_sip_profile")
    @summary("Retrieve SIP Profile")
    @doc("""
      Retrieves the SIP profile settings for your project.

      #### Permissions
      The API token must include the following scopes: _Voice_.
      """)
    @get
    read(): SipProfileResponse | StatusCode401 | StatusCode500;

    @operationId("update_sip_profile")
    @summary("Update SIP Profile")
    @doc("""
      Updates the SIP profile settings for your project.

      #### Permissions
      The API token must include the following scopes: _Voice_.
      """)
    @put
    update(@body body: UpdateSipProfileRequest):
      | {
          @statusCode statusCode: 200;
          @body sip_profile: SipProfileResponse;
        }
      | StatusCode401
      | ValidationError
      | StatusCode500;
  }
}

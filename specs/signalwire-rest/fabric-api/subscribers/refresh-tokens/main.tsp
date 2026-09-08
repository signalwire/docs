import "@typespec/http";
import "@typespec/openapi";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "./models/errors.tsp";
import "../../../types";
import "../../tags.tsp";
import "../../../../_shared/alias/token-permissions.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using Types.StatusCodes;

@route("/subscribers/tokens/refresh")
namespace SignalWireAPI.Fabric.SubscriberRefreshTokens {
  @tag(SUBSCRIBERS_TOKENS_TAG)
  @friendlyName("Refresh Token")
  interface RefreshTokens {
    @operationId("refresh_subscriber_token")
    @summary("Refresh Subscriber token")
    @doc("""
      Exchanges a valid refresh token for a new [Subscriber](/docs/platform/subscribers) Access Token (SAT) and a new refresh token. Call it from your server to continue a known subscriber's session without issuing a token from profile data again. The new access token is valid for 2 hours, and the new refresh token is valid for 2 hours and 5 minutes.

      This operation consumes the `refresh_token` returned by [Create Subscriber token](/docs/apis/rest/subscribers/tokens/create-subscriber-token). A Browser SDK client with a fingerprint-bound `sat:refresh` token can refresh through the client flow instead.

      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    @post
    create(...SubscriberRefreshTokenRequest):
      | {
          @statusCode statusCode: 201;
          @body subscriber_refresh_token: SubscriberRefreshTokenResponse;
        }
      | StatusCode401
      | StatusCode404
      | RefreshTokenStatusCode422
      | StatusCode500;
  }
}

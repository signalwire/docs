import "@typespec/http";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "./models/errors.tsp";
import "../../../types";
import "../../tags.tsp";

using TypeSpec.Http;
using Types.StatusCodes;

@route("/subscribers/tokens/refresh")
namespace FabricAPI.SubscriberRefreshTokens {
  @tag(SUBSCRIBERS_TOKENS_TAG)
  @friendlyName("Refresh Token")
  interface RefreshTokens {
    @summary("Exchange a refresh token for a new subscriber access token")
    @doc("""
      Exchanges a valid refresh token for a new subscriber access token and a new refresh token. The new access token is valid for 2 hours, and the new refresh token is valid for 2 hours and 5 minutes.

      #### Permissions

      The API token used to authenticate must have one of the following scopes enabled to make a successful request: _Voice_, _Messaging_, _Fax_, or _Video_.

      [Learn more about API scopes](/platform/dashboard/getting-started/your-signalwire-api-space#api-token-scopes).
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

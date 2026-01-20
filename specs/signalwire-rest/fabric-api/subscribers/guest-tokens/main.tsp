import "@typespec/http";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "./models/errors.tsp";
import "../../../types";
import "../../tags.tsp";

using TypeSpec.Http;
using Types.StatusCodes;

@route("/guests/tokens")
namespace FabricAPI.SubscriberGuestTokens {
  @tag(SUBSCRIBERS_TOKENS_TAG)
  @friendlyName("Guest Token")
  interface GuestTokens {
    @summary("Create Subscriber Guest Token")
    @doc("""
      Creates a Subscriber Guest Token. The token is authorized using an existing API token.

      #### Permissions

      The API token used to authenticate must have one of the following scopes enabled to make a successful request: _Voice_, _Messaging_, _Fax_, or _Video_.

      [Learn more about API scopes](/platform/dashboard/getting-started/your-signalwire-api-space#api-token-scopes).
      """)
    @post
    create(...SubscriberGuestTokenCreateRequest):
      | {
          @statusCode statusCode: 201;
          @body subscriber_guest_token: SubscriberGuestTokenCreateResponse;
        }
      | StatusCode401
      | StatusCode404
      | GuestTokenCreateStatusCode422
      | StatusCode500;
  }
}

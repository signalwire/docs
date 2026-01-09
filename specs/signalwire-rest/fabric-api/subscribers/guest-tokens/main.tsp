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
    @doc("Creates a Subscriber Guest Token. The token is authorized using an existing API token.")
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

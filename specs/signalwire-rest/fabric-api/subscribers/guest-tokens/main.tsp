import "@typespec/http";
import "@typespec/openapi";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "./models/errors.tsp";
import "../../../types";
import "../../tags.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using Types.StatusCodes;

@route("/guests/tokens")
namespace FabricAPI.SubscriberGuestTokens {
  @tag(SUBSCRIBERS_TOKENS_TAG)
  @friendlyName("Guest Token")
  interface GuestTokens {
    @operationId("create_subscriber_guest_token")
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

import "@typespec/http";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "./models/errors.tsp";
import "../../types";

using TypeSpec.Http;
using Types.StatusCodes;

@route("/guests/tokens")
namespace FabricAPI.SubscriberGuestTokens {
  @tag("Subscribers: Tokens")
  @friendlyName("Guest Token")
  interface GuestTokens {

    @summary("Create Subscriber Guest Token")
    @doc("Creates a Subscriber Guest Token to be used for server-side API calls. The token is authorized using an existing API token.")
    @post create(...SubscriberGuestTokenCreateRequest):
      { @statusCode statusCode: 201; @body subscriber_guest_token: SubscriberGuestTokenCreateResponse; } |
      StatusCode401 |
      StatusCode404 |
      GuestTokenCreateStatusCode422;
  }
}

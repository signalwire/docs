import "@typespec/http";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "./models/errors.tsp";
import "../../../types";

using TypeSpec.Http;
using Types.StatusCodes;

@route("/subscriber/invites")
namespace FabricAPI.SubscriberInviteTokens {
  @tag("Subscribers: Tokens")
  @friendlyName("Invite Token")
  interface InviteTokens {

    @summary("Create a Subscriber Invite Token")
    @doc("Creates a Subscriber Invite Token to be used for client-side API calls. The token is authorized using a subscriber's SAT (Subscriber Access Token)")
    @post create(...SubscriberInviteTokenCreateRequest):
      { @statusCode statusCode: 201; @body subscriber_invite_token: SubscriberInviteTokenCreateResponse; } |
      StatusCode401 |
      StatusCode404 |
      InviteTokenCreateStatusCode422;
  }
}

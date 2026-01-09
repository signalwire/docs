import "@typespec/http";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "./models/errors.tsp";
import "../../../types";
import "../../tags.tsp";

using TypeSpec.Http;
using Types.StatusCodes;

@route("/subscriber/invites")
namespace FabricAPI.SubscriberInviteTokens {
  @tag(SUBSCRIBERS_TOKENS_TAG)
  @friendlyName("Invite Token")
  interface InviteTokens {
    @summary("Create a Subscriber Invite Token")
    @doc("""
      Creates a Subscriber Invite Token to be used for client-side API calls. The token is authorized using a subscriber's SAT (Subscriber Access Token)

      #### Permissions

      The API token used to authenticate must have one of the following scopes enabled to make a successful request: _Voice_, _Messaging_, _Fax_, or _Video_.

      [Learn more about API scopes](/platform/dashboard/getting-started/your-signalwire-api-space#api-token-scopes).
      """)
    @post
    create(...SubscriberInviteTokenCreateRequest):
      | {
          @statusCode statusCode: 201;
          @body subscriber_invite_token: SubscriberInviteTokenCreateResponse;
        }
      | StatusCode401
      | StatusCode404
      | InviteTokenCreateStatusCode422
      | StatusCode500;
  }
}

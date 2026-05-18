import "@typespec/http";
import "@typespec/openapi";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "./models/errors.tsp";
import "../../../types";
import "../../tags.tsp";
import "../../../../_shared/auth.tsp";
import "../../../../_shared/alias/token-permissions.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using Types.StatusCodes;

@useAuth(SignalWireBearerAuth)
@route("/subscriber/invites")
namespace SignalWireAPI.Fabric.SubscriberInviteTokens {
  @tag(SUBSCRIBERS_TOKENS_TAG)
  @friendlyName("Invite Token")
  interface InviteTokens {
    @operationId("create_subscriber_invite_token")
    @summary("Create Subscriber invite token")
    @doc("""
      Creates a [Subscriber](/docs/platform/subscribers) Invite Token for use with client-side API calls. Authenticate this request with a subscriber's SAT (Subscriber Access Token), not the project level Basic Auth.

      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
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

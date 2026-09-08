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
      Creates a temporary invitation token for a guest to reach one of the authenticated [Subscriber's](/docs/platform/subscribers) resource addresses. A subscriber client calls this operation with its Subscriber Access Token (SAT), then passes the returned invitation to the guest. Invitations expire after two hours by default.

      Use [Create Subscriber guest token](/docs/apis/rest/subscribers/tokens/create-subscriber-guest-token) when your server grants guest access with a project API token instead. This endpoint requires the subscriber's SAT, not project-level Basic authentication.

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

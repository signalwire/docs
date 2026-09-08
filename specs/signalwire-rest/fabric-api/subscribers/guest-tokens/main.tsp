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

@route("/guests/tokens")
namespace SignalWireAPI.Fabric.SubscriberGuestTokens {
  @tag(SUBSCRIBERS_TOKENS_TAG)
  @friendlyName("Guest Token")
  interface GuestTokens {
    @operationId("create_subscriber_guest_token")
    @summary("Create Subscriber guest token")
    @doc("""
      Creates a temporary guest [Subscriber](/docs/platform/subscribers) token limited to the resource addresses in `allowed_addresses`. Call it from your server when a user without a full subscriber account needs scoped calling access. The token expires after two hours by default; authenticate this request with a project API token and give only the returned guest token to the client.

      Use [Create Subscriber token](/docs/apis/rest/subscribers/tokens/create-subscriber-token) for a known subscriber, or [Create guest embed token](/docs/apis/rest/subscribers/tokens/create-guest-embed-token) when exchanging a public Click-to-Call token.

      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
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

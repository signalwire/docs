import "@typespec/http";
import "@typespec/openapi";
import "../../../types";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "./models/errors.tsp";
import "../../tags.tsp";
import "../../../../_shared/alias/token-permissions.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using Types.StatusCodes;

@route("/subscribers/tokens")
namespace SignalWireAPI.Fabric.SubscriberTokens {
  @tag(SUBSCRIBERS_TOKENS_TAG)
  interface SubscriberTokens {
    @operationId("create_subscriber_token")
    @summary("Create Subscriber token")
    @doc("""
      Creates a Subscriber Access Token (SAT) for a known [Subscriber](/docs/platform/subscribers), identified by `reference`, and optionally updates that subscriber's profile. Call it from your server when a Browser SDK or other subscriber client needs to sign in. Tokens expire after two hours by default; bind one to a client with `fingerprint` and `sat:refresh` when that client should refresh its own access, or use [Refresh Subscriber token](/docs/apis/rest/subscribers/tokens/refresh-subscriber-token) from your backend.

      Use [Create Subscriber guest token](/docs/apis/rest/subscribers/tokens/create-subscriber-guest-token) for temporary access limited to selected resource addresses, or [Create API token](/docs/apis/rest/project-tokens/create-token) for server-side REST authentication.

      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    create(...SubscriberTokenRequest):
      | SubscriberTokenResponse
      | StatusCode401
      | StatusCode404
      | SubscriberTokenStatusCode422
      | StatusCode500;
  }
}

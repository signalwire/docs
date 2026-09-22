// Import necessary modules or types
import "@typespec/http";
import "@typespec/openapi";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "./models/errors.tsp";
import "../tags.tsp";
import "../../../_shared/alias/token-permissions.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using Types.StatusCodes;

// Define the API path for embeds
@useAuth({
  type: Http.AuthType.noAuth,
})
@route("/embeds/tokens")
@server("https://embeds.signalwire.com", "Embeds Endpoint")
namespace SignalWireAPI.Fabric.EmbedsTokens {
  @tag(SUBSCRIBERS_TOKENS_TAG)
  @friendlyName("Embeds Tokens")
  interface EmbedsTokens {
    @operationId("create_guest_embed_token")
    @summary("Create guest embed token")
    @doc("""
      Exchanges a public Click-to-Call token for a short-lived guest [Subscriber](/docs/platform/subscribers) token consumed by the Click-to-Call embed client. Use it only for a public embed flow that must place a call without exposing project credentials or requiring a full subscriber account.

      Use [Create Subscriber guest token](/docs/apis/rest/subscribers/tokens/create-subscriber-guest-token) when your server chooses the guest's allowed resource addresses, or [Create Subscriber token](/docs/apis/rest/subscribers/tokens/create-subscriber-token) for a known subscriber.

      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    @post
    create(@body body: EmbedsTokensRequest):
      | {
          @statusCode statusCode: 201;
          @body subscriber: EmbedsTokensResponse;
        }
      | StatusCode401
      | StatusCode404
      | StatusCode403
      | EmbedTokenCreateStatusCode422
      | StatusCode500;
  }
}

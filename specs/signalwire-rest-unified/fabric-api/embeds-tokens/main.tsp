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
    @summary("Create Guest Embed Token")
    @doc("""
      Creates a guest subscriber token from a public Click-to-Call (C2C) token. The returned short-lived token authorizes a guest subscriber to place a call through the C2C embed widget without exposing sensitive credentials or requiring a full subscriber account.

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

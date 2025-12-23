// Import necessary modules or types
import "@typespec/http";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "./models/errors.tsp";
import "../tags.tsp";

using TypeSpec.Http;
using Types.StatusCodes;

// Define the API path for embeds
@useAuth({
  type: Http.AuthType.noAuth,
})
@route("/embeds/tokens")
@server("https://embeds.signalwire.com/api/fabric", "Embeds Endpoint")
namespace FabricAPI.EmbedsTokens {
  @tag(EMBEDS_TOKENS_TAG)
  @friendlyName("Embeds Tokens")
  interface EmbedsTokens {
    @summary("Create Embeds Tokens")
    @doc("""
      Exchanges a public Click-to-Call (C2C) token for a short-lived, private embed guest token used to authorize a call. This allows secure activation of the C2C widget without exposing sensitive credentials.

      #### Permissions

      The API token used to authenticate must have one of the following scopes enabled to make a successful request: _Voice_, _Messaging_, _Fax_, or _Video_.

      [Learn more about API scopes](/platform/dashboard/getting-started/your-signalwire-api-space#api-token-scopes).
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

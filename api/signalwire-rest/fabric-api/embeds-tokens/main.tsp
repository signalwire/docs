// Import necessary modules or types
import "@typespec/http";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "./models/errors.tsp";

using TypeSpec.Http;
using Types.StatusCodes;

// Define the API path for embeds
@useAuth({ type: Http.AuthType.noAuth })
@route("/embeds/tokens")
namespace FabricAPI.EmbedsTokens {
    @tag("Embeds Tokens")
    @friendlyName("Embeds Tokens")
    interface EmbedsTokens {
        @summary("Create Embeds Tokens")
        @doc("Exchanges a public Click-to-Call (C2C) token for a short-lived, private embed guest token used to authorize a call. This allows secure activation of the C2C widget without exposing sensitive credentials.")
        @post
        create(@body body: EmbedsTokensRequest):
        { @statusCode statusCode: 201; @body subscriber: EmbedsTokensResponse; } |
        StatusCode401 |
        StatusCode404 |
        StatusCode403;
    }
}

// Import necessary modules or types
import "@typespec/http";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "./models/errors.tsp";

using TypeSpec.Http;
using Types.StatusCodes;

// Define the API path for embeds
@route("/embeds/tokens")
namespace FabricAPI.EmbedsTokens {
    @tag("Embeds Tokens")
    @friendlyName("Embeds Tokens")
    interface EmbedsTokens {
        @summary("Create Embeds Tokens")
        @post
        create(@body body: EmbedsTokensRequest):
        { @statusCode statusCode: 201; @body subscriber: EmbedsTokensResponse; } |
        StatusCode401 |
        StatusCode404 |
        StatusCode403;
    }
}

import "@typespec/http";
import "../../types";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";

using TypeSpec.Http;
using Types.StatusCodes;

@route("/tokens")
namespace ChatAPI.Tokens {
  @tag("Tokens")
  @friendlyName("Tokens")
  interface ChatTokens {
    @summary("Generate a new Chat Token")
    @doc("""
      Generate a Chat Token to be used to authenticate clients to the Chat Service.
      
      
      #### Permissions
      
      The API token used to authenticate must have the following scopes enabled to make a successful request: _Chat_.
      
      [Learn more about API scopes](/platform/dashboard/getting-started/your-signalwire-api-space#api-token-scopes).
      """)
    create(...NewChatToken):
      | {
          @statusCode statusCode: 201;
          @body call: ChatToken;
        }
      | StatusCode401
      | StatusCode404
      | ChatToken422Error;
  }
}

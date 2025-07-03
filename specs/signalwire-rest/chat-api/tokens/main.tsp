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
            
            The API token must include the following scopes: `Chat`.
            """)
        create(...NewChatToken):
        { @statusCode statusCode: 201; @body call: ChatToken; } |
        StatusCode401 |
        StatusCode404 |
        ChatToken422Error;
    }

}

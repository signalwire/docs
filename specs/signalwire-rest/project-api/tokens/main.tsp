import "@typespec/http";
import "@typespec/openapi";
import "../../types";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "./models/errors.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using Types.StatusCodes;

@route("/tokens")
namespace ProjectAPI.Tokens {
  @tag("Tokens")
  @friendlyName("Tokens")
  interface ProjectTokens {
    @operationId("create_api_token")
    @summary("Generate a new API Token")
    @doc("""
      Generate an API Token for a project to be used to authenticate requests within the project.
      
      
      #### Permissions
      
      You must set the functions allowed by this API Token by selecting which types of requests this API Token is allowed to make.
      
      Valid options are: calling, chat, fax, management, messaging, numbers, pubsub, storage, tasking, and video
      """)
    @post
    create(...CreateTokenRequest):
      | {
          @statusCode statusCode: 200;
          @body body: TokenResponse;
        }
      | StatusCode401
      | TokenStatusCode422
      | StatusCode500;

    @operationId("update_api_token")
    @summary("Update an API Token")
    @doc("""
      Update an API Token's name or permissions.
      
      
      #### Permissions
      
      You can modify the functions allowed by this API Token by selecting which types of requests this API Token is allowed to make.
      
      Valid options are: calling, chat, fax, management, messaging, numbers, pubsub, storage, tasking, and video
      """)
    @patch(#{implicitOptionality: true})
    update(@path token_id: string, ...UpdateTokenRequest):
      | {
          @statusCode statusCode: 200;
          @body body: TokenResponse;
        }
      | StatusCode401
      | StatusCode404
      | TokenStatusCode422
      | StatusCode500;

    @operationId("delete_api_token")
    @summary("Delete an API Token")
    @doc("Delete an API Token. This action cannot be undone.")
    @delete
    delete(@path @doc("The unique identifier of the token that you want to update.") token_id: string):
      | {
          @statusCode statusCode: 204;
        }
      | StatusCode401
      | StatusCode404
      | StatusCode500;
  }
}

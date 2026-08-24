import "@typespec/http";
import "@typespec/openapi";
import "../../types";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "./models/errors.tsp";
import "../../../_shared/alias/token-permissions.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using Types.StatusCodes;

@route("/tokens")
namespace SignalWireAPI.Project.Tokens {
  @tag(PROJECT_TOKENS_TAG)
  @friendlyName("Tokens")
  interface ProjectTokens {
    @operationId("create_token")
    @summary("Create API token")
    @doc("""
      Creates a project API token for server-side authentication to SignalWire REST APIs, with only the permission categories supplied in the request. Use it when a backend service needs durable project credentials; client applications should receive a service-specific token such as a [Chat Token](/docs/apis/rest/chat-tokens/create-chat-token), [PubSub Token](/docs/apis/rest/pubsub/create-token), [Room Token](/docs/apis/rest/video/room-tokens/create-room-token), or [Subscriber Token](/docs/apis/rest/subscribers/tokens/create-subscriber-token) instead. The token remains usable until you delete it or remove required permissions.

      The Compatibility API exposes the same project tokens through its account-scoped route. Use [Generate a new API Token](/docs/compatibility-api/rest/tokens/create-token) for that request format.
      
      ${tokenPermissions<"_Management_">}
      
      #### Token Permissions
      
      You must set the functions allowed by this API Token by selecting which types of requests this API Token is allowed to make.
      
      Valid options are: calling, chat, datasphere, fax, management, messaging, numbers, pubsub, storage, tasking, and video
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

    @operationId("update_token")
    @summary("Update API token")
    @doc("""
      Changes the name or enabled permission categories of an existing project API token. Use it to rotate a token's responsibilities without replacing its identifier; remove permissions that the token's server-side caller no longer needs. For the account-scoped Compatibility API route, use [Update an API Token](/docs/compatibility-api/rest/tokens/update-token).
      
      ${tokenPermissions<"_Management_">}
      
      #### Token Permissions
      
      You can modify the functions allowed by this API Token by selecting which types of requests this API Token is allowed to make.
      
      Valid options are: calling, chat, datasphere, fax, management, messaging, numbers, pubsub, storage, tasking, and video
      """)
    @patch(#{ implicitOptionality: true })
    update(
      @path
      @doc("The unique identifier of the token to update.")
      @example("ea14556a-984f-11ee-b9d1-0242ac120002")
      token_id: uuid,

      ...UpdateTokenRequest,
    ):
      | {
          @statusCode statusCode: 200;
          @body body: TokenResponse;
        }
      | StatusCode401
      | StatusCode404
      | TokenStatusCode422
      | StatusCode500;

    @operationId("delete_token")
    @summary("Delete API token")
    @doc("""
      Permanently revokes and deletes a project API token. Use it when a server-side credential has been exposed, retired, or replaced; clients using Chat, PubSub, Room, or Subscriber Tokens require the corresponding service-specific token lifecycle instead. For the account-scoped Compatibility API route, use [Delete an API Token](/docs/compatibility-api/rest/tokens/delete-token).
      
      ${tokenPermissions<"_Management_">}
      """)
    @delete
    delete(
      @path
      @doc("The unique identifier of the token that you want to delete.")
      @example("ea14556a-984f-11ee-b9d1-0242ac120002")
      token_id: uuid,
    ):
      | {
          @statusCode statusCode: 204;
        }
      | StatusCode401
      | StatusCode404
      | StatusCode500;
  }
}

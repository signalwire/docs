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
    @operationId("list_tokens")
    @summary("List API tokens")
    @doc("""
      Lists the project API tokens the caller can manage, newest first. Use it to find the `id` of a token before you [update](/docs/apis/rest/project-tokens/update-token), [regenerate](/docs/apis/rest/project-tokens/regenerate-token), or [delete](/docs/apis/rest/project-tokens/delete-token) it, or to check when each token last authenticated a request.

      Token values are never returned. A token's value appears only in the response that issued it: [Create API token](/docs/apis/rest/project-tokens/create-token) or [Regenerate API token](/docs/apis/rest/project-tokens/regenerate-token).

      With a project API token, the list covers the tokens of the authenticated project and its subprojects. With a [Personal access token](/docs/apis/authorization#personal-access-tokens), it covers the tokens of every project the token holder is enabled for, plus their subprojects. Pass `project_id` to narrow the list to one project.

      ${tokenOrPatPermissions<"_Management_">}
      """)
    @get
    list(...ListTokensQuery):
      | {
          @statusCode statusCode: 200;
          @body body: TokenListResponse;
        }
      | StatusCode401
      | ListTokensStatusCode422
      | StatusCode500;

    @operationId("create_token")
    @summary("Create API token")
    @doc("""
      Creates a project API token for server-side authentication to SignalWire REST APIs, with only the permission categories supplied in the request. Use it when a backend service needs durable project credentials; client applications should receive a service-specific token such as a [Chat Token](/docs/apis/rest/chat-tokens/create-chat-token), [PubSub Token](/docs/apis/rest/pubsub/create-token), [Room Token](/docs/apis/rest/video/room-tokens/create-room-token), or [Subscriber Token](/docs/apis/rest/subscribers/tokens/create-subscriber-token) instead. The token remains usable until you delete it or remove required permissions.

      The Compatibility API exposes the same project tokens through its account-scoped route. Use [Generate a new API Token](/docs/compatibility-api/rest/tokens/create-token) for that request format.

      The response is the only place the token secret is returned. Store it securely; no later request, including [Update API token](/docs/apis/rest/project-tokens/update-token) and [List API tokens](/docs/apis/rest/project-tokens/list-tokens), can read it back. If you lose it, [Regenerate API token](/docs/apis/rest/project-tokens/regenerate-token) issues a new value for the same token.

      With a project API token, the new token belongs to the authenticated project, or to one of its subprojects when `subproject_id` is given; `project_id` is ignored. With a [Personal access token](/docs/apis/authorization#personal-access-tokens), `project_id` is required and names the project the token is created for, which is how a root project created with [Create a project](/docs/apis/rest/projects/create-subproject) gets its first credential.
      
      ${tokenOrPatPermissions<"_Management_">}
      
      #### Token Permissions
      
      You must set the functions allowed by this API Token by selecting which types of requests this API Token is allowed to make.
      
      Valid options are: calling, chat, datasphere, fax, management, messaging, numbers, pubsub, storage, tasking, and video
      """)
    @post
    create(...CreateTokenRequest):
      | {
          @statusCode statusCode: 200;
          @body body: CreateTokenResponse;
        }
      | StatusCode401
      | TokenStatusCode422
      | StatusCode500;

    @operationId("update_token")
    @summary("Update API token")
    @doc("""
      Changes the name or enabled permission categories of an existing project API token. Use it to change a token's permissions without replacing its identifier; remove permissions that the token's server-side caller no longer needs. For the account-scoped Compatibility API route, use [Update an API Token](/docs/compatibility-api/rest/tokens/update-token).

      Updating a token does not change its value. The response omits the token secret, which is returned only by [Create API token](/docs/apis/rest/project-tokens/create-token) and [Regenerate API token](/docs/apis/rest/project-tokens/regenerate-token).
      
      ${tokenOrPatPermissions<"_Management_">}
      
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
      
      ${tokenOrPatPermissions<"_Management_">}
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

    @operationId("regenerate_token")
    @summary("Regenerate API token")
    @doc("""
      Replaces a project API token's value and returns the new value. Use it to rotate a credential on a schedule, after it has been exposed, or when its value has been lost. The token keeps its `id`, `name`, and `permissions`, so there is nothing to re-enter; to change those, use [Update API token](/docs/apis/rest/project-tokens/update-token).

      The previous value stops working immediately, on every API that accepts a project API token. Anything still using it receives `401 Unauthorized` until you give it the new value.

      The response is the only place the new value is returned; store it securely. If you lose it, regenerate the token again.

      The new value always uses the current token format: 42 characters beginning with `swapi_`. A token issued in the legacy format, 50 characters beginning with `PT`, changes format and length when regenerated, so update anything that validates or stores token values by length or prefix.

      You can regenerate the token you are authenticating with. The request succeeds, but the value you sent is no longer valid once it does, so save the new value from the response before making any further request.

      A token the caller cannot reach returns `404 Not Found`. Use [List API tokens](/docs/apis/rest/project-tokens/list-tokens) to find the `id` of each token you can manage.

      ${tokenOrPatPermissions<"_Management_">}
      """)
    @route("/{token_id}/regenerate")
    @post
    regenerate(
      @path
      @doc("The unique identifier of the token to regenerate.")
      @example("ea14556a-984f-11ee-b9d1-0242ac120002")
      token_id: uuid,
    ):
      | {
          @statusCode statusCode: 200;
          @body body: CreateTokenResponse;
        }
      | StatusCode401
      | StatusCode404
      | StatusCode500;
  }
}

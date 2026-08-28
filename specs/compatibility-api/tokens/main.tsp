import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "../_shared/errors.tsp";
import "../tags.tsp";
import "../../_shared/alias/token-permissions.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;

@route("/Accounts/{AccountSid}/tokens")
namespace CompatibilityAPI.Tokens {
  @tag(TOKENS_TAG)
  @friendlyName("Tokens")
  interface Tokens {
    @operationId("create_token")
    @summary("Generate a new API Token")
    @doc("""
      Creates a project API token for server-side REST authentication within the project. It remains usable until you delete it or remove required permissions. Client applications should receive a service-specific Chat, PubSub, Room, or Subscriber Token instead.

      For the SignalWire REST API's project route, use [Create API token](/docs/apis/rest/project-tokens/create-token).
      
      ${tokenPermissions<"_Management_">}
      """)
    @post
    create(
      ...TokensAccountSidPath,
      @header contentType: "application/x-www-form-urlencoded",
      @body body: CreateTokenRequest,
    ):
      | TokenResponse
      | CompatibilityStatusCode400
      | CompatibilityStatusCode401
      | CompatibilityStatusCode422Token;

    @operationId("update_token")
    @summary("Update an API Token")
    @doc("""
      Changes the name or enabled permission categories of an existing project API token. For the SignalWire REST API's project route, use [Update API token](/docs/apis/rest/project-tokens/update-token).
      
      ${tokenPermissions<"_Management_">}
      """)
    @patch(#{ implicitOptionality: true })
    @route("/{token_id}")
    update(
      ...TokensAccountSidPath,
      ...TokenIdPath,
      @header contentType: "application/json",
      @body body: UpdateTokenRequest,
    ):
      | TokenResponse
      | CompatibilityStatusCode400
      | CompatibilityStatusCode401
      | CompatibilityStatusCode404
      | CompatibilityStatusCode422Token;

    @operationId("delete_token")
    @summary("Delete an API Token")
    @doc("""
      Permanently revokes and deletes a project API token. Use it when a server-side credential has been exposed, retired, or replaced. For the SignalWire REST API's project route, use [Delete API token](/docs/apis/rest/project-tokens/delete-token).
      
      ${tokenPermissions<"_Management_">}
      """)
    @delete
    @route("/{token_id}")
    delete(...TokensAccountSidPath, ...TokenIdPath):
      | CompatibilityStatusCode204
      | CompatibilityStatusCode400
      | CompatibilityStatusCode401
      | CompatibilityStatusCode404;
  }
}

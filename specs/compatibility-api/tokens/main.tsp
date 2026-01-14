import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "../_shared/errors.tsp";
import "../tags.tsp";

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
      Generate an API Token for a project to be used to authenticate requests within the project.
      """)
    @post
    create(...TokensAccountSidPath, @body body: CreateTokenRequest): TokenResponse | StatusCode401 | StatusCode422;

    @operationId("update_token")
    @summary("Update an API Token")
    @doc("""
      Update an API Token's name or permissions.
      """)
    @patch(#{implicitOptionality: true})
    @route("/{token_id}")
    update(...TokensAccountSidPath, ...TokenIdPath, @body body: UpdateTokenRequest): TokenResponse | StatusCode401 | StatusCode422;

    @operationId("delete_token")
    @summary("Delete an API Token")
    @doc("""
      Delete an API Token. This action cannot be undone.
      """)
    @delete
    @route("/{token_id}")
    delete(...TokensAccountSidPath, ...TokenIdPath): StatusCode204 | StatusCode401 | StatusCode404;
  }
}

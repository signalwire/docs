import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "../_shared/errors.tsp";
import "../tags.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;

@route("/Accounts")
namespace CompatibilityAPI.Accounts {
  @tag(ACCOUNTS_TAG)
  @friendlyName("Accounts")
  interface Accounts {
    @operationId("list_accounts")
    @summary("List Accounts")
    @doc("""
      This endpoint will return a list that contains Project you are connecting as and any subprojects.

      #### Permissions
      The API token must include the following scopes: _Management_.
      """)
    list(
      @query
      @doc("A named unique identifier for the resource. Allowed characters: `A-Za-z0-9_-`. Maximum of 100 characters.")
      @example("My Friendly Name")
      FriendlyName?: string,
    ): AccountListResponse | StatusCode401;

    @operationId("create_subprojects")
    @summary("Create Subprojects")
    @doc("""
      This endpoint creates a subproject on the Project you are connecting as.

      #### Permissions
      The API token must include the following scopes: _Management_.
      """)
    @post
    create(@body body: CreateSubprojectRequest): AccountResponse | StatusCode401 | StatusCode400;

    @operationId("get_account")
    @summary("Find an Account by ID")
    @doc("""
      Find a Project (also referred to as _Account_) by ID.

      #### Permissions
      The API token must include the following scopes: _Management_.
      """)
    read(...AccountPathSid): AccountResponse | StatusCode401 | StatusCode404;

    @operationId("update_account")
    @summary("Update an Account")
    @doc("""
      Update a Project (also referred to as _Account_).

      #### Permissions
      The API token must include the following scopes: _Management_.
      """)
    @post
    @route("/{Sid}")
    update(...AccountPathSid, @body body: UpdateAccountRequest): AccountResponse | StatusCode401 | StatusCode404;
  }
}

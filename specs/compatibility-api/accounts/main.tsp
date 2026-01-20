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

      @query
      @doc("The page number to retrieve. Page numbers are zero-indexed, so the first page is 0.")
      @minValue(0)
      @example(0)
      Page?: int32 = 0,

      @query
      @doc("The number of results to return per page. The default is 50, and the maximum is 1000.")
      @minValue(1)
      @maxValue(1000)
      @example(50)
      PageSize?: int32 = 50,

      @query
      @doc("A token used to retrieve a specific page of results. The token is returned in the response of a previous request.")
      @example("PAb3877c40da604998")
      PageToken?: string,
    ): AccountListResponse | CompatibilityStatusCode400 | CompatibilityStatusCode401 | CompatibilityStatusCode422;

    @operationId("create_subprojects")
    @summary("Create Subprojects")
    @doc("""
      This endpoint creates a subproject on the Project you are connecting as.

      #### Permissions
      The API token must include the following scopes: _Management_.
      """)
    @post
    create(
      @header contentType: "application/x-www-form-urlencoded",
      @body body: CreateSubprojectRequest,
    ): AccountCreatedResponse | CompatibilityStatusCode400 | CompatibilityStatusCode401 | CompatibilityStatusCode422;

    @operationId("get_account")
    @summary("Find an Account by ID")
    @doc("""
      Find a Project (also referred to as _Account_) by ID.

      #### Permissions
      The API token must include the following scopes: _Management_.
      """)
    read(...AccountPathSid): AccountResponse | CompatibilityStatusCode400 | CompatibilityStatusCode401 | CompatibilityStatusCode404;

    @operationId("update_account")
    @summary("Update an Account")
    @doc("""
      Update a Project (also referred to as _Account_).

      #### Permissions
      The API token must include the following scopes: _Management_.
      """)
    @post
    @route("/{Sid}")
    update(
      ...AccountPathSid,
      @header contentType: "application/x-www-form-urlencoded",
      @body body: UpdateAccountRequest,
    ): AccountResponse | CompatibilityStatusCode400 | CompatibilityStatusCode401 | CompatibilityStatusCode404 | CompatibilityStatusCode422;
  }
}

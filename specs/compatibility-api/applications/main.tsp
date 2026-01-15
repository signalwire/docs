import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "../_shared/errors.tsp";
import "../tags.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;

@route("/Accounts/{AccountSid}/Applications")
namespace CompatibilityAPI.Applications {
  @tag(APPLICATIONS_TAG)
  @friendlyName("Applications")
  interface Applications {
    @operationId("list_applications")
    @summary("List Applications")
    @doc("""
      The ability to read all of the applications that are associated with your Account. This will be returned as a list of applications.

      #### Permissions
      The API token must include one of the following scopes: _Voice_ or _Messaging_ or _Fax_.
      """)
    list(
      ...AccountSidPath,
      @query
      @doc("A named unique identifier for the resource. Allowed characters: `A-Za-z0-9_-`. Maximum of 100 characters.")
      @example("My Friendly Name")
      FriendlyName?: string,
    ): ApplicationListResponse | CompatibilityStatusCode401;

    @operationId("create_application")
    @summary("Create an Application")
    @doc("""
      Create an Application.

      #### Permissions
      The API token must include one of the following scopes: _Voice_ or _Messaging_ or _Fax_.
      """)
    @post
    create(
      ...AccountSidPath,
      @header contentType: "application/x-www-form-urlencoded",
      @body body: CreateApplicationRequest,
    ): ApplicationResponse | CompatibilityStatusCode401 | CompatibilityStatusCode400;

    @operationId("get_application")
    @summary("Find an Application by ID")
    @doc("""
      Find an Application by ID.

      #### Permissions
      The API token must include one of the following scopes: _Voice_ or _Messaging_ or _Fax_.
      """)
    @route("/{Sid}")
    read(...AccountSidPath, ...ApplicationPathSid): ApplicationResponse | CompatibilityStatusCode401 | CompatibilityStatusCode404;

    @operationId("update_application")
    @summary("Update an Application")
    @doc("""
      Update an Application.

      #### Permissions
      The API token must include one of the following scopes: _Voice_ or _Messaging_ or _Fax_.
      """)
    @post
    @route("/{Sid}")
    update(
      ...AccountSidPath,
      ...ApplicationPathSid,
      @header contentType: "application/x-www-form-urlencoded",
      @body body: UpdateApplicationRequest,
    ): ApplicationResponse | CompatibilityStatusCode401 | CompatibilityStatusCode404;

    @operationId("delete_application")
    @summary("Delete an Application")
    @doc("""
      Delete an Application.

      #### Permissions
      The API token must include one of the following scopes: _Voice_ or _Messaging_ or _Fax_.
      """)
    @delete
    @route("/{Sid}")
    delete(...AccountSidPath, ...ApplicationPathSid): CompatibilityStatusCode204 | CompatibilityStatusCode401 | CompatibilityStatusCode404;
  }
}

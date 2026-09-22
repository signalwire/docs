import "@typespec/http";
import "@typespec/openapi";
import "../types";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "./models/errors.tsp";
import "../_globally_shared/const.tsp";
import "../../_shared/auth.tsp";
import "../../_shared/alias/token-permissions.tsp";
import "./tags.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using Types.StatusCodes;

@route("/api/projects")
@useAuth(SignalWireBasicAuth | SignalWirePersonalAccessTokenAuth)
namespace SignalWireAPI.Projects {
  @tag(PROJECTS_TAG)
  @friendlyName("Projects")
  interface Projects {
    @operationId("list_projects")
    @summary("List projects")
    @doc("""
      Lists the projects the caller can reach.

      With a project API token, that is the authenticated root project and its
      subprojects. With a Personal access token, it is every root project the token holder
      is enabled for, plus their subprojects.

      Filter by name when locating a project, or use [Retrieve a project](/docs/apis/rest/projects/get-project) when you already have its ID. Integrations built around Compatibility API Account SIDs can use [List accounts](/docs/compatibility-api/rest/accounts/list-accounts) instead.
      
      ${tokenOrPatPermissions<"_Management_">}
      """)
    @get
    list(
      ...ListProjectsQuery,
    ): ProjectListResponse | StatusCode401 | StatusCode500;

    @operationId("create_subproject")
    @summary("Create a project")
    @doc("""
      Creates a project. Which kind depends on the credential:

      - With a **project API token**, the new project is always a subproject of the
        authenticated root project, and `parent_project_id` is ignored. Creating while
        authenticated as a subproject fails with `422 nested_subprojects_not_allowed`,
        since a subproject cannot contain subprojects.
      - With a **Personal access token**, omit `parent_project_id` to create a root
        project, or set it to create a subproject of that project. The parent must be a
        root project the token holder can reach (`invalid_parent_project_id`,
        `nested_subprojects_not_allowed`).

      A new root project has no API token yet. Give it one with
      [Create API token](/docs/apis/rest/project-tokens/create-token), passing its id as
      `project_id`.
      
      The response includes the `signing_key`. This is the only time it is returned — it
      cannot be retrieved through the API afterward, so capture it from this response.

      Use a subproject to isolate settings and resources beneath a root project. Integrations built around Compatibility API Account SIDs can use [Create subprojects](/docs/compatibility-api/rest/accounts/create-subprojects) instead.
      
      ${tokenOrPatPermissions<"_Management_">}
      """)
    @post
    create(@body body: CreateProjectRequest):
      | {
          @statusCode statusCode: 201;
          @body body: ProjectWithSigningKey;
        }
      | StatusCode401
      | CreateProjectStatusCode422
      | StatusCode500;

    @operationId("get_project")
    @summary("Retrieve a project")
    @doc("""
      Retrieves a single project or subproject.
      
      A project ID the caller cannot reach returns `404 Not Found`.

      Use this operation when you already have the root-project or subproject ID; use [List projects](/docs/apis/rest/projects/list-projects) to discover IDs. Compatibility API Accounts use a separate SID-based retrieval route.
      
      ${tokenOrPatPermissions<"_Management_">}
      """)
    @get
    read(...ProjectPathID):
      | Project
      | StatusCode401
      | StatusCode404
      | StatusCode500;

    @operationId("update_project")
    @summary("Update a project")
    @doc("""
      Changes the name and security settings of a root project or subproject the caller can reach. Use it to control media protection and HTTPS requirements; project API tokens are managed separately through [Project Tokens](/docs/apis/rest/project-tokens/create-token). Compatibility API Accounts use their own SID-based update route.
      
      ${tokenOrPatPermissions<"_Management_">}
      """)
    @patch(#{ implicitOptionality: true })
    update(...ProjectPathID, @body body: UpdateProjectRequest):
      | {
          @statusCode statusCode: 200;
          @body body: Project;
        }
      | StatusCode401
      | StatusCode404
      | UpdateProjectStatusCode422
      | StatusCode500;

    @operationId("delete_subproject")
    @summary("Delete a project")
    @doc("""
      Deletes a project.

      With a project API token, only subprojects can be deleted; targeting the root
      project returns `422 only_subprojects_can_be_deleted`. With a Personal access token,
      a root project can be deleted as well.

      In both cases the project must be empty first: remove its subprojects
      (`subprojects_must_be_removed`) and its phone numbers
      (`phone_numbers_must_be_removed`). The last remaining project in a space cannot be
      deleted (`last_project_cannot_be_deleted`).
      
      On a successful subproject delete, the subproject's registry brands and campaigns
      are migrated up to the parent project.

      Use this operation only for a project that is ready to retire. The Compatibility API cannot close an account; its [Update account](/docs/compatibility-api/rest/accounts/update-account) operation only renames one, so deleting the project here is the API path for retiring it.
      
      ${tokenOrPatPermissions<"_Management_">}
      """)
    @delete
    delete(...ProjectPathID):
      | {
          @statusCode statusCode: 204;
        }
      | StatusCode401
      | StatusCode404
      | DeleteProjectStatusCode422
      | StatusCode500;

    @operationId("rotate_signing_key")
    @summary("Rotate a project's signing key")
    @doc("""
      Rotates the project's signing key and returns the project with the new `signing_key`.
      
      The previous key may take about 1–2 minutes to stop working. As with create, the
      `signing_key` is only returned on this response and cannot be retrieved afterward.

      Use it when the project's webhook-signing credential has been exposed or is due for rotation; this is separate from creating or revoking REST API tokens.
      
      ${tokenOrPatPermissions<"_Management_">}
      """)
    @route("/{id}/signing-key/rotate")
    @post
    rotateSigningKey(...ProjectPathID):
      | {
          @statusCode statusCode: 200;
          @body body: ProjectWithSigningKey;
        }
      | StatusCode401
      | StatusCode404
      | StatusCode500;
  }
}

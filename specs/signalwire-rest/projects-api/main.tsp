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
namespace SignalWireAPI.Projects {
  @tag(PROJECTS_TAG)
  @friendlyName("Projects")
  interface Projects {
    @operationId("list_projects")
    @summary("List projects")
    @doc("""
      Lists the authenticated root project and its subprojects.
      
      All endpoints operate only within the caller's project tree — the authenticated root
      project and the subprojects beneath it.

      Filter by name when locating a project, or use [Retrieve a project](/docs/apis/rest/projects/get-project) when you already have its ID. Integrations built around Compatibility API Account SIDs can use [List accounts](/docs/compatibility-api/rest/accounts/list-accounts) instead.
      
      ${tokenPermissions<"_Management_">}
      """)
    @get
    list(
      ...ListProjectsQuery,
    ): ProjectListResponse | StatusCode401 | StatusCode500;

    @operationId("create_subproject")
    @summary("Create a subproject")
    @doc("""
      Creates a subproject under the authenticated root project.
      
      Creating a project is only allowed when authenticated as a top-level (root) project.
      A subproject cannot itself contain subprojects, so attempting to create one while
      authenticated as a subproject fails with `422 nested_subprojects_not_allowed`.
      
      The response includes the `signing_key`. This is the only time it is returned — it
      cannot be retrieved through the API afterward, so capture it from this response.

      Use a subproject to isolate settings and resources beneath a root project. Integrations built around Compatibility API Account SIDs can use [Create subprojects](/docs/compatibility-api/rest/accounts/create-subprojects) instead.
      
      ${tokenPermissions<"_Management_">}
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
      
      A project ID outside the caller's project tree returns `404 Not Found`.

      Use this operation when you already have the root-project or subproject ID; use [List projects](/docs/apis/rest/projects/list-projects) to discover IDs. Compatibility API Accounts use a separate SID-based retrieval route.
      
      ${tokenPermissions<"_Management_">}
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
      Changes the name and security settings of a root project or subproject in the caller's project tree. Use it to control media protection and HTTPS requirements; project API tokens are managed separately through [Project Tokens](/docs/apis/rest/project-tokens/create-token). Compatibility API Accounts use their own SID-based update route.
      
      ${tokenPermissions<"_Management_">}
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
    @summary("Delete a subproject")
    @doc("""
      Deletes a subproject.
      
      Only subprojects can be deleted through this API. Deleting the root/parent project
      returns `422 only_subprojects_can_be_deleted`. A project must have no phone numbers
      before it can be deleted; otherwise the request returns `422 phone_numbers_must_be_removed`.
      
      On a successful delete, the subproject's registry brands and campaigns are migrated up
      to the parent project.

      Use this operation only for a subproject that is ready to retire. The Compatibility API cannot close an account; its [Update account](/docs/compatibility-api/rest/accounts/update-account) operation only renames one, so deleting the subproject here is the API path for retiring it.
      
      ${tokenPermissions<"_Management_">}
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
      
      ${tokenPermissions<"_Management_">}
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

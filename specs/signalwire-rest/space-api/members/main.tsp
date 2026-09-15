import "@typespec/http";
import "@typespec/openapi";
import "../../types";
import "../tags.tsp";
import "../models/shared.tsp";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "./models/errors.tsp";
import "../../../_shared/alias/token-permissions.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using Types.StatusCodes;

namespace SignalWireAPI.Space;

@route("/members")
@tag(SPACE_MEMBERS_TAG)
@friendlyName("Members")
interface Members {
  @operationId("list_members")
  @summary("List members")
  @doc("""
    Lists the members of the space, optionally filtered by role. Results are paged; follow
    the `links.next` URL for the next page, which carries the filter and the `page_token`
    for you.

    A member who has been invited but has not accepted appears with `activated: false`.

    ${patPermissions}
    """)
  @get
  list(...ListMembersQuery):
    | MemberListResponse
    | SpaceUnauthorizedError
    | SpaceUnverifiedError
    | ListMembersStatusCode422
    | StatusCode500;

  @operationId("create_member")
  @summary("Invite a member")
  @doc("""
    Sends an invitation to join the space. The member exists immediately with
    `activated: false` and activates by accepting the invitation.

    Only `admin` and `employee` can be assigned; `owner` is rejected with `invalid_role`.
    Give a new member access to projects with
    [Enable a member for a project](/docs/apis/rest/space/members/enable-member-project).

    ${patPermissions}
    """)
  @post
  create(@body body: CreateMemberRequest):
    | {
        @statusCode statusCode: 201;
        @body body: Member;
      }
    | SpaceInvalidJsonError
    | SpaceUnauthorizedError
    | SpaceUnverifiedError
    | CreateMemberStatusCode422
    | StatusCode500;

  @operationId("get_member")
  @summary("Retrieve a member")
  @doc("""
    Returns a single membership. A membership id that does not exist in this space returns
    `404 Not Found`.

    ${patPermissions}
    """)
  @get
  read(...MemberPathID):
    | Member
    | SpaceUnauthorizedError
    | SpaceUnverifiedError
    | SpaceNotFoundError
    | StatusCode500;

  @operationId("update_member")
  @summary("Update a member")
  @doc("""
    Changes a member's name, role, or job title. `PUT` is accepted on the same path with
    identical semantics.

    The owner's role cannot be changed (`cannot_change_the_owners_role`), and `owner`
    cannot be assigned to anyone else.

    ${patPermissions}
    """)
  @patch(#{ implicitOptionality: false })
  update(...MemberPathID, @body body: UpdateMemberRequest):
    | Member
    | SpaceInvalidJsonError
    | SpaceUnauthorizedError
    | SpaceUnverifiedError
    | SpaceNotFoundError
    | UpdateMemberStatusCode422
    | StatusCode500;

  @operationId("delete_member")
  @summary("Remove a member")
  @doc("""
    Removes a member from the space. The owner cannot be removed
    (`cannot_remove_the_owner`), and you cannot remove your own membership
    (`cannot_remove_yourself`).

    ${patPermissions}
    """)
  @delete
  delete(...MemberPathID):
    | {
        @statusCode statusCode: 204;
      }
    | SpaceUnauthorizedError
    | SpaceUnverifiedError
    | SpaceNotFoundError
    | DeleteMemberStatusCode422
    | StatusCode500;

  @operationId("list_member_projects")
  @summary("List a member's projects")
  @doc("""
    Lists the root projects a member is enabled for. Each entry carries the subprojects
    reached through that enablement, since access to a root project includes all of its
    subprojects.

    ${patPermissions}
    """)
  @route("/{member_id}/projects")
  @get
  listProjects(...MemberProjectsPath, ...SpacePaginationQuery):
    | MemberProjectListResponse
    | SpaceUnauthorizedError
    | SpaceUnverifiedError
    | SpaceNotFoundError
    | ListMemberProjectsStatusCode422
    | StatusCode500;

  @operationId("enable_member_project")
  @summary("Enable a member for a project")
  @doc("""
    Gives a member access to a root project and, through it, to all of the project's
    subprojects. The call is idempotent: repeating it leaves the same single enablement in
    place and returns `200` again.

    Enablement applies to root projects only. Naming a subproject is rejected with
    `subproject_access_is_inherited_from_root`, and the message names the root project to
    enable instead.

    ${patPermissions}
    """)
  @route("/{member_id}/projects/{project_id}")
  @put
  enableProject(...MemberProjectPath):
    | MemberProject
    | SpaceUnauthorizedError
    | SpaceUnverifiedError
    | SpaceNotFoundError
    | MemberProjectStatusCode422
    | StatusCode500;

  @operationId("disable_member_project")
  @summary("Disable a member for a project")
  @doc("""
    Removes a member's access to a root project and its subprojects. The call is
    idempotent: repeating it for a project the member is not enabled for still returns
    `204`.

    ${patPermissions}
    """)
  @route("/{member_id}/projects/{project_id}")
  @delete
  disableProject(...MemberProjectPath):
    | {
        @statusCode statusCode: 204;
      }
    | SpaceUnauthorizedError
    | SpaceUnverifiedError
    | SpaceNotFoundError
    | MemberProjectStatusCode422
    | StatusCode500;
}

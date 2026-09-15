import "@typespec/http";
import "../../../types";

using TypeSpec.Http;

namespace SignalWireAPI.Space;

@doc("A member's role in the space.")
enum MemberRole {
  owner,
  admin,
  employee,
  guest,
}

@doc("The roles that may be assigned through the API. `owner` cannot be assigned, and the owner's role cannot be changed.")
enum AssignableMemberRole {
  admin,
  employee,
}

@doc("A member's job title.")
enum MemberJobTitle {
  entrepreneur,
  product_manager,
  developer,
  other,
}

@doc("The unique identifier of a membership.")
model MemberPathID {
  @doc("The unique identifier of the membership.")
  @example("9f8e7d6c-5b4a-4321-8765-fedcba987654")
  @path
  id: uuid;
}

@doc("The membership whose projects are addressed.")
model MemberProjectsPath {
  @doc("The unique identifier of the membership.")
  @example("9f8e7d6c-5b4a-4321-8765-fedcba987654")
  @path
  member_id: uuid;
}

@doc("The membership and root project addressed by an enablement.")
model MemberProjectPath {
  ...MemberProjectsPath;

  @doc("The unique identifier of a root project. A subproject is rejected with `subproject_access_is_inherited_from_root`, since access to a root project already includes all of its subprojects.")
  @example("4d5e6f70-8192-4a3b-8c4d-5e6f70819234")
  @path
  project_id: uuid;
}

@summary("Member")
@doc("A membership in the space.")
model Member {
  @doc("The object type. Always `member`.")
  @example("member")
  type: "member";

  @doc("The unique identifier of the membership, used in the path of the member endpoints.")
  @example("9f8e7d6c-5b4a-4321-8765-fedcba987654")
  id: uuid;

  @doc("The member's email address.")
  @example("jane@example.com")
  email: string;

  @doc("The member's name, or `null` when none was given.")
  @example("Jane Doe")
  name: string | null;

  @doc("The member's role in the space.")
  @example(MemberRole.admin)
  role: MemberRole;

  @doc("The member's job title, or `null` when not set.")
  @example(MemberJobTitle.developer)
  job_title: MemberJobTitle | null;

  @doc("Whether the member has accepted the invitation. `false` until the invitation is accepted.")
  @example(true)
  activated: boolean;

  @doc("The date and time the member last signed in, or `null` if they never have.")
  @example(utcDateTime.fromISO("2026-08-19T09:12:00Z"))
  last_logged_in: utcDateTime | null;

  @doc("The date and time when the membership was created.")
  @example(utcDateTime.fromISO("2026-02-01T00:00:00Z"))
  created_at: utcDateTime;

  @doc("The date and time when the membership was last updated.")
  @example(utcDateTime.fromISO("2026-08-19T09:12:00Z"))
  updated_at: utcDateTime;
}

@summary("Project (space view)")
@doc("A project as the space sees it. The full project object, including its settings, is returned by the [Projects API](/docs/apis/rest/projects/get-project).")
model SpaceProject {
  @doc("The object type. Always `project`.")
  @example("project")
  type: "project";

  @doc("The unique identifier of the project.")
  @example("4d5e6f70-8192-4a3b-8c4d-5e6f70819234")
  id: uuid;

  @doc("The name of the project.")
  @example("Root Project")
  name: string;

  @doc("The date and time when the project was created.")
  @example(utcDateTime.fromISO("2026-02-01T00:00:00Z"))
  created_at: utcDateTime;

  @doc("The date and time when the project was last updated.")
  @example(utcDateTime.fromISO("2026-02-01T00:00:00Z"))
  updated_at: utcDateTime;
}

@summary("Member project")
@doc("A root project a member is enabled for, with the subprojects reached through that enablement.")
model MemberProject {
  ...SpaceProject;

  @doc("The subprojects reached through this enablement. Present on the enablement endpoints only, not on the nested entries.")
  subprojects: SpaceProject[];
}

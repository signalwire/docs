import "@typespec/http";
import "./core.tsp";
import "../../models/shared.tsp";

using TypeSpec.Http;

namespace SignalWireAPI.Space;

@doc("Query parameters for listing members.")
model ListMembersQuery {
  @doc("Return only members with this role. An unknown value is rejected with `unknown_role`.")
  @query
  role?: MemberRole;

  ...SpacePaginationQuery;
}

@doc("Request body for inviting a member.")
model CreateMemberRequest {
  @doc("The email address to invite. Must be a valid address that does not already belong to a member of the space (`already_a_member`).")
  @example("newhire@example.com")
  email: string;

  @doc("The role to assign: `admin` or `employee`. `owner` cannot be assigned (`invalid_role`).")
  @example(AssignableMemberRole.employee)
  role: AssignableMemberRole;

  @doc("The member's name.")
  @example("New Hire")
  name?: string;
}

@doc("Request body for updating a member.")
model UpdateMemberRequest {
  @doc("The member's name.")
  @example("Jane Doe")
  name: string;

  @doc("The role to assign: `admin` or `employee`. The owner's role cannot be changed (`cannot_change_the_owners_role`).")
  @example(AssignableMemberRole.admin)
  role?: AssignableMemberRole;

  @doc("The member's job title.")
  @example(MemberJobTitle.developer)
  job_title?: MemberJobTitle;
}

import "./core.tsp";
import "../../models/shared.tsp";

namespace SignalWireAPI.Space;

@doc("A page of members.")
model MemberListResponse {
  @doc("Pagination links for the list of members. The `role` filter is preserved in each link.")
  links: SpacePaginationLinks;

  @doc("The members on this page.")
  data: Member[];
}

@doc("A page of the root projects a member is enabled for.")
model MemberProjectListResponse {
  @doc("Pagination links for the list of projects.")
  links: SpacePaginationLinks;

  @doc("The root projects on this page, each with the subprojects reached through it.")
  data: MemberProject[];
}

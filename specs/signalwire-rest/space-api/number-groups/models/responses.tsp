import "./core.tsp";
import "../../addresses/models/responses.tsp";

using TypeSpec.Http;

@doc("Response containing a list of number groups.")
model NumberGroupListResponse {
  @doc("Pagination links.")
  links?: PaginationLinks;

  @doc("List of number groups.")
  data?: NumberGroup[];
}

@doc("Response containing a single number group.")
model NumberGroupResponse {
  ...NumberGroup;
}

@doc("Response containing a list of number group memberships.")
model NumberGroupMembershipListResponse {
  @doc("Pagination links.")
  links?: PaginationLinks;

  @doc("List of number group memberships.")
  data?: NumberGroupMembership[];
}

@doc("Response containing a single number group membership.")
model NumberGroupMembershipResponse {
  ...NumberGroupMembership;
}

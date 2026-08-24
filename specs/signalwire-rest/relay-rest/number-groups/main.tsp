import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "../../types";
import "../tags.tsp";
import "../../../_shared/alias/token-permissions.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using Types.StatusCodes;

@route("/number_groups")
namespace SignalWireAPI.RelayRest.NumberGroups {
  @tag(NUMBER_GROUPS_TAG)
  @friendlyName("Number Groups")
  interface NumberGroups {
    @operationId("list_number_groups")
    @summary("List number groups")
    @doc("""
      Lists the Number Groups in your SignalWire project. A Number Group organizes owned phone numbers into a sender pool and can preserve the same sender for repeated outbound traffic with `sticky_sender`. Use [List number group memberships](/docs/apis/rest/number-group-membership/list-number-group-memberships) to see which numbers belong to a group.
      
      ${tokenPermissions<"_Numbers_">}
      """)
    list(...ListNumberGroupsQuery):
      | NumberGroupListResponse
      | StatusCode401
      | ValidationError
      | StatusCode500;

    @operationId("create_number_group")
    @summary("Create number group")
    @doc("""
      Creates a named pool for project-owned phone numbers, with optional sticky-sender behavior. Use it when outbound traffic should select from a managed group rather than one fixed number; add numbers afterward with [Create number group membership](/docs/apis/rest/number-group-membership/create-number-group-membership). This operation does not purchase phone numbers.
      
      ${tokenPermissions<"_Numbers_">}
      """)
    @post
    create(@body body: CreateNumberGroupRequest):
      | NumberGroupResponse
      | StatusCode401
      | ValidationError
      | StatusCode500;

    @operationId("retrieve_number_group")
    @summary("Get number group")
    @doc("""
      Retrieves one Number Group from your SignalWire project. Use [List number groups](/docs/apis/rest/number-groups/list-number-groups) to find groups, or list its memberships to inspect the actual phone numbers in the pool.
      
      ${tokenPermissions<"_Numbers_">}
      """)
    read(...NumberGroupPathID):
      | NumberGroupResponse
      | StatusCode401
      | StatusCode404
      | ValidationError
      | StatusCode500;

    @operationId("update_number_group")
    @summary("Update number group")
    @doc("""
      Changes how a project Number Group is identified or selects a consistent sender for a recipient. Add or remove individual phone numbers through the Number Group Membership operations instead.
      
      ${tokenPermissions<"_Numbers_">}
      """)
    @put
    update(...NumberGroupPathID, @body body: UpdateNumberGroupRequest):
      | NumberGroupResponse
      | StatusCode401
      | StatusCode404
      | ValidationError
      | StatusCode500;

    @operationId("delete_number_group")
    @summary("Delete number group")
    @doc("""
      Deletes a Number Group by ID. Use it when the pool is no longer needed; this removes the grouping but does not release the project-owned phone numbers that belonged to it.
      
      ${tokenPermissions<"_Numbers_">}
      """)
    @delete
    delete(...NumberGroupPathID):
      | {
          @statusCode statusCode: 204;
        }
      | StatusCode400
      | StatusCode401
      | StatusCode404
      | StatusCode500;
  }

  @tag(NUMBER_GROUP_MEMBERSHIP_TAG)
  @friendlyName("Number Group Membership")
  @route("/{NumberGroupId}/number_group_memberships")
  interface NumberGroupMembershipsNested {
    @operationId("list_number_group_memberships")
    @summary("List number group memberships")
    @doc("""
      Lists the project-owned phone numbers that belong to one Number Group. Use it to understand which senders make up the pool; use [List phone numbers](/docs/apis/rest/phone-numbers/list-phone-numbers) for all numbers owned by the project.
      
      ${tokenPermissions<"_Numbers_">}
      """)
    @get
    listMemberships(...NumberGroupIdPath, ...ListNumberGroupMembershipsQuery):
      | NumberGroupMembershipListResponse
      | StatusCode401
      | StatusCode404
      | ValidationError
      | StatusCode500;

    @operationId("create_number_group_membership")
    @summary("Create number group membership")
    @doc("""
      Adds one project-owned phone number to a Number Group by phone-number ID. Use it to build or expand a sender pool after creating the group; this operation does not purchase or import the number. A phone number can belong to more than one group.
      
      ${tokenPermissions<"_Numbers_">}
      """)
    @post
    addMembership(
      ...NumberGroupIdPath,
      @body body: AddNumberGroupMembershipRequest,
    ):
      | NumberGroupMembershipResponse
      | StatusCode401
      | StatusCode404
      | ValidationError
      | StatusCode500;
  }
}

@route("/number_group_memberships")
namespace SignalWireAPI.RelayRest.NumberGroupMemberships {
  @tag(NUMBER_GROUP_MEMBERSHIP_TAG)
  @friendlyName("Number Group Membership")
  interface NumberGroupMemberships {
    @operationId("retrieve_number_group_membership")
    @summary("Get number group membership")
    @doc("""
      Retrieves one Number Group Membership by ID so you can inspect the link between a project phone number and its sender pool. Use [List number group memberships](/docs/apis/rest/number-group-membership/list-number-group-memberships) to discover memberships for a group.
      
      ${tokenPermissions<"_Numbers_">}
      """)
    read(...NumberGroupMembershipPathID):
      | NumberGroupMembershipResponse
      | StatusCode401
      | StatusCode404
      | ValidationError
      | StatusCode500;

    @operationId("delete_number_group_membership")
    @summary("Delete number group membership")
    @doc("""
      Deletes one Number Group Membership by membership ID, removing the phone number from that pool. This does not release the phone number from the project or delete the Number Group.
      
      ${tokenPermissions<"_Numbers_">}
      """)
    @delete
    delete(...NumberGroupMembershipPathID):
      | {
          @statusCode statusCode: 204;
        }
      | StatusCode400
      | StatusCode401
      | StatusCode404
      | StatusCode500;
  }
}

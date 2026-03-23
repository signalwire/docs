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
      Returns a list of your Number Groups. The groups are returned sorted
      by creation date, with the most recent appearing first. The list is
      filterable by sending in any of the following parameters.
      
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
      Creates a new number group.
      
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
      Retrieves the details of a number group.
      
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
      Updates a number group.
      
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
      Deletes a number group.
      
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
      Returns a list of phone numbers in a number group.
      
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
      Adds a phone number to a number group.
      
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
      Retrieves the details of a number group membership.
      
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
      Removes a phone number from a number group.
      
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

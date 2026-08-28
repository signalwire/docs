import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "../_shared/errors.tsp";
import "../tags.tsp";
import "../../_shared/alias/token-permissions.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;

@route("/Accounts/{AccountSid}/Queues")
namespace CompatibilityAPI.Queues {
  @tag(QUEUES_TAG)
  @friendlyName("Queues")
  interface Queues {
    @operationId("list_queues")
    @summary("List All Queues")
    @doc("""
      Lists the account's voice queues. Queues hold callers until an application is ready to handle them, and each is managed by Queue SID. The SignalWire REST [Queues API](/docs/apis/rest/queues/list-queues) exposes the same queues through JSON routes.
      
      ${tokenPermissions<"_Voice_">}
      """)
    list(
      ...QueuesAccountSidPath,

      @query
      @doc("The page number to retrieve (zero-indexed).")
      @minValue(0)
      @example(0)
      Page?: int32 = 0,

      @query
      @doc("The number of results per page. Default is 50, maximum is 1000.")
      @minValue(1)
      @maxValue(1000)
      @example(50)
      PageSize?: int32 = 50,

      @query
      @doc("Token for cursor-based pagination. Required when navigating to pages beyond the first.")
      @example("PAb3877c40-da60-4998-90ad-b792e98472qu")
      PageToken?: string,
    ):
      | QueueListResponse
      | CompatibilityStatusCode400
      | CompatibilityStatusCode401
      | CompatibilityStatusCode422;

    @operationId("create_queue")
    @summary("Create a Queue")
    @doc("""
      Creates a voice queue in the account to hold callers until an application dequeues them. Queue names must be unique among the account's active queues; a deleted queue's name can be reused. Use SignalWire REST [Create queue](/docs/apis/rest/queues/create-queue) for JSON requests; a queue created through either route is available through both APIs.
      
      ${tokenPermissions<"_Voice_">}
      """)
    @post
    create(
      ...QueuesAccountSidPath,
      @header contentType: "application/x-www-form-urlencoded",
      @body body: CreateQueueRequest,
    ):
      | QueueCreatedResponse
      | CompatibilityStatusCode400
      | CompatibilityStatusCode401
      | CompatibilityStatusCode422;

    @operationId("retrieve_queue")
    @summary("Retrieve a Queue")
    @doc("""
      Retrieves one voice queue by SID so you can inspect its configuration and current occupancy. Use [List All Queues](/docs/compatibility-api/rest/queues/list-queues) to discover SIDs, or SignalWire REST [Get queue](/docs/apis/rest/queues/get-queue) for a resource ID.
      
      ${tokenPermissions<"_Voice_">}
      """)
    @route("/{Sid}")
    read(...QueuesAccountSidPath, ...QueueSidPath):
      | QueueResponse
      | CompatibilityStatusCode400
      | CompatibilityStatusCode401
      | CompatibilityStatusCode404;

    @operationId("update_queue")
    @summary("Update a Queue")
    @doc("""
      Changes how a voice queue is identified or how many callers it can hold. A new name must remain unique among the account's active queues. Use Queue Members operations to inspect or dequeue callers currently waiting.
      
      ${tokenPermissions<"_Voice_">}
      """)
    @post
    @route("/{Sid}")
    update(
      ...QueuesAccountSidPath,
      ...QueueSidPath,
      @header contentType: "application/x-www-form-urlencoded",
      @body body: UpdateQueueRequest,
    ):
      | QueueResponse
      | CompatibilityStatusCode400
      | CompatibilityStatusCode401
      | CompatibilityStatusCode404
      | CompatibilityStatusCode422;

    @operationId("delete_queue")
    @summary("Delete a Queue")
    @doc("""
      Deletes an empty call queue by SID. A queue with waiting members cannot be deleted and returns a validation error; dequeue its callers before retrying. This removes the same queue that SignalWire REST [Delete queue](/docs/apis/rest/queues/delete-queue) manages.
      
      ${tokenPermissions<"_Voice_">}
      """)
    @delete
    @route("/{Sid}")
    delete(...QueuesAccountSidPath, ...QueueSidPath):
      | CompatibilityStatusCode204
      | CompatibilityStatusCode400
      | CompatibilityStatusCode401
      | CompatibilityStatusCode404
      | CompatibilityStatusCode422;
  }

  @tag(QUEUE_MEMBERS_TAG)
  @friendlyName("Queue Members")
  @route("/{QueueSid}/Members")
  interface QueueMembers {
    @operationId("list_all_queue_members")
    @summary("List All Queue Members")
    @doc("""
      Returns the callers currently waiting in one queue, ordered by enqueue time. Use it to inspect position and wait duration or locate a Call SID to dequeue. The SignalWire REST [Queue Members API](/docs/apis/rest/queue-members/list-queue-members) reads the same waiting calls, identifying each by a member ID rather than a Call SID.
      
      ${tokenPermissions<"_Voice_">}
      """)
    list(
      ...QueuesAccountSidPath,
      ...QueueSidPathForMembers,

      @query
      @doc("The page number to retrieve (zero-indexed).")
      @minValue(0)
      @example(0)
      Page?: int32 = 0,

      @query
      @doc("The number of results per page. Default is 50, maximum is 1000.")
      @minValue(1)
      @maxValue(1000)
      @example(50)
      PageSize?: int32 = 50,

      @query
      @doc("Token for cursor-based pagination. Required when navigating to pages beyond the first.")
      @example("PAb3877c40-da60-4998-90ad-b792e98472me")
      PageToken?: string,
    ):
      | QueueMemberListResponse
      | CompatibilityStatusCode400
      | CompatibilityStatusCode401
      | CompatibilityStatusCode404
      | CompatibilityStatusCode422;

    @operationId("retrieve_queue_member")
    @summary("Retrieve a Queue Member")
    @doc("""
      Retrieves one waiting caller by Call SID, or the caller at the front of the queue when `Front` is used. Use [List All Queue Members](/docs/compatibility-api/rest/queue-members/list-all-queue-members) to inspect the full waiting order. The native API reads the same waiting calls by member ID, with [Get next queue member](/docs/apis/rest/queue-members/retrieve-next-queue-member) in place of the `Front` selector.
      
      ${tokenPermissions<"_Voice_">}
      """)
    @route("/{CallSid}")
    read(
      ...QueuesAccountSidPath,
      ...QueueSidPathForMembers,
      ...QueueMemberCallSidPath,
    ):
      | QueueMemberResponse
      | CompatibilityStatusCode400
      | CompatibilityStatusCode401
      | CompatibilityStatusCode404;

    @operationId("update_queue_member")
    @summary("Update a Queue Member")
    @doc("""
      Dequeues a waiting caller and redirects the call to cXML instructions at the supplied URL. Identify the caller by Call SID, or use `Front` to dequeue the first caller. This is live call control; native [Queue Members](/docs/apis/rest/queue-members/list-queue-members) can inspect waiting calls but do not provide this cXML redirect operation.
      
      ${tokenPermissions<"_Voice_">}
      """)
    @post
    @route("/{CallSid}")
    update(
      ...QueuesAccountSidPath,
      ...QueueSidPathForMembers,
      ...QueueMemberCallSidPath,
      @header contentType: "application/x-www-form-urlencoded",
      @body body: UpdateQueueMemberRequest,
    ):
      | QueueMemberResponse
      | CompatibilityStatusCode400
      | CompatibilityStatusCode401
      | CompatibilityStatusCode404
      | CompatibilityStatusCode422
      | CompatibilityStatusCode503;
  }
}

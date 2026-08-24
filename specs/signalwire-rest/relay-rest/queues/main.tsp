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

@route("/queues")
namespace SignalWireAPI.RelayRest.Queues {
  @tag(QUEUES_TAG)
  @friendlyName("Queues")
  interface Queues {
    @operationId("list_queues")
    @summary("List queues")
    @doc("""
      Lists the voice call queues in your SignalWire project. Queues hold callers until your call workflow is ready to handle them. The Compatibility API's [List queues](/docs/compatibility-api/rest/queues/list-queues) exposes the same queues through SID-based routes.
      
      ${tokenPermissions<"_Voice_">}
      """)
    list(): QueueListResponse | StatusCode401 | ValidationError | StatusCode500;

    @operationId("create_queue")
    @summary("Create queue")
    @doc("""
      Creates a voice call queue in the project for calls that need to wait for later handling. Queue names must be unique among active queues; a deleted queue's name can be reused. The call workflow is responsible for placing callers into the queue. Use Compatibility [Create queue](/docs/compatibility-api/rest/queues/create-queue) for form-encoded requests.
      
      ${tokenPermissions<"_Voice_">}
      """)
    @post
    create(@body body: CreateQueueRequest):
      | {
          @statusCode statusCode: 201;
          @body queue: QueueResponse;
        }
      | StatusCode401
      | ValidationError
      | StatusCode500;

    @operationId("get_queue")
    @summary("Get queue")
    @doc("""
      Retrieves one voice call queue from your SignalWire project. Use [List queues](/docs/apis/rest/queues/list-queues) to find queues or [List queue members](/docs/apis/rest/queue-members/list-queue-members) to inspect the calls currently waiting in one.
      
      ${tokenPermissions<"_Voice_">}
      """)
    read(...QueuePathID):
      | QueueResponse
      | StatusCode401
      | StatusCode404
      | ValidationError
      | StatusCode500;

    @operationId("update_queue")
    @summary("Update queue")
    @doc("""
      Changes how a project voice queue is identified or how many callers it can hold. A new name must remain unique among the project's active queues. Queue-member positions and wait times are read through the Queue Members endpoints. The Compatibility API updates the same queues through its SID-based route.
      
      ${tokenPermissions<"_Voice_">}
      """)
    @put
    update(...QueuePathID, @body body: UpdateQueueRequest):
      | {
          @statusCode statusCode: 200;
          @body queue: QueueResponse;
        }
      | StatusCode400
      | StatusCode401
      | ValidationError
      | StatusCode500;

    @operationId("delete_queue")
    @summary("Delete queue")
    @doc("""
      Deletes a voice call queue by ID. The queue must be empty; a queue with waiting callers returns a validation error. This removes the same queue that the Compatibility [Delete queue](/docs/compatibility-api/rest/queues/delete-queue) operation manages.
      
      ${tokenPermissions<"_Voice_">}
      """)
    @delete
    delete(...QueuePathID):
      | {
          @statusCode statusCode: 204;
        }
      | StatusCode400
      | StatusCode401
      | StatusCode404
      | StatusCode500;
  }

  @tag(QUEUE_MEMBERS_TAG)
  @friendlyName("Queue Members")
  @route("/{queue_id}/members")
  interface QueueMembers {
    @operationId("list_queue_members")
    @summary("List queue members")
    @doc("""
      Lists the calls currently waiting in one voice queue. Use it to monitor the queue and decide which caller to handle next; use [List queues](/docs/apis/rest/queues/list-queues) to find queues, or Compatibility [List all queue members](/docs/compatibility-api/rest/queue-members/list-all-queue-members) for SID-based routes.
      
      ${tokenPermissions<"_Voice_">}
      """)
    @get
    listMembers(...QueueIdPath):
      | QueueMemberListResponse
      | StatusCode401
      | StatusCode404
      | StatusCode500;

    @operationId("retrieve_next_queue_member")
    @summary("Get next queue member")
    @doc("""
      Retrieves the call at the front of one voice queue without removing it. Use it to inspect which waiting caller would be handled next; use [Get queue member](/docs/apis/rest/queue-members/retrieve-queue-member) for a specific member ID. This read does not dequeue or redirect the call.
      
      ${tokenPermissions<"_Voice_">}
      """)
    @route("/next")
    @get
    getNextMember(...QueueIdPath):
      | QueueMemberResponse
      | StatusCode401
      | StatusCode404
      | StatusCode500;

    @operationId("retrieve_queue_member")
    @summary("Get queue member")
    @doc("""
      Retrieves one call that is waiting in a voice queue. Use [List queue members](/docs/apis/rest/queue-members/list-queue-members) to find waiting calls or [Get next queue member](/docs/apis/rest/queue-members/retrieve-next-queue-member) to inspect the caller at the front of the queue.
      
      ${tokenPermissions<"_Voice_">}
      """)
    @route("/{id}")
    @get
    getMember(...QueueIdPath, ...QueueMemberPathID):
      | QueueMemberResponse
      | StatusCode401
      | StatusCode404
      | StatusCode500;
  }
}

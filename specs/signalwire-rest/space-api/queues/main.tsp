import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "../../types";
import "../tags.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using Types.StatusCodes;

@route("/queues")
namespace SpaceAPI.Queues {
  @tag(QUEUES_TAG)
  @friendlyName("Queues")
  interface Queues {
    @operationId("list_queues")
    @summary("List all Queues")
    @doc("""
      Returns a list of your queues.

      #### Permissions
      The API token must include the following scopes: _Voice_.
      """)
    list(): QueueListResponse | StatusCode401 | StatusCode500;

    @operationId("create_queue")
    @summary("Create a Queue")
    @doc("""
      Creates a new queue.

      #### Permissions
      The API token must include the following scopes: _Voice_.
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
    @summary("Retrieve a Queue")
    @doc("""
      Retrieves the details of a queue.

      #### Permissions
      The API token must include the following scopes: _Voice_.
      """)
    read(...QueuePathID): QueueResponse | StatusCode401 | StatusCode404 | StatusCode500;

    @operationId("update_queue")
    @summary("Update a Queue")
    @doc("""
      Updates a queue.

      #### Permissions
      The API token must include the following scopes: _Voice_.
      """)
    @put
    update(...QueuePathID, @body body: UpdateQueueRequest):
      | {
          @statusCode statusCode: 200;
          @body queue: QueueResponse;
        }
      | StatusCode401
      | StatusCode404
      | ValidationError
      | StatusCode500;

    @operationId("delete_queue")
    @summary("Delete a Queue")
    @doc("""
      Deletes a queue.

      #### Permissions
      The API token must include the following scopes: _Voice_.
      """)
    @delete
    delete(...QueuePathID):
      | {
          @statusCode statusCode: 204;
        }
      | StatusCode401
      | StatusCode404
      | StatusCode500;

    @operationId("list_queue_members")
    @summary("List Queue Members")
    @doc("""
      Returns a list of members in a queue.

      #### Permissions
      The API token must include the following scopes: _Voice_.
      """)
    @route("/{QueueId}/members")
    @get
    listMembers(...QueueIdPath): QueueMemberListResponse | StatusCode401 | StatusCode404 | StatusCode500;

    @operationId("get_queue_member")
    @summary("Retrieve a Queue Member")
    @doc("""
      Retrieves the details of a queue member.

      #### Permissions
      The API token must include the following scopes: _Voice_.
      """)
    @route("/{QueueId}/members/{call_sid}")
    @get
    getMember(...QueueIdPath, ...QueueMemberPathID): QueueMemberResponse | StatusCode401 | StatusCode404 | StatusCode500;

    @operationId("dequeue_member")
    @summary("Dequeue a Member")
    @doc("""
      Removes a member from the queue and optionally redirects the call.

      #### Permissions
      The API token must include the following scopes: _Voice_.
      """)
    @route("/{QueueId}/members/{call_sid}")
    @post
    dequeueMember(...QueueIdPath, ...QueueMemberPathID, @body body: DequeueMemberRequest):
      | {
          @statusCode statusCode: 200;
          @body member: QueueMemberResponse;
        }
      | StatusCode401
      | StatusCode404
      | ValidationError
      | StatusCode500;
  }
}

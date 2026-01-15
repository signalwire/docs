import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "../_shared/errors.tsp";
import "../tags.tsp";

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
      The ability to read all of the queues that are associated with your account. This will be returned as a list of queues.

      #### Permissions
      The API token must include the following scopes: _Voice_.
      """)
    list(
      ...QueuesAccountSidPath,
      @query @doc("A description that distinguishes a queue.") @example("Queue1") FriendlyName?: string,
      @query @doc("The maximum number of calls that are allowed to wait in a queue.") @example("123") MaxSize?: string,
    ): QueueListResponse | CompatibilityStatusCode401;

    @operationId("create_queue")
    @summary("Create a Queue.")
    @doc("""
      Create a call queue.

      #### Permissions
      The API token must include the following scopes: _Voice_.
      """)
    @post
    create(
      ...QueuesAccountSidPath,
      @header contentType: "application/x-www-form-urlencoded",
      @body body: CreateQueueRequest,
    ): QueueResponse | CompatibilityStatusCode401 | CompatibilityStatusCode400;

    @operationId("retrieve_queue")
    @summary("Retrieve a Queue.")
    @doc("""
      Retrieve a single queue.

      #### Permissions
      The API token must include the following scopes: _Voice_.
      """)
    @route("/{Sid}")
    read(...QueuesAccountSidPath, ...QueueSidPath): QueueResponse | CompatibilityStatusCode401 | CompatibilityStatusCode404;

    @operationId("update_queue")
    @summary("Update a Queue.")
    @doc("""
      Allows you to modify the properties of a single call queue.

      #### Permissions
      The API token must include the following scopes: _Voice_.
      """)
    @post
    @route("/{Sid}")
    update(
      ...QueuesAccountSidPath,
      ...QueueSidPath,
      @header contentType: "application/x-www-form-urlencoded",
      @body body: UpdateQueueRequest,
    ): QueueResponse | CompatibilityStatusCode401 | CompatibilityStatusCode404;

    @operationId("delete_queue")
    @summary("Delete a Queue.")
    @doc("""
      Delete a single call queue. Only empty queues can be deleted. If the delete is successful, a 204 response, with no body, will be returned.

      #### Permissions
      The API token must include the following scopes: _Voice_.
      """)
    @delete
    @route("/{Sid}")
    delete(...QueuesAccountSidPath, ...QueueSidPath): CompatibilityStatusCode204 | CompatibilityStatusCode401 | CompatibilityStatusCode404;
  }

  @tag(QUEUE_MEMBERS_TAG)
  @friendlyName("Queue Members")
  @route("/{QueueSid}/Members")
  interface QueueMembers {
    @operationId("list_all_queue_members")
    @summary("List All Queue Members")
    @doc("""
      The ability to read all of the queue members that are waiting in a particular queue. This will be returned as a list of members.

      #### Permissions
      The API token must include the following scopes: _Voice_.
      """)
    list(...QueuesAccountSidPath, ...QueueSidPathForMembers): QueueMemberListResponse | CompatibilityStatusCode401;

    @operationId("retrieve_queue_member")
    @summary("Retrieve a Queue Member")
    @doc("""
      Retrieve a single queue member.

      #### Permissions
      The API token must include the following scopes: _Voice_.
      """)
    @route("/{CallSid}")
    read(...QueuesAccountSidPath, ...QueueSidPathForMembers, ...QueueMemberCallSidPath): QueueMemberResponse | CompatibilityStatusCode401 | CompatibilityStatusCode404;

    @operationId("update_queue_member")
    @summary("Update a Queue Member")
    @doc("""
      Dequeue a member from a queue and redirect them to a new URL.

      #### Permissions
      The API token must include the following scopes: _Voice_.
      """)
    @post
    @route("/{CallSid}")
    update(
      ...QueuesAccountSidPath,
      ...QueueSidPathForMembers,
      ...QueueMemberCallSidPath,
      @query @doc("The URL to handle after dequeuing the member. This parameter lets you specify a webhook or different route in your code containing XML instructions.") Url: string,
      @query @doc("Whether the request to `Url` is a `GET` or a `POST`. Default is `POST`.") Method?: "GET" | "POST",
    ): QueueMemberResponse | CompatibilityStatusCode401 | CompatibilityStatusCode404;
  }
}

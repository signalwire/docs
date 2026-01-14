import "./core.tsp";
import "../../_shared/pagination.tsp";

using TypeSpec.Http;

@doc("Response containing a list of queues.")
model QueueListResponse {
  ...Pagination;

  @doc("The unique identifier for this account.")
  @example("b3877c40-da60-4998-90ad-b792e98472ac")
  account_sid?: string;

  @doc("List of queues.")
  queues?: Queue[];
}

@doc("Response containing a single queue.")
model QueueResponse {
  ...Queue;
}

@doc("Response containing a list of queue members.")
model QueueMemberListResponse {
  ...Pagination;

  @doc("List of queue members.")
  queue_members?: QueueMember[];
}

@doc("Response containing a single queue member.")
model QueueMemberResponse {
  ...QueueMember;
}

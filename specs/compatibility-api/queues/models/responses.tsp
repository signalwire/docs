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

  @doc("The name of object.")
  @example("0")
  end?: string;

  @doc("The URI for the last page.")
  @example("/api/laml/2010-04-01/Accounts/b3877c40-da60-4998-90ad-b792e98472ac/Queues/b3877c40-da60-4998-90ad-b792e98472qu/Members.json?Page=0&PageSize=50")
  last_page_uri?: string;

  @doc("The name of object.")
  @example("1")
  num_pages?: string;

  @doc("The name of object.")
  @example("0")
  start?: string;

  @doc("The name of object.")
  @example("1")
  total?: string;

  @doc("The unique identifier for account.")
  @example("b3877c40-da60-4998-90ad-b792e98472ac")
  account_sid?: string;

  @doc("The unique identifier for queue.")
  @example("b3877c40-da60-4998-90ad-b792e98472qu")
  queue_sid?: string;

  @doc("List of queue members.")
  queue_members?: QueueMember[];
}

@doc("Response containing a single queue member.")
model QueueMemberResponse {
  ...QueueMember;
}

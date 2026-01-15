import "./core.tsp";
import "../../_shared/pagination.tsp";

using TypeSpec.Http;

@doc("Response containing a list of messages.")
model MessageListResponse {
  ...Pagination;

  @doc("List of messages.")
  messages?: Message[];
}

@doc("Response containing a single message.")
model MessageResponse {
  ...Message;
}

@doc("Response containing a list of message media.")
model MessageMediaListResponse {
  ...Pagination;

  @doc("List of media.")
  media_list?: MessageMedia[];
}

@doc("Response containing a single message media.")
model MessageMediaResponse {
  ...MessageMedia;
}

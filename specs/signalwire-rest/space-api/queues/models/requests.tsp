import "./core.tsp";

using TypeSpec.Http;

@doc("Request body for creating a queue.")
model CreateQueueRequest {
  @doc("The name of the queue.")
  @example("Support Queue")
  name: string;

  @doc("The maximum number of callers allowed in the queue.")
  @example(100)
  max_size?: int32 = 100;
}

@doc("Request body for updating a queue.")
model UpdateQueueRequest {
  @doc("The name of the queue.")
  @example("Support Queue")
  name?: string;

  @doc("The maximum number of callers allowed in the queue.")
  @example(100)
  max_size?: int32;
}

@doc("Request body for dequeuing a member.")
model DequeueMemberRequest {
  @doc("The URL to redirect the call to after dequeuing.")
  url?: string;

  @doc("The HTTP method to use for the redirect URL.")
  method?: "GET" | "POST";
}

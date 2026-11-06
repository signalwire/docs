import "./core.tsp";

using TypeSpec.Http;

@doc("Request body for creating a queue.")
model CreateQueueRequest {
  @doc("The name of the queue. Must be unique among the project's active queues.")
  @example("Name 2")
  name: string;

  @doc("The maximum number of callers allowed in the queue. Must be an integer greater than 0. Omit it or send `null` for no maximum.")
  @example(600)
  @minValue(1)
  max_size?: int32 | null;
}

@doc("Request body for updating a queue.")
model UpdateQueueRequest {
  @doc("The name of the queue. Must be unique among the project's active queues.")
  @example("Name 2")
  name?: string;

  @doc("The maximum number of callers allowed in the queue. Must be an integer greater than 0. Send `null` to remove the maximum.")
  @example(600)
  @minValue(1)
  max_size?: int32 | null;
}

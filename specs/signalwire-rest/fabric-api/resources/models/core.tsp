import "../../../types";

using TypeSpec.Http;

model ResourcePathID {
  @doc("Unique ID of a Resource.")
  @example("3fa85f64-5717-4562-b3fc-2c963f66afa6")
  @path
  id: uuid
}

model ResourceID {
  @doc("Unique ID of a Resource.")
  resource_id: uuid
}

model Resource {
  @doc("Display name of the Resource")
  @example("My Resource")
  display_name: string;

  @doc("Type of the Resource")
  @example("ai_agent")
  type: string;

  @doc("Resource-specific data")
  data?: Record<unknown>;
}

model ResourceWithID {
  ...ResourceID,
  ...Resource
}
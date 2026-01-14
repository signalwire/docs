import "./core.tsp";

using TypeSpec.Http;

@doc("Request body for creating a number group.")
model CreateNumberGroupRequest {
  @doc("The name of the number group.")
  @example("Sales Team Numbers")
  name: string;

  @doc("Whether the number group is sticky.")
  sticky?: boolean;
}

@doc("Request body for updating a number group.")
model UpdateNumberGroupRequest {
  @doc("The name of the number group.")
  @example("Sales Team Numbers")
  name?: string;

  @doc("Whether the number group is sticky.")
  sticky?: boolean;
}

@doc("Request body for adding a phone number to a number group.")
model AddNumberGroupMembershipRequest {
  @doc("The phone number ID to add to the group.")
  @example("3fa85f64-5717-4562-b3fc-2c963f66afa6")
  @format("uuid")
  phone_number_id: uuid;
}

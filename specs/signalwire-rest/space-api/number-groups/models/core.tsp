import "../../../types";

using TypeSpec.Http;
using Types;

model NumberGroupPathID {
  @doc("Unique ID of the number group.")
  @example("3fa85f64-5717-4562-b3fc-2c963f66afa6")
  @format("uuid")
  @path
  id: uuid;
}

model NumberGroupIdPath {
  @doc("Unique ID of the number group.")
  @example("3fa85f64-5717-4562-b3fc-2c963f66afa6")
  @format("uuid")
  @path
  NumberGroupId: uuid;
}

model NumberGroupMembershipPathID {
  @doc("Unique ID of the number group membership.")
  @example("3fa85f64-5717-4562-b3fc-2c963f66afa6")
  @format("uuid")
  @path
  id: uuid;
}

@doc("Number group model.")
model NumberGroup {
  @doc("The unique identifier of the Number Group on SignalWire. This can be used to update or delete the group programmatically.")
  @example("3fa85f64-5717-4562-b3fc-2c963f66afa6")
  @format("uuid")
  id: uuid;

  @doc("The name given to the number group. Helps to distinguish different groups within your project.")
  @example("My Number Group")
  name: string;

  @doc("Whether the number group uses the same 'From' number for outbound requests to a number, or chooses a random one. Defaults to false.")
  @example(false)
  sticky_sender?: boolean;

  @doc("The number of phone numbers within the group.")
  @example(4)
  phone_number_count?: int32;
}

@doc("Number group membership model.")
model NumberGroupMembership {
  @doc("The unique identifier of the membership.")
  @example("3fa85f64-5717-4562-b3fc-2c963f66afa6")
  @format("uuid")
  id: uuid;

  @doc("The number group ID.")
  @example("3fa85f64-5717-4562-b3fc-2c963f66afa6")
  @format("uuid")
  number_group_id: uuid;

  @doc("The phone number ID.")
  @example("3fa85f64-5717-4562-b3fc-2c963f66afa6")
  @format("uuid")
  phone_number_id: uuid;

  @doc("The phone number in E.164 format.")
  @example("+15551234567")
  phone_number?: string;

  @doc("Timestamp when the membership was created.")
  created_at?: utcDateTime;
}

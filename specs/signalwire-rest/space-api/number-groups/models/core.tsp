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
  @doc("The unique identifier of the number group.")
  @example("3fa85f64-5717-4562-b3fc-2c963f66afa6")
  @format("uuid")
  id: uuid;

  @doc("The name of the number group.")
  @example("Sales Team Numbers")
  name: string;

  @doc("Whether the number group is sticky.")
  sticky?: boolean;

  @doc("Timestamp when the number group was created.")
  created_at?: utcDateTime;

  @doc("Timestamp when the number group was last updated.")
  updated_at?: utcDateTime;
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

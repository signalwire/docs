import "../../../types";

using TypeSpec.Http;
using Types;

model QueuePathID {
  @doc("Unique ID of the queue.")
  @example("3fa85f64-5717-4562-b3fc-2c963f66afa6")
  @format("uuid")
  @path
  id: uuid;
}

model QueueIdPath {
  @doc("Unique ID of the queue.")
  @example("3fa85f64-5717-4562-b3fc-2c963f66afa6")
  @format("uuid")
  @path
  QueueId: uuid;
}

model QueueMemberPathID {
  @doc("Unique ID of the queue member (call SID).")
  @example("3fa85f64-5717-4562-b3fc-2c963f66afa6")
  @path
  call_sid: string;
}

@doc("Queue model.")
model Queue {
  @doc("The unique identifier of the queue.")
  @example("3fa85f64-5717-4562-b3fc-2c963f66afa6")
  @format("uuid")
  id: uuid;

  @doc("The name of the queue.")
  @example("Support Queue")
  name: string;

  @doc("The maximum number of callers allowed in the queue.")
  @example(100)
  max_size?: int32 = 100;

  @doc("The current number of callers in the queue.")
  @example(5)
  current_size?: int32;

  @doc("The average wait time in seconds.")
  @example(120)
  average_wait_time?: int32;

  @doc("Timestamp when the queue was created.")
  created_at?: utcDateTime;

  @doc("Timestamp when the queue was last updated.")
  updated_at?: utcDateTime;
}

@doc("Queue member model.")
model QueueMember {
  @doc("The call SID of the queue member.")
  @example("CA1234567890abcdef1234567890abcdef")
  call_sid: string;

  @doc("The queue ID.")
  @example("3fa85f64-5717-4562-b3fc-2c963f66afa6")
  @format("uuid")
  queue_id: uuid;

  @doc("The phone number of the caller.")
  @example("+15551234567")
  from?: string;

  @doc("The phone number called.")
  @example("+15559876543")
  to?: string;

  @doc("The position in the queue.")
  @example(1)
  position?: int32;

  @doc("The wait time in seconds.")
  @example(60)
  wait_time?: int32;

  @doc("Timestamp when the member joined the queue.")
  date_enqueued?: utcDateTime;
}

using TypeSpec.Http;

model QueuesAccountSidPath {
  @doc("The unique identifier for the account this Queue is associated with.")
  @example("b3877c40-da60-4998-90ad-b792e98472af")
  @format("uuid")
  @path
  AccountSid: string;
}

model QueueSidPath {
  @doc("The unique identifier for the queue.")
  @example("b3877c40-da60-4998-90ad-b792e98472qu")
  @format("uuid")
  @path
  Sid: string;
}

model QueueSidPathForMembers {
  @doc("The unique identifier for the queue.")
  @example("b3877c40-da60-4998-90ad-b792e98472qu")
  @format("uuid")
  @path
  QueueSid: string;
}

model QueueMemberCallSidPath {
  @doc("The unique identifier for the call.")
  @example("b3877c40-da60-4998-90ad-b792e98472ca")
  @format("uuid")
  @path
  CallSid: string;
}

@doc("Queue model.")
model Queue {
  @doc("The unique identifier for the account this Queue is associated with.")
  @example("b3877c40-da60-4998-90ad-b792e98472af")
  account_sid?: string;

  @doc("The average wait time, in seconds, of callers in a queue.")
  @example("0")
  average_wait_time?: string;

  @doc("The number of calls waiting in the queue.")
  @example("0")
  current_size?: string;

  @doc("The date and time, in ISO 8601 format, the Queue was created.")
  @example("Wed, 26 Sept 2018 18:00:00 +0000")
  date_created?: string;

  @doc("The date and time, in ISO 8601 format, the Queue was updated.")
  @example("Thur, 27 Sept 2018 19:00:00 +0000")
  date_updated?: string;

  @doc("A description that distinguishes a queue.")
  @example("Queue1")
  friendly_name?: string;

  @doc("The maximum number of calls that are allowed to wait in a queue.")
  @example("123")
  max_size?: string;

  @doc("The unique identifier for the queue.")
  @example("b3877c40-da60-4998-90ad-b792e98472qu")
  sid?: string;

  @doc("The URL of this resource.")
  uri?: string;
}

@doc("Queue member model.")
model QueueMember {
  @doc("The unique identifier for the call.")
  @example("b3877c40-da60-4998-90ad-b792e98472ca")
  call_sid?: string;

  @doc("The date and time, in RFC 2822 format, the member was enqueued.")
  @example("Wed, 26 Sept 2018 18:00:00 +0000")
  date_enqueued?: string;

  @doc("The position of the member in the queue.")
  @example(1)
  position?: int32;

  @doc("The wait time, in seconds, of the member in the queue.")
  @example("0")
  wait_time?: string;

  @doc("The URI of this resource.")
  uri?: string;
}

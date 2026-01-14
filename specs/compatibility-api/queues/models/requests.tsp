using TypeSpec.Http;

@doc("Request body for creating a queue.")
model CreateQueueRequest {
  @doc("A description that distinguishes a queue.")
  @example("Queue1")
  FriendlyName: string;

  @doc("The maximum number of calls that are allowed to wait in a queue.")
  @example("123")
  MaxSize?: string;
}

@doc("Request body for updating a queue.")
model UpdateQueueRequest {
  @doc("A description that distinguishes a queue.")
  @example("Queue1")
  FriendlyName: string;

  @doc("The maximum number of calls that are allowed to wait in a queue.")
  @example("123")
  MaxSize?: string;
}

@doc("Request body for updating a queue member.")
model UpdateQueueMemberRequest {
  @doc("The URL to send the dequeued member to.")
  @example("http://your-application.com/docs/voice.xml")
  Url: string;

  @doc("Whether the request to Url is a `GET` or a `POST`. Default is `POST`.")
  @example("POST")
  Method?: "GET" | "POST";
}

import "@typespec/http";
import "./core.tsp";

using TypeSpec.Http;

namespace SignalWireAPI.Message;

@doc("Response returned when a message is successfully created and queued for delivery.")
model CreateMessageResponse {
  @statusCode
  statusCode: 201;

  @body
  body: Message;
}

@doc("Response returned when a message has been successfully redacted.")
model UpdateMessageResponse {
  @statusCode
  statusCode: 200;

  @body
  body: Message;
}

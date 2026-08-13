import "@typespec/http";

using TypeSpec.Http;

@doc("Webhook received")
model WebhookAck {
  @statusCode statusCode: 200;
}

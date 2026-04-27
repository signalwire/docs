import "@typespec/http";
import "../../../types";
import "../../../_globally_shared/const.tsp";

using TypeSpec.Http;

namespace SignalWireAPI.Message;

@doc("Path parameter identifying the target message by its segment ID.")
model MessagePathID {
  @path
  @format("uuid")
  @doc("The message segment ID — the same ID returned by the create endpoint and shown in `/api/messaging/logs`.")
  @example("c2d3e4f5-a6b7-8901-cdef-234567890abc")
  message_id: string;
}

@doc("Delivery state of a message.")
enum MessageStatus {
  @doc("Message has been created and queued for delivery.")
  queued,

  @doc("Message delivery has been initiated.")
  initiated,

  @doc("Message has been sent to the carrier network.")
  sent,

  @doc("Message was successfully delivered to the recipient.")
  delivered,

  @doc("Message could not be delivered to the recipient.")
  undelivered,

  @doc("Message delivery failed. Check `error_code` and `error_message` for details.")
  failed,

  @doc("Message has been read by the recipient (when supported by the channel).")
  read,
}

@doc("The direction of a message.")
enum MessageDirection {
  @doc("A message received by the project.")
  inbound,

  @doc("A message sent from the project.")
  outbound,
}

@doc("The kind of message.")
enum MessageKind {
  @doc("SMS text message.")
  sms,

  @doc("MMS message containing media.")
  mms,
}

@doc("A message record. Returned by the create and update endpoints.")
model Message {
  @format("uuid")
  @doc("The unique ID of the message. This is the `MessageSegment` ID, consistent with the dashboard and the `/api/messaging/logs` endpoint.")
  @example("c2d3e4f5-a6b7-8901-cdef-234567890abc")
  id: uuid;

  @doc("The source phone number.")
  @example("+15559876543")
  from: string;

  @doc("The destination phone number.")
  @example("+15551234567")
  to: string;

  @doc("The message body text. Returns an empty string when the message has been redacted.")
  @example("Your order #12345 has shipped!")
  body: string;

  @doc("Delivery state of the message.")
  @example(MessageStatus.queued)
  status: MessageStatus;

  @doc("The direction of the message.")
  @example(MessageDirection.outbound)
  direction: MessageDirection;

  @doc("The kind of message.")
  @example(MessageKind.sms)
  kind: MessageKind;

  @doc("Array of URLs for any media attachments on the message. Empty for SMS.")
  @example(#[])
  media: url[];

  @doc("Number of segments the message body was split into for delivery.")
  @example(1)
  number_of_segments: int32;

  @doc("Provider-specific error code if delivery failed. Null when no error occurred.")
  @example(null)
  error_code: string | null;

  @doc("Human-readable error message if delivery failed. Null when no error occurred.")
  @example(null)
  error_message: string | null;

  @doc("Date and time when the message was created.")
  @example(UTC_TIME_EXAMPLE)
  created_at: utcDateTime;

  @format("uuid")
  @doc("The ID of the project the message belongs to.")
  @example("a1b2c3d4-e5f6-7890-abcd-ef1234567890")
  project_id: uuid;

  @doc("Callback URL configured to receive message status events. Null if no callback was configured.")
  @example(null)
  status_callback_url: url | null;

  @doc("Relative URL for retrieving the message via the `/api/messaging/logs` endpoint.")
  @example("/api/messaging/logs/c2d3e4f5-a6b7-8901-cdef-234567890abc")
  message_uri: string;
}
